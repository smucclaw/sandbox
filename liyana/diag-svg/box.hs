{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine



example :: Diagram B
sPt = p2 (0.20, 0.20)
ePt = p2 (2.85, 0.85)

spot = circle 0.02 # lw none
sDot = spot # fc blue # moveTo sPt
eDot = spot # fc red  # moveTo ePt

example = ( sDot <> eDot <> arrowBetween' (with & headLength .~ veryLarge) sPt ePt) # centerXY # pad 2

main = mainWith example


-- b1 :: Diagram B
-- b1 = square 1 # lw 200

-- -- main = mainWith b1
-- -- (pad 1.1 b1)

-- example :: Diagram B
-- circles = hcat (map circle [1..6]) === square 2
-- example = vcat (replicate 3 circles) ||| square 1 # lw 25

-- main = mainWith example