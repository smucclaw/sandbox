{-# LANGUAGE GADTs #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE PatternSynonyms #-}

module Fol where

data family HList (l::[Vars'])
data instance HList '[] = HNil
data instance HList (x ': xs) = Vars x `HCons` HList xs

-- data HList (l::[Vars']) where
--     HNil  :: HList '[]
--     HCons :: Vars e -> HList l -> HList (e ': l)

infixr 5 :*
pattern a :* b = HCons a b

-- type family xs ++ ys :: [a] where
--   '[] ++ ys = ys
--   (x : xs) ++ ys = x : (xs++ys)

data Vars' = A' | B'
data Vars (a :: Vars') where
  A :: Vars A'
  B :: Vars B'

data Statements = 
  Statement1

-- type Context' = [Vars']
data FOL (a :: [Vars']) where
  Forall :: Vars vars -> FOL bs

x = HCons A $ HCons B HNil
y = A :* B :* HNil