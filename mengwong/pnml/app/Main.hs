module Main where

import Lib

main :: IO ()
main = someFunc


data Place = P String
data Transition = T Transition
data Arc = :->#  Place Transition
         | :->@  Transition Place
         | :*-># [Place] Transition
         | :*->@ [Transition] Place
         | :#->* Transition [Place]
         | :@->* Place [Transition]

data PNode = PP Place
           | PT Transition

data PThingy = PN PNode
             | PA Arc

type MyGraph = Graph PNode Arc

-- | multiple places go to one transition
petri1 = [ p1, p2, p3 ] :*-># t1

-- | multiple transitions go to one place
petri2 = [ t1, t2, t3 ] :*->@ p1

