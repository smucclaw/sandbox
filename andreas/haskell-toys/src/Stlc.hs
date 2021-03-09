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

data Idx (g :: [Typ]) (t :: Typ) where
    Z :: Idx (t ': ts) t
    S :: Idx gs t -> Idx (g ': gs) t

deriving instance Show (Idx g t)
deriving instance Eq (Idx g t)
data Exp (g :: [Typ]) (t :: Typ) where
    Var :: Idx g t -> Exp g t
    (:@) :: Exp g (t1 :-> t2) -> Exp g t1 -> Exp g t2
    Lam :: Exp (t1 ': g) t2 -> Exp g (t1 :-> t2)

infixl 5 :@
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
instance ys ~ zs => Concat1 '[] ys zs where
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
    wrap :: Idx i t -> Idx o t

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
subst (Var Z) x = x
subst (Var (S n)) x = Var n
subst (a :@ b) x = subst a x :@ subst b x
subst (Lam f) x = Lam $ substUnder' (CS CZ) Proxy f x

substUnder :: Exp (t4 : t1 : g) t2 -> Exp g t1 -> Exp (t4 : g) t2
substUnder (Var Z) x = Var Z
substUnder (Var (S Z)) x = liftExp0 x
substUnder (Var (S (S n))) x = liftExp0 $ Var n
substUnder (a :@ b) x = substUnder a x :@ substUnder b x
substUnder (Lam f) x = Lam $ substUnder' (CS (CS CZ)) Proxy f x -- _ f x

-- | Substitute the variable with non-zero de Bruijn index
substUnder' :: CtxSing xs -> Proxy (t1 ': i)
    -> Exp (Concat xs (t1 ': i)) t2 -> Exp i t1 -> Exp (Concat xs i) t2
substUnder' CZ ti f x = subst f x
substUnder' (CS cxs) ti (Var Z) x = Var Z
substUnder' (CS cxs) ti (Var (S n)) x = liftExp0 $ substUnder' cxs ti (Var n) x
substUnder' cs ti (a :@ b) x = substUnder' cs ti a x :@ substUnder' cs ti b x
substUnder' cs ti (Lam f) x = Lam $ substUnder' (CS cs) ti f x
-- liftExpUp' :: (Contains' i o) => CtxSing xs -> Proxy i -> Proxy o -> Exp (Concat xs i) t -> Exp (Concat xs o) t

liftExp0 :: Exp i t -> Exp (x ': i) t
-- liftExp0 i x = consNeq i x liftExp1
liftExp0 = liftExp0 Proxy Proxy
  where
  liftExp0 :: Proxy i -> Proxy x -> Exp i t -> Exp (x ': i) t
  liftExp0 = undefined

liftExp1 :: (IsEqual i (x ': i) ~ 'False) => Exp i t -> Exp (x ': i) t
liftExp1 = liftExp

liftExp :: Contains' i o => Exp i t -> Exp o t
liftExp (Var i) = Var (wrap i)
liftExp (f :@ x) = liftExp f :@ liftExp x
-- liftExp (Lam f) = Lam $ liftExpUp f
liftExp (Lam f) = Lam $ liftExpUp' (CS CZ) Proxy Proxy f

liftExpUp :: Contains' i o => Exp (x ': i) t -> Exp (x ': o) t
liftExpUp (Var Z) = Var Z
liftExpUp (Var (S n)) = Var $ S $ wrap n
liftExpUp (f :@ x) = liftExpUp f :@ liftExpUp x
liftExpUp (Lam f) = Lam $ liftExpUp' (CS $ CS CZ) Proxy Proxy f

data CtxSing (g :: [Typ]) where
    CZ :: CtxSing '[]
    CS :: CtxSing xs -> CtxSing (x ': xs)

liftExpUp' :: (Contains' i o) => CtxSing xs -> Proxy i -> Proxy o -> Exp (Concat xs i) t -> Exp (Concat xs o) t
liftExpUp' CZ i o n = liftExp n
liftExpUp' p i o (Var n) = Var $ liftIdxUp p i o n
liftExpUp' p i o (f :@ x) = liftExpUp' p i o f :@ liftExpUp' p i o x
liftExpUp' p@(CS _) i o (Lam f) = Lam $ liftExpUp' (CS p) i o f

liftIdxUp :: (Contains' i o) => CtxSing xs -> Proxy i -> Proxy o -> Idx (Concat xs i) t -> Idx (Concat xs o) t
liftIdxUp CZ i o n = wrap n
liftIdxUp (CS _) _ _ Z = Z
liftIdxUp (CS p) i o (S n) = S $ liftIdxUp p i o n

idxToVar :: Contains' inner outer => Idx inner t -> Exp outer t
idxToVar = Var . wrap

-- | Automatically figure out which context we are in and wrap as necessary
type ExpInCtx g t = forall outer. Contains' g outer =>  Exp outer t

lam' :: (ExpInCtx (t : g) t -> Exp (t : g) t2)
    -> Exp g (t ':-> t2)
lam' f = lam $ \x -> f $ idxToVar x

lam2 :: (ExpInCtx (t1 : g) t1 -> ExpInCtx (t2 : t1 : g) t2 -> Exp (t2 : t1 : g) t3)
      -> Exp g (t1 ':-> t2 ':-> t3)
lam2 f = lam' $ \x -> lam' $ f x

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
ex :: Exp g ((t1 ':-> t2) ':-> (t1 ':-> t2))
ex = generalize $ lam' \x -> lam' \y -> x :@ y

ex2 :: (Exp '[] ((t10 ':-> t20) ':-> (t10 ':-> t20)))
-- ex2 = lam \z -> ex :@ Var z
ex2 = lam \z -> ex :@ Var z

ex3 = lam \x -> lam \y -> s x :@ z y

ex4 = generalize $ lam2 \x y -> x :@ (lam' \ z -> z :@ y)

ex5 :: Exp '[] ((a ':-> a ':-> b) ':-> a ':-> b)
ex5 = lam' \f -> lam' \x -> f :@ x :@ x

ex6 :: Exp g ((((t1 ':-> t4) ':-> t4) ':-> t1 ':-> t5) ':-> t1 ':-> t5)
ex6 = generalize $ lam' \f -> lam' \x -> f :@ (lam' \y -> y :@ x) :@ x

-- >>> ex
-- >>> ex2
-- >>> ex3
-- >>> ex4
-- >>> ex5
-- Lam (Lam (Var (S Z) :@ Var Z))
-- Lam (Lam (Lam (Var (S Z) :@ Var Z)) :@ Var Z)
-- Lam (Lam (Var (S Z) :@ Var Z))
-- Lam (Lam (Var (S Z) :@ Lam (Var Z :@ Var (S Z))))
-- Lam (Lam ((Var (S Z) :@ Var Z) :@ Var Z))
