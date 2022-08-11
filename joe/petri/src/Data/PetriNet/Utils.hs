{-# LANGUAGE FlexibleContexts #-}

module Data.PetriNet.Utils where

import Control.Applicative (liftA2)

import Data.Tuple.All (SequenceT(..))
import Flow ((|>))
import Control.Monad (join)
import Data.Bifunctor (Bifunctor(..))

infixl 0 |$>, |>>, |$>>, >>>=

-- TODO: Describe these combinators.

(|$>) :: Functor f => f a -> (a -> b) -> f b
x |$> f = fmap f x

apply2 :: (c -> a) -> (c -> b) -> c -> (a, b)
apply2 = liftA2 (,)

(|>>) :: c -> (c -> a, c -> b) -> (a, b)
x |>> (f, g) = apply2 f g x

(|$>>) :: Functor f => f a -> (a -> b1, a -> b2) -> f (b1, b2)
x |$>> (f, g) = x |$> apply2 f g

(>>>=) :: Monad m => m a -> (a -> m b1, a -> m b2) -> m (b1, b2)
x >>>= (f, g) = x |>> fg |> sequenceT
  where
    fg = bimap (=<<) (=<<) (f, g)