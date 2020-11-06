module Mon2 where

import Control.Monad
import Data.Monoid
import Test.QuickCheck
import Optional

newtype First' a = 
    First' { getFirst' :: Optional a }
    deriving (Eq, Show)

instance Arbitrary First' where
  arbitrary =
    genFirst'

instance Semigroup (First' a) where
    (<>) (First' Nada) y = y
    (<>) x _ = x

instance Monoid (First' a) where
    mempty = First' Nada

genOptional :: Arbitrary a => Gen (Optional a)
genOptional = do 
    a <- arbitrary
    elements [Nada, Only a, Only a, Only a]

genFirst' :: Arbitrary a => Gen (First' a)
genFirst' = do
    a <- genOptional
    return (First' a)

firstMappend :: First' a
             -> First' a
             -> First' a
firstMappend = mappend

type FirstMappend = 
    First' String
    -> First' String
    -> First' String
    -> Bool

type FstId =
    First' String -> Bool

main :: IO()
main = do
    quickCheck (monoidAssoc :: FirstMappend)
    quickCheck (monoidLeftIdentity :: FstId)
    quickCheck (monoidRightIdentity :: FstId)
