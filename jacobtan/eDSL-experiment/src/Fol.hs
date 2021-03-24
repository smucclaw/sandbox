{-# LANGUAGE GADTs #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE PatternSynonyms #-}

module Fol where

data family HList (l::[Var'])
data instance HList '[] = HNil
data instance HList (x ': xs) = Var x `HCons` HList xs

-- data HList (l::[Var']) where
--     HNil  :: HList '[]
--     HCons :: Var e -> HList l -> HList (e ': l)

infixr 5 :*
pattern a :* b = HCons a b

-- type family xs ++ ys :: [a] where
--   '[] ++ ys = ys
--   (x : xs) ++ ys = x : (xs++ys)

data Var' = X0' | X1'
data Var (a :: Var') where
  X0 :: Var X0'
  X1 :: Var X1'

data Const
data Func
data Pred

data Formula

-- type Context' = [Var']
data FOL (a :: [Var']) where
  Forall :: Var vars -> Formula -> FOL bs

x :: HList '[ 'X0', 'X1']
x = HCons X0 $ HCons X1 HNil
y :: HList '[ 'X0', 'X1']
y = X0 :* X1 :* HNil
