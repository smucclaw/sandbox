module Lib
  ( mainFunc
  ) where

import Encoding ( encodingMain )
import Graphviz ( graphvizMain )
import Fgl ( fglMain )

-- *** Readme *** --
-- Use graphviz library for visualisation.
-- Graphviz uses fgl library.

mainFunc :: IO ()
mainFunc = do
  encodingMain
  fglMain
  -- graphvizMain
