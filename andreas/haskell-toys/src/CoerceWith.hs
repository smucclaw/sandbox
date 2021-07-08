-- Stolen from here: https://www.reddit.com/r/haskell/comments/765ogm/multiple_type_class_instances_for_the_same_type/doc8enp/

{-# LANGUAGE AllowAmbiguousTypes, ScopedTypeVariables, TypeApplications #-}
module CoerceWith where

import Data.Coerce

foldMapWith :: forall a b c. (Monoid a, Coercible a b) => (c -> b) -> [c] -> b
foldMapWith = coerce (foldMap :: (c -> a) -> [c] -> a)

memptyWith :: forall a b. (Monoid a, Coercible a b) => b
memptyWith = coerce (mempty :: a)

mappendWith :: forall a b. (Monoid a, Coercible a b) => b -> b -> b
mappendWith = coerce (mappend :: a -> a -> a)

{-
Allows you do do this:

$ ghci Foo.hs
GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help
[1 of 1] Compiling Foo              ( Foo.hs, interpreted )
Ok, modules loaded: Foo.
*Foo> :set -XTypeApplications
*Foo> import Data.Monoid
*Foo Data.Monoid> memptyWith @(Sum Int) :: Int
0
*Foo Data.Monoid> memptyWith @(Product Int) :: Int
1
*Foo Data.Monoid> mappendWith @(Sum Int) 2 3 :: Int
5
*Foo Data.Monoid> mappendWith @(Product Int) 2 3 :: Int
6
*Foo Data.Monoid> foldMapWith @All odd [1,3,5]
True
*Foo Data.Monoid> foldMapWith @Any odd [1,3,5]
True
-}