{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE EmptyCase #-}
{-# OPTIONS_GHC -fwarn-incomplete-patterns#-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeFamilyDependencies #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FunctionalDependencies #-}
module Stlc where


import Data.Data (Proxy(Proxy))
data Typ = T | Typ :-> Typ

data Idx (g :: [Typ]) (t :: Typ) where
    Z :: Idx (t ': ts) t
    S :: Idx gs t -> Idx (g ': gs) t

deriving instance Show (Idx g t)
deriving instance Eq (Idx g t)
data Exp (g :: [Typ]) (t :: Typ) where
    Var :: Idx g t -> Exp g t
    (:@) :: Exp g (t1 :-> t2) -> Exp g t1 -> Exp g t2
    Lam :: Exp (t1 ': g) t2 -> Exp g (t1 :-> t2)

infix 5 :@
deriving instance Show (Exp g t)

generalize :: Exp '[] t -> Exp g t
generalize = generalize2
-- generalize (Var i) = Var $ case i of {}
-- generalize (f :@ x) = generalize f :@ generalize x
-- generalize (Lam x) = Lam $ generalize2 x

-- generalize2 :: Proxy g2 -> Exp g1 t -> Exp (Concat g1 g2) t
generalize2 :: Concat1 g1 g2 g3 => Exp g1 t -> Exp g3 t
generalize2 (Var i) = Var $ generalizeIdx i
generalize2 (f :@ x) = generalize2 f :@ generalize2 x
generalize2 (Lam x) = Lam $ generalize2 x


class Concat1 (xs :: [Typ]) (ys :: [Typ]) (zs :: [Typ])
    | xs ys -> zs, zs xs -> ys where
  generalizeIdx :: Idx xs t -> Idx zs t
instance Concat1 '[] ys ys where
  generalizeIdx x = case x of {}
instance Concat1 xs ys zs => Concat1 (x : xs) ys (x : zs) where
  generalizeIdx Z = Z
  generalizeIdx (S n) = S $ generalizeIdx n

type family Concat (xs :: [Typ]) (ys :: [Typ]) :: [Typ] where
    Concat '[] ys = ys
    Concat (x ': xs) ys = x ': Concat xs ys

lam :: (Idx (t1 ': g) t1 -> Exp (t1 ': g) t2) -> Exp g (t1 :-> t2)
lam f = Lam $ f Z

type family IsEqual (i1 :: [Typ]) (o1 :: [Typ]) :: Bool where
    IsEqual x x = 'True
    IsEqual _ _ = 'False
class ( IsEqual i o ~ eq)
      => Contains eq i o where
    wrap ::  Idx i t -> Idx o t

type Contains' i o = Contains (IsEqual i o) i o

instance Contains 'True '[] '[] where
    wrap x = case x of {}

instance Contains 'True (x ': xs) (x ': xs) where
    wrap = id

instance
  ( IsEqual inner (x ': outer) ~ 'False
  , Contains' inner outer
  ) =>
  Contains 'False inner (x ': outer) where
    wrap = S . wrap

idxToVar :: Contains' inner outer => Idx inner t -> Exp outer t
idxToVar = Var . wrap

lam' :: Contains' (t : g) outer
    => (Exp outer t -> Exp (t : g) t2)
    -> Exp g (t ':-> t2)
lam' f = lam $ f . idxToVar

-- lam2 f = lam \x -> lam \y -> f (s x) y
-- lam2 :: (Exp t (Incr (Incr a)) -> Exp t (Incr (Incr a)) -> Exp t (Incr (Incr a))) -> Exp t a
-- lam2 :: (Exp (s : t : g2) t -> Idx (t1 : t : g2) t1 -> Exp (t1 : t : g2) t2) -> Exp g2 (t ':-> (t1 ':-> t2))
-- lam2 f = lam $ lam . f . s
lam2 ::
    ( Contains' (t1 : g) outer1
    , Contains' (t2 : t1 : g) outer2
    ) => (Exp outer1 t1 -> Exp outer2 t2 -> Exp (t2 : t1 : g) t3)
      -> Exp g (t1 ':-> (t2 ':-> t3))
lam2 f = lam' $ lam' . f

-- s :: Exp t a -> Exp t (Incr a)
-- s = fmap S
-- s (Var x) = Var (S x)
-- s (x :@ y) = s x :@ s y
-- s (Lam (Scope f)) = Lam $ s f

s :: Idx gs t -> Exp (g : gs) t
s = Var . S

z = Var

-- ex :: Exp '[] ((t1 ':-> t2) ':-> (t1 ':-> t2))
-- ex = lam \x -> lam \y -> s x :@ z y
ex :: (
    g ~ g,
    IsEqual ((t1 ':-> t2) : g) (t1 : (t1 ':-> t2) : g) ~ 'False
    ) =>
     Exp g ((t1 ':-> t2) ':-> (t1 ':-> t2))
ex = lam' \x -> lam' \y -> x :@ y

ex' :: Exp '[] ((t1 ':-> t2) ':-> (t1 ':-> t2))
ex' = ex @'[]

ex2 :: (Exp '[] ((t10 ':-> t20) ':-> (t10 ':-> t20)))
-- ex2 = lam \z -> ex :@ Var z
ex2 = lam \z -> generalize ex' :@ Var z

ex3 = lam \x -> lam \y -> s x :@ z y

-- >>> ex'
-- >>> ex2
-- >>> ex3
-- Lam (Lam (Var (S Z) :@ Var Z))
-- Lam (Lam (Lam (Var (S Z) :@ Var Z)) :@ Var Z)
-- Lam (Lam (Var (S Z) :@ Var Z))
