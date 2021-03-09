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
module Stlc where


import Data.Data (Proxy(Proxy))
data Typ = T | Typ :-> Typ

data Idx (g :: [Typ]) (t :: Typ) where
    Z :: Idx (t ': ts) t
    S :: Idx gs t -> Idx (g ': gs) t


data Exp (g :: [Typ]) (t :: Typ) where
    Var :: Idx g t -> Exp g t
    (:@) :: Exp g (t1 :-> t2) -> Exp g t1 -> Exp g t2
    Lam :: Exp (t1 ': g) t2 -> Exp g (t1 :-> t2)

lam :: (Idx (t1 ': g) t1 -> Exp (t1 ': g) t2) -> Exp g (t1 :-> t2)
lam f = Lam $ f Z

-- class Contains (i1 :: [Typ]) (o1 :: [Typ]) where
    -- wrap :: ( i1 ~ Reverse' i2, o1 ~ Reverse' o2
    --         , i2 ~ Reverse' i1, o2 ~ Reverse' o1
    --         )
    --   => Idx i2 t -> Idx o2 t
class ( i1 ~ Reverse' i2, o1 ~ Reverse' o2
            , i2 ~ Reverse' i1, o2 ~ Reverse' o1
            )
      => Contains i1 o1 i2 o2 where
    wrap ::  Idx i2 t -> Idx o2 t

instance Contains '[] '[] '[] '[] where
    wrap x = case x of {}

instance ( o1 ~ Reverse' (y ': o2)
         , (y ': o2) ~ Reverse' o1
         , Contains '[x] (Reverse' o2) '[x] o2
         ) => Contains '[x] o1 '[x] (y ': o2) where
    wrap = S . wrap

instance ( i2 ~ Reverse' (x ': i1)
         , (x ': i1) ~ Reverse' i2
         , o2 ~ Reverse' (x ': o1)
         , (x ': o1) ~ Reverse' o2
        --  , Contains '[x] (Reverse' o2) '[x] o2
         ) => Contains (x ': i1) (x ': o1) i2 o2 where
    wrap = _


-- instance Contains (x ': '[]) (x ': ys) where
--     wrap x = _

-- instance Contains xs ys => Contains (x ': xs) (x ': ys) where
--     wrap x = _

-- instance Contains xs ys => Contains xs (y ': ys) where
--     wrap = S . wrap

type Reverse' a = Reverse a '[]

-- type family Reverse (a :: [Typ]) (b :: [Typ]) = (c :: [Typ]) | c b -> a where
type family Reverse (a :: [Typ]) (b :: [Typ]) :: [Typ] where
    Reverse '[] a = a
    Reverse (x ': xs) ys = Reverse xs (x ': ys)

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

-- ex :: Exp '[] a
ex :: Exp g ((t1 ':-> t2) ':-> (t1 ':-> t2))
ex = lam \x -> lam \y -> s x :@ z y

ex2 = lam \z -> ex :@ Var z

ex3 = lam \x -> lam \y -> s x :@ z y

-- >>> ex
-- >>> ex2
-- >>> ex3
-- Lam (Lam (Var (S "y" (Z "x")) :@ Var (Z "y")))
-- Lam (Lam (Lam (Var (S "y" (Z "x")) :@ Var (Z "y"))) :@ Var (Z "z"))
-- Lam (Lam (Var (Z "x") :@ Var (Z "y")))
