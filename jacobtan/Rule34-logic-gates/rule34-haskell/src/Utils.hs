{-# LANGUAGE TypeSynonymInstances #-}

module Utils (
  (&),
  (<&>),
  (>>>),
  foldl',
  show',
  (!),
  fromMaybe,
  (<+>),
  foldl1',
  void
) where

import Data.Function ((&))
import Data.Functor ((<&>))
import Control.Arrow ((>>>))
import qualified Data.Text as Text
import Data.Foldable (foldl')
import Data.Maybe (fromMaybe)

import qualified Data.Map (lookup)
import qualified Data.Map.Internal
import Data.String (fromString, IsString)
import Data.List (foldl1')

import Control.Monad (void)

show' :: Show a => a -> Text.Text
show' = Text.pack . show

-- | Custom dictionary lookup operator. Error message specifies the key when it's not found.
(!) :: (Show k, Show a, Ord k) => Data.Map.Internal.Map k a -> k -> a
(!) dict key = fromMaybe (error $ "*** Error *** dictionary lookup: key not found: " ++ show key) (Data.Map.lookup key dict)

-- | Append with a space
(<+>) :: (Semigroup a, IsString a) => a -> a -> a
x <+> y = x <> fromString " " <> y