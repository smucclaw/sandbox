module Square where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine



b1 :: Diagram B
b1 = square 20 # lw 0.002

main = mainWith (pad 1.1 b1)