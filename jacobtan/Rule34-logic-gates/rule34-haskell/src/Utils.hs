module Utils (
  (&),
  (<&>),
  (>>>),
  show',
  foldl'
) where

import Data.Function ((&))
import Data.Functor ((<&>))
import Control.Arrow ((>>>))
import qualified Data.Text as Text
import Data.Foldable (foldl')

show' :: Show a => a -> Text.Text
show' = Text.pack . show
