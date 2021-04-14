module Lib
  ( mainFunc
  ) where

import Graphviz ( graphvizMain )
import Fgl ( fglMain )

mainFunc :: IO ()
mainFunc = do
  fglMain
  graphvizMain
