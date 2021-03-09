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
data Typ = T | Typ :-> Typ

infixr 8 :->

data Exp (g :: [Typ]) (t :: Typ) where
    Z :: Exp (t ': ts) t
    S :: Exp gs t -> Exp (g ': gs) t
    (:@) :: Exp g (t1 :-> t2) -> Exp g t1 -> Exp g t2
    Lam :: Exp (t1 ': g) t2 -> Exp g (t1 :-> t2)

infixl 5 :@
deriving instance Show (Exp g t)

generalize :: Exp '[] t -> Exp g t
generalize = generalizeIdx

class Concat1 (xs :: [Typ]) (ys :: [Typ]) (zs :: [Typ])
    | xs ys -> zs, zs xs -> ys where
  generalizeIdx :: Exp xs t -> Exp zs t
instance Concat1 '[] ys ys where
  generalizeIdx (f :@ x) = generalizeIdx f :@ generalizeIdx x
  generalizeIdx (Lam x) = Lam $ generalizeIdx x
instance Concat1 xs ys zs => Concat1 (x : xs) ys (x : zs) where
  generalizeIdx Z = Z
  generalizeIdx (S n) = S $ generalizeIdx n
  generalizeIdx (f :@ x) = generalizeIdx f :@ generalizeIdx x
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

-- | Evaluate a single step
eval :: Exp g t -> Maybe (Exp g t)
eval (Lam f :@ x) = Just $ subst f x
eval _ = Nothing

-- | Substitute the variable with de Bruijn index zero
subst :: Exp (t1 ': g) t2 -> Exp g t1 -> Exp g t2
subst Z x = x
subst (S n) x = n
subst (a :@ b) x = subst a x :@ subst b x
subst (Lam f) x = Lam $ substUnder' (CS CZ) Proxy f x

substUnder :: Exp (t4 : t1 : g) t2 -> Exp g t1 -> Exp (t4 : g) t2
substUnder Z x = Z
substUnder (S n) x = S $ subst n x
substUnder (a :@ b) x = substUnder a x :@ substUnder b x
substUnder (Lam f) x = Lam $ substUnder' (CS (CS CZ)) Proxy f x -- _ f x

-- | Substitute a variable with non-zero de Bruijn index
substUnder' :: CtxSing xs -> Proxy (t1 ': i)
    -> Exp (Concat xs (t1 ': i)) t2 -> Exp i t1 -> Exp (Concat xs i) t2
substUnder' CZ ti f x = subst f x
substUnder' (CS cxs) ti Z x = Z
substUnder' (CS cxs) ti (S n) x = S $ substUnder' cxs ti n x
substUnder' cs ti (a :@ b) x = substUnder' cs ti a x :@ substUnder' cs ti b x
substUnder' cs ti (Lam f) x = Lam $ substUnder' (CS cs) ti f x

liftExp :: Contains' i o => Exp i t -> Exp o t
-- liftExp (f :@ x) = liftExp f :@ liftExp x
-- -- liftExp (Lam f) = Lam $ liftExpUp f
-- liftExp (Lam f) = Lam $ liftExpUp' (CS CZ) Proxy Proxy f
liftExp = wrap

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
liftExpUp' (CS p) i o (S n) = S $ liftExpUp' p i o n


idxToVar :: Contains' inner outer => Exp inner t -> Exp outer t
idxToVar = wrap

-- | Automatically figure out which context we are in and wrap as necessary
type ExpInCtx g t = forall outer. Contains' g outer =>  Exp outer t

lam' :: (ExpInCtx (t : g) t -> Exp (t : g) t2)
    -> Exp g (t ':-> t2)
lam' f = lam $ \x -> f $ idxToVar x

lam2 :: (ExpInCtx (t1 : g) t1 -> ExpInCtx (t2 : t1 : g) t2 -> Exp (t2 : t1 : g) t3)
      -> Exp g (t1 ':-> t2 ':-> t3)
lam2 f = lam' $ \x -> lam' $ f x

-- * Examples

ex :: Exp g ((t1 ':-> t2) ':-> (t1 ':-> t2))
ex = generalize $ lam' \x -> lam' \y -> x :@ y

ex2 :: (Exp '[] ((t10 ':-> t20) ':-> (t10 ':-> t20)))
-- ex2 = lam \z -> ex :@ Var z
ex2 = lam \z -> ex :@ z

ex3 = lam \x -> lam \y -> S x :@ y

ex4 = generalize $ lam2 \x y -> x :@ lam' \ z -> z :@ y

ex5 :: Exp '[] ((a ':-> a ':-> b) ':-> a ':-> b)
ex5 = lam' \f -> lam' \x -> f :@ x :@ x

ex6 :: Exp g ((((t1 ':-> t4) ':-> t4) ':-> t1 ':-> t5) ':-> t1 ':-> t5)
ex6 = generalize $ lam' \f -> lam' \x -> f :@ (lam' \y -> y :@ x) :@ x

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
