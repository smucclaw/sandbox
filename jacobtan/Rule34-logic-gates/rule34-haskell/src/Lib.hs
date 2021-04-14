module Lib
  ( mainFunc
  ) where

import Graphviz ( graphvizMain )
import Fgl ( fglMain )

-- *** Readme *** --
-- Use graphviz library for visualisation.
-- Graphviz uses fgl library.

mainFunc :: IO ()
mainFunc = do
  fglMain
  graphvizMain
