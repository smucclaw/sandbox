{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveTraversable #-}
module BoundEx where

import Data.Void (Void)
data Incr a = Z String | S a
  deriving (Eq, Show)
  deriving (Functor, Foldable, Traversable)

newtype Scope f a = Scope (f (Incr a))
  deriving Functor
  deriving Foldable
  deriving Traversable
--   deriving newtype Eq

-- UndecidableInstances
deriving newtype instance Eq (f (Incr a)) => Eq (Scope f a)
deriving newtype instance Show (f (Incr a)) => Show (Scope f a)

data Exp a
  = Var a
  | Exp a :@ Exp a
  | Lam (Scope Exp a)
  deriving (Eq, Show)
  deriving (Functor, Foldable, Traversable)

lam :: String -> (Exp (Incr a) -> Exp (Incr a)) -> Exp a
lam name f = Lam $ Scope $ f $ Var (Z name)

-- lam2 f = lam \x -> lam \y -> f (s x) y
-- lam2 :: (Exp (Incr (Incr a)) -> Exp (Incr (Incr a)) -> Exp (Incr (Incr a))) -> Exp a
-- lam2 f = lam $ lam . f . s

s :: Exp a -> Exp (Incr a)
s = fmap S
-- s (Var x) = Var (S x)
-- s (x :@ y) = s x :@ s y
-- s (Lam (Scope f)) = Lam $ s f

ex :: Exp Void
ex = lam "x" $ \x -> lam "y" $ \y -> s x :@ y

ex2 :: Exp Void
ex2 = lam "z" \z -> s ex :@ z

ex3 :: Exp Void
ex3 = lam "x" $ \x -> s $ lam "y" $ \y -> x :@ y

-- >>> ex
-- >>> ex2
-- >>> ex3
-- Lam (Lam (Var (S "y" (Z "x")) :@ Var (Z "y")))
-- Lam (Lam (Lam (Var (S "y" (Z "x")) :@ Var (Z "y"))) :@ Var (Z "z"))
-- Lam (Lam (Var (Z "x") :@ Var (Z "y")))
