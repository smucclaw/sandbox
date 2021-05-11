{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE StandaloneDeriving #-}

module Sandbox where


import Generic.Data (Generic, Generically(..))

-- Jacob's original imperfect attempt
newtype T3 a b = T3 ([a],[b])
  deriving newtype (Semigroup, Monoid)
  -- deriving (Semigroup, Monoid) via ([a],[b]) -- also works

-- The final solution, from https://hackage.haskell.org/package/generic-data
data Foo a = Bar [a] [a]
  deriving Generic
  deriving Semigroup via (Generically (Foo a))


data T a b = T {x :: [a], y :: [b]}
  deriving (Generic, Show)
  deriving (Semigroup, Monoid) via (Generically (T a b))

-- >>> T [1,2] "ab" <> T [3,4] "cd"
-- T {x = [1,2,3,4], y = "abcd"}
