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
-- lam2 f = lam $ lam . f . s

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

ex' = ex @'[]

ex2 :: (Exp '[] ((t10 ':-> t20) ':-> (t10 ':-> t20)))
ex2 = lam \z -> ex :@ Var z

ex3 = lam \x -> lam \y -> s x :@ z y

-- >>> ex'
-- >>> ex2
-- >>> ex3
-- Lam (Lam (Var (S Z) :@ Var Z))
-- Lam (Lam (Lam (Var (S Z) :@ Var Z)) :@ Var Z)
-- Lam (Lam (Var (S Z) :@ Var Z))
