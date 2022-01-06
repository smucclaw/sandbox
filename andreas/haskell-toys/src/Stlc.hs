{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RankNTypes #-}
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
import Data.Type.Equality ((:~:) (Refl))

data Typ = T | Typ :-> Typ

infixr 8 :->

-- data Var t a

data Exp1 (g :: [Typ]) (t :: Typ) a where
    Z1 :: Exp1 (t ': ts) t a
    -- S1 :: (b ~ Exp1 gs t a) => Exp1 gs t a -> Exp1 (g ': gs) t b
    S1 :: Exp1 gs t a -> Exp1 (g ': gs) t (Exp1 gs t a)
    -- Var :: Exp1 g t a
    (:@!) :: Exp1 g (t1 :-> t2) a -> Exp1 g t1 a -> Exp1 g t2 a
    Lam1 :: Exp1 (t1 ': g) t2 (Exp1 g t a) -> Exp1 g (t1 :-> t2) a

-- data IsBound

data Exp2 (bnd :: Maybe Typ) f (t :: Typ) where
    Z2 :: Exp2 (Just t) f t
    -- S2 :: Exp2 b f t -> Exp2 (Just t) (Exp2 b f) t
    S2 :: f t -> Exp2 (Just t1) f t
    (:@?) :: Exp2 g f (t1 :-> t2) -> Exp2 g f t1 -> Exp2 g f t2
    Lam2 :: Exp2 (Just t1) (Exp2 g f) t2 -> Exp2 g f (t1 :-> t2)

infixl 5 :@?

exp2Ex = Lam2 $ Lam2 Z2 :@? Lam2 (S2 Z2)

withF :: (forall s. f s -> g s) -> Exp2 b f t -> Exp2 b g t
withF _ Z2 = Z2
withF mu (S2 ft) = S2 $ mu ft
withF mu (a :@? b) = withF mu a :@? withF mu b
withF mu (Lam2 f) = Lam2 $ withF (withF mu) f

class TFunctor (t :: (Typ -> *) -> Typ -> *) where
    hoistT :: (forall a. f a -> g a) -> t f b -> t g b

class TFunctor tr => TMonad (tr :: (Typ -> *) -> Typ -> *) where
    returnT :: f typ -> tr f typ
    (>>>=) :: tr f typ -> (forall typ2. f typ2 -> tr g typ2) -> tr g typ
    -- (>>>=) :: tr f typ -> (f typ -> tr g typ) -> tr g typ

infixl 4 >>>=
instance TFunctor (Exp2 b) where
  hoistT = withF

data Var (t1 :: Typ) f (t :: Typ) where
    Z3 :: Var t f t
    -- S3 :: Exp3 b f t -> Exp3 (Just t) (Exp3 b f) t
    S3 :: f t -> Var t1 f t
instance TFunctor (Var t) where
  hoistT _ Z3 = Z3
  hoistT mu (S3 x) = S3 $ mu x
instance TMonad (Var t) where
  returnT = S3
  Z3 >>>= _ = Z3
  S3 x >>>= f = f x

newtype Scope (t1 :: Typ) w (f:: Typ -> *) (t2 :: Typ) = Scope { unscope :: w (Var t1 (w f)) t2 }
instance TFunctor w => TFunctor (Scope t1 w) where
  hoistT mu (Scope x) = Scope $ hoistT (hoistT (hoistT mu)) x
instance TMonad w => TMonad (Scope t1 w) where
  returnT = Scope . returnT . S3 . returnT
  Scope e1 >>>= f = Scope $ e1 >>>= \case
     Z3 -> returnT Z3
     (S3 e2) -> e2 >>>= unscope . f

-- Tweaked version of this:
-- https://hackage.haskell.org/package/bound-2.0.3/docs/Bound-Class.html#v:-62--62--62--61-
bound :: TMonad f => Scope t1 f a t2 -> (forall t3. a t3 -> f c t3) -> Scope t1 f c t2
bound (Scope m) f = Scope $ hoistT (hoistT (>>>= f)) m
data Exp3 f (t :: Typ) where
    Var3 :: f t -> Exp3 f t
    (:@#) :: Exp3 f (t1 :-> t2) -> Exp3 f t1 -> Exp3 f t2
    Lam3 :: Scope t1 Exp3 f t2 -> Exp3 f (t1 :-> t2)

infixl 5 :@#
instance TFunctor Exp3 where
  hoistT mu (Var3 x) = Var3 (mu x)
  hoistT mu (a :@# b) = hoistT mu a :@# hoistT mu b
  hoistT mu (Lam3 f) = Lam3 $ hoistT mu f
instance TMonad Exp3 where
  returnT = Var3
  Var3 x    >>>= f = f x
  (a :@# b) >>>= f = (a >>>= f) :@# (b >>>= f)
  Lam3 e    >>>= f = Lam3 $ bound e f

instantiate :: TMonad tr => tr f t1 -> Scope t1 tr f typ -> tr f typ
instantiate k e = unscope e >>>= \case
   Z3 -> k
   (S3 b) -> b

whnf :: Exp3 f t -> Exp3 f t
whnf (f :@# a) = case whnf f of
  Lam3 b -> whnf (instantiate a b)
  f'    -> f' :@# a
whnf e = e


newtype Var4 s = Var4 s

-- Untyped quasi-HOAS using the runST trick
data Exp4 (g :: [*]) where
    Z4 :: Var4 s -> Exp4 (s ': g)
    S4 :: Exp4 gs -> Exp4 (g ': gs)
    (:@&) :: Exp4 g -> Exp4 g -> Exp4 g
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
lam4 f = Lam4 $ f . Z4

data Exp (g :: [Typ]) (t :: Typ) where
    Z :: Exp (t ': ts) t
    S :: Exp gs t -> Exp (g ': gs) t
    (:@) :: Exp g (t1 :-> t2) -> Exp g t1 -> Exp g t2
    Lam :: Exp (t1 ': g) t2 -> Exp g (t1 :-> t2)

infixl 5 :@
deriving instance Show (Exp g t)

generalize :: Exp '[] t -> Exp g t
generalize = generalizeIdx

class Concat1 (xs :: [Typ]) (ys :: [Typ]) (zs :: [Typ])
    | xs ys -> zs, zs xs -> ys where
  generalizeIdx :: Exp xs t -> Exp zs t
instance Concat1 '[] ys ys where
  generalizeIdx (f :@ x) = generalizeIdx f :@ generalizeIdx x
  generalizeIdx (Lam x) = Lam $ generalizeIdx x
instance Concat1 xs ys zs => Concat1 (x : xs) ys (x : zs) where
  generalizeIdx Z = Z
  generalizeIdx (S n) = S $ generalizeIdx n
  generalizeIdx (f :@ x) = generalizeIdx f :@ generalizeIdx x
  generalizeIdx (Lam x) = Lam $ generalizeIdx x

type family Concat (xs :: [Typ]) (ys :: [Typ]) :: [Typ] where
    Concat '[] ys = ys
    Concat (x ': xs) ys = x ': Concat xs ys

lam :: (Exp (t1 ': g) t1 -> Exp (t1 ': g) t2) -> Exp g (t1 :-> t2)
lam f = Lam $ f Z

type family IsEqual (i1 :: [Typ]) (o1 :: [Typ]) :: Bool where
    IsEqual x x = 'True
    IsEqual _ _ = 'False
class ( IsEqual i o ~ eq)
      => Contains eq i o where
    wrap :: Exp i t -> Exp o t

type Contains' i o = Contains (IsEqual i o) i o

instance Contains 'True xs xs where
    wrap = id

instance
  ( IsEqual inner (x ': outer) ~ 'False
  , Contains' inner outer
  ) =>
  Contains 'False inner (x ': outer) where
    wrap = S . wrap

-- class KnownType (xs :: Typ) where
--     knownType :: Proxy xs -> Typ

-- class KnownCtx (xs :: [Typ]) where
--     knownCtx :: CtxSing xs
-- instance KnownCtx '[] where
--   knownCtx = CZ
-- instance KnownCtx xs => KnownCtx (x : xs) where
--   knownCtx = CS knownCtx

-- knownCtx' :: KnownCtx i => proxy i -> CtxSing i
-- knownCtx' _ = knownCtx

-- consNeq :: Proxy i -> Proxy x -> (IsEqual i (x ': i) ~ 'False => z) -> z
-- consNeq i _ f = undefined

-- consNeq' :: KnownCtx i => Proxy i -> Proxy x -> (IsEqual i (x ': i) ~ 'False => z) -> z
-- consNeq' i x f = go (knownCtx' i) x f
--   where
--     go :: CtxSing i -> Proxy x -> (IsEqual i (x ': i) ~ 'False => z) -> z
--     go CZ _ f = f
--     go (CS n) x f = go n x $ undefined

-- consNeq'' :: CtxSing i -> Proxy x -> (IsEqual i (x ': i) :~: 'False)
-- consNeq'' CZ x = Refl
-- consNeq'' cs@(CS n) x = consNeqLem cs x $ consNeq'' n x

-- consNeqLem :: CtxSing (x1 : xs) -> Proxy x -> (IsEqual xs (x : xs) :~: 'False) -> IsEqual (x1 : xs) (x : x1 : xs) :~: 'False
-- consNeqLem (CS CZ) x pf = Refl
-- consNeqLem (CS cs1@(CS cs)) x Refl = _ $ consNeqLem cs1 x Refl

-- | Evaluate a single step
eval :: Exp g t -> Maybe (Exp g t)
eval (S (f :@ x)) = eval $ S f :@ S x
eval (S (Lam f) :@ x) = eval $ Lam (liftExpUp1 f) :@ x
-- eval (S (Lam f) :@ x) = Just $ _ f x
eval (Lam f :@ x) = Just $ subst f x
eval (f :@ x) = (:@ x) <$> eval f
eval _ = Nothing

withTail :: (forall t0. Exp g1 t0 -> Exp g2 t0) -> Exp (t1 : g1) t -> Exp (t1 : g2) t
withTail _ Z = Z
withTail f (S x) = S $ f x
withTail f (a :@ b) = withTail f a :@ withTail f b
withTail f (Lam g) = Lam $ withTail (withTail f) g

liftExpUp1Alt :: Exp (t1 : gs) t -> Exp (t1 : g1 : gs) t
liftExpUp1Alt = withTail S

liftExpUp1 :: Exp (t1 : gs) t -> Exp (t1 : g1 : gs) t
liftExpUp1 Z = Z
liftExpUp1 (S x) = S $ S x
liftExpUp1 (a :@ b) = liftExpUp1 a :@ liftExpUp1 b
liftExpUp1 (Lam f) = Lam $ liftExpUp1' (CS (CS CZ)) Proxy f

liftExpUp1' :: CtxSing xs -> Proxy (x ': i) -> Exp (Concat xs i) t -> Exp (Concat xs (x ': i)) t
liftExpUp1' CZ i n = S n
liftExpUp1' p i (f :@ x) = liftExpUp1' p i f :@ liftExpUp1' p i x
liftExpUp1' p@(CS _) i (Lam f) = Lam $ liftExpUp1' (CS p) i f
-- liftExpUp1' p i n = liftIdxUp p i n
liftExpUp1' (CS _) _ Z = Z
liftExpUp1' (CS p) i (S n) = S $ liftExpUp1' p i n

-- | Substitute the variable with de Bruijn index zero
subst :: Exp (t1 ': g) t2 -> Exp g t1 -> Exp g t2
subst Z x = x
subst (S n) x = n
subst (a :@ b) x = subst a x :@ subst b x
subst (Lam f) x = Lam $ substUnder' (CS CZ) Proxy f x

substUnder :: Exp (t4 : t1 : g) t2 -> Exp g t1 -> Exp (t4 : g) t2
substUnder Z x = Z
substUnder (S n) x = S $ subst n x
substUnder (a :@ b) x = substUnder a x :@ substUnder b x
substUnder (Lam f) x = Lam $ substUnder' (CS (CS CZ)) Proxy f x -- _ f x

-- | Substitute a variable with non-zero de Bruijn index
substUnder' :: CtxSing xs -> Proxy (t1 ': i)
    -> Exp (Concat xs (t1 ': i)) t2 -> Exp i t1 -> Exp (Concat xs i) t2
substUnder' CZ ti f x = subst f x
substUnder' (CS cxs) ti Z x = Z
substUnder' (CS cxs) ti (S n) x = S $ substUnder' cxs ti n x
substUnder' cs ti (a :@ b) x = substUnder' cs ti a x :@ substUnder' cs ti b x
substUnder' cs ti (Lam f) x = Lam $ substUnder' (CS cs) ti f x

liftExp :: Contains' i o => Exp i t -> Exp o t
-- liftExp (f :@ x) = liftExp f :@ liftExp x
-- -- liftExp (Lam f) = Lam $ liftExpUp f
-- liftExp (Lam f) = Lam $ liftExpUp' (CS CZ) Proxy Proxy f
liftExp = wrap

liftExpUp :: Contains' i o => Exp (x ': i) t -> Exp (x ': o) t
liftExpUp Z = Z
liftExpUp (S n) = S $ wrap n
liftExpUp (f :@ x) = liftExpUp f :@ liftExpUp x
liftExpUp (Lam f) = Lam $ liftExpUp' (CS $ CS CZ) Proxy Proxy f

data CtxSing (g :: [Typ]) where
    CZ :: CtxSing '[]
    CS :: CtxSing xs -> CtxSing (x ': xs)

liftExpUp' :: (Contains' i o) => CtxSing xs -> Proxy i -> Proxy o -> Exp (Concat xs i) t -> Exp (Concat xs o) t
liftExpUp' CZ i o n = liftExp n
-- liftExpUp' CZ i o n = wrap n
liftExpUp' p i o (f :@ x) = liftExpUp' p i o f :@ liftExpUp' p i o x
liftExpUp' p@(CS _) i o (Lam f) = Lam $ liftExpUp' (CS p) i o f
-- liftExpUp' p i o n = liftIdxUp p i o n
liftExpUp' (CS _) _ _ Z = Z
liftExpUp' (CS p) i o (S n) = S $ liftExpUp' p i o n


idxToVar :: Contains' inner outer => Exp inner t -> Exp outer t
idxToVar = wrap

-- | Automatically figure out which context we are in and wrap as necessary
type ExpInCtx g t = forall outer. Contains' g outer =>  Exp outer t

lam' :: (ExpInCtx (t : g) t -> Exp (t : g) t2)
    -> Exp g (t ':-> t2)
lam' f = lam $ \x -> f $ idxToVar x

lam2 :: (ExpInCtx (t1 : g) t1 -> ExpInCtx (t2 : t1 : g) t2 -> Exp (t2 : t1 : g) t3)
      -> Exp g (t1 ':-> t2 ':-> t3)
lam2 f = lam' $ \x -> lam' $ f x

-- * Examples

{-# ANN ex "HLint: ignore Avoid lambda" #-}
{-# ANN ex2 "HLint: ignore Avoid lambda" #-}
{-# ANN ex4 "HLint: ignore Avoid lambda using `infix`" #-}
{-# ANN ex6 "HLint: ignore Avoid lambda using `infix`" #-}

ex :: Exp g ((t1 ':-> t2) ':-> (t1 ':-> t2))
ex = generalize $ lam' \x -> lam' \y -> x :@ y

ex2 :: (Exp '[] ((t10 ':-> t20) ':-> (t10 ':-> t20)))
-- ex2 = lam \z -> ex :@ Var z
ex2 = lam \z -> ex :@ z

ex3 = lam \x -> lam \y -> S x :@ y

ex4 = generalize $ lam2 \x y -> x :@ lam' \ z -> z :@ y

ex5 :: Exp '[] ((a ':-> a ':-> b) ':-> a ':-> b)
ex5 = lam' \f -> lam' \x -> f :@ x :@ x

ex6 :: Exp g ((((t1 ':-> t4) ':-> t4) ':-> t1 ':-> t5) ':-> t1 ':-> t5)
ex6 = generalize $ lam' \f -> lam' \x -> f :@ lam' (\y -> y :@ x) :@ x

-- >>> ex
-- >>> ex2
-- >>> ex3
-- >>> ex4
-- >>> ex5
-- Lam (Lam (S Z :@ Z))
-- Lam (Lam (Lam (S Z :@ Z)) :@ Z)
-- Lam (Lam (S Z :@ Z))
-- Lam (Lam (S Z :@ Lam (Z :@ S Z)))
-- Lam (Lam ((S Z :@ Z) :@ Z))
