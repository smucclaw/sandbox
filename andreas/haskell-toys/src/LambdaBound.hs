{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE IncoherentInstances #-}
{-# LANGUAGE ImplicitParams #-}
module LambdaBound where

import Bound
import Control.Monad (ap)
import Data.Functor.Classes

newtype Var4 s = Var4 s

-- Untyped quasi-HOAS using the runST trick
data Exp4 (g :: [*]) where
    Z4 :: Var4 s -> Exp4 (s ': g)
    S4 :: Exp4 gs -> Exp4 (g ': gs)
    (:@&) :: Exp4 g -> Exp4 g -> Exp4 g
    Lam4 :: (forall s. Var4 s -> Exp4 (s ': g)) -> Exp4 g

map4 :: (Exp4 g -> Exp4 h) -> Exp4 (s : g) -> Exp4 (s : h)
map4 f (Z4 vs) = Z4 vs
map4 f (S4 x) = S4 $ f x
map4 f (a :@& b) = map4 f a :@& map4 f b
map4 f (Lam4 x) = Lam4 $ map4 (map4 f) . x

collapse4 :: Exp4 (Exp4 g ': g) -> Exp4 g
collapse4 (Z4 (Var4 s)) = s
collapse4 (S4 e) = e
collapse4 (a :@& b) = collapse4 a :@& collapse4 b
collapse4 (Lam4 f) = Lam4 $ map4 collapse4 . f

instantiate4 :: Exp4 g -> (forall s. Var4 s -> Exp4 (s ': g)) -> Exp4 g
instantiate4 k e = collapse4 $ e $ Var4 k

whnf4 :: Exp4 g -> Exp4 g
whnf4 (f :@& a) = case whnf4 f of
  Lam4 b -> whnf4 (instantiate4 a b)
  f'    -> f' :@& a
whnf4 e = e

lam4 :: (forall s. Exp4 (s : g) -> Exp4 (s : g)) -> Exp4 g
lam4 f = Lam4 $ f . Z4


infixl 9 :@
data Exp a = V a | Exp a :@ Exp a | Lam (Scope () Exp a)
  deriving (Functor,Foldable,Traversable)
instance Applicative Exp where pure = V; (<*>) = ap
instance Monad Exp where
  return = V
  V a      >>= f = f a
  (x :@ y) >>= f = (x >>= f) :@ (y >>= f)
  Lam e    >>= f = Lam (e >>>= f)
-- deriveEq1   ''Exp
-- deriveOrd1  ''Exp
-- deriveRead1 ''Exp
-- deriveShow1 ''Exp

data DummyShow a = DummyShow (Int -> a -> ShowS) ([a] -> ShowS) a

instance Show (DummyShow a) where
  showsPrec n (DummyShow sp sl a) = sp n a
--   showList (DummyShow sp sl a) = sp n a

data ShowRec a = ShowRec { shwPrec :: Int -> a -> ShowS}

newtype SmartShow a = SmartShow a

-- class WithShow
type HasShow a = (?shwPrc :: Int -> a -> ShowS)
-- instance HasShow a => Show (SmartShow a) where
instance Show (SmartShow a) where
  showsPrec n (SmartShow a) = sp n a
--   showList (SmartShow a) = sp n a

instance Show1 Exp where
  liftShowsPrec sp sl n e = showsPrec n $ fmap (DummyShow sp sl) e
  liftShowList sp sl = _

-- deriving instance Eq a => Eq (Exp a)
deriving instance Show a => Show (Exp a)
-- instance Eq a   => Eq   (Exp a) where (==) = eq1
-- instance Ord a  => Ord  (Exp a) where compare = compare1
-- instance Show a => Show (Exp a) where showsPrec = showsPrec1
-- instance Read a => Read (Exp a) where readsPrec = readsPrec1
lam :: Eq a => a -> Exp a -> Exp a
lam v b = Lam (abstract1 v b)
whnf :: Exp a -> Exp a
whnf (f :@ a) = case whnf f of
  Lam b -> whnf (instantiate1 a b)
  f'    -> f' :@ a
whnf e = e

-- Hybrid between HOAS and de Bruijn indices
data Exp2 a where
    Var2 :: a -> Exp2 a
    (:@#) :: Exp2 a -> Exp2 a -> Exp2 a
    Lam2 :: (forall s. s -> Scope s Exp2 a) -> Exp2 a
  deriving (Functor)

instance Show1 Exp2 where
  liftShowsPrec sp sl n e = showsPrec n $ fmap (DummyShow sp sl) e

instance Show a => Show (Exp2 a) where
  show = go $ map (:[]) ['a'..'z'] ++ map (('v':) . show) [1..]
    where
    go :: Show a => [String] -> Exp2 a -> String
    go _ (Var2 a) = "Var2 (" ++ show a ++ ")"
    go names ((:@#) a b) = "(" ++ go names a ++ ") :@# (" ++ go names b ++ ")"
    -- go (name: names) (Lam2 f) = "Lam2 (" ++ show (f name) ++ ")"
    go (name: names) (Lam2 f) = "Lam2 (" ++ go names (unscope (f name)) ++ ")"


type family Matches s a :: Bool where
    Matches s (Exp2 a) = Matches s a
    Matches s (Scope s Exp2 a) = True
    Matches s (Var s a) = True
    Matches s (Var s1 a) = False

class Contains s a where
  wrap :: s -> a

instance Contains s a => Contains s (Exp2 a) where
  wrap = Var2 . wrap

instance {-# OVERLAPPABLE #-} Contains s (Scope s Exp2 a) where
  wrap = Scope . Var2 . B
--   wrap = Scope . wrap

instance Contains s (Var s a) where
  wrap = B

instance {-# OVERLAPPING #-} Contains s a => Contains s (Var s1 a) where
  wrap = F . wrap

-- instance Contains True


-- lam2 :: (forall s. (forall x. Contains_ s x => x) -> Scope s Exp2 a) -> Exp2 a
-- lam2 f = Lam2 $ \s -> f (wrap s)
lam2 :: (forall s. (forall x. Contains s x => x) -> Exp2 (Var s (Exp2 a))) -> Exp2 a
lam2 f = Lam2 $ \s -> Scope $ f (wrap s)

{-# ANN ex1 "HLint: ignore Use id" #-}
{-# ANN ex2 "HLint: ignore Avoid lambda using `infix`" #-}

ex1 :: Exp2 ()
ex1 = lam2 \x -> x

ex2 :: Exp2 ()
ex2 = lam2 \x -> x :@# lam2 \y -> y :@# x

-- >>> ex1
-- >>> ex2
-- Lam2 (Var2 (B "a"))
-- Lam2 ((Var2 (B "a")) :@# (Lam2 ((Var2 (B "b")) :@# (Var2 (F Var2 (B "a"))))))



bindSingleVariable :: Monad f => (forall s. f s -> f s) -> Scope () f a
bindSingleVariable f = Scope . f $ pure (B ())