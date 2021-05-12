module Petri where

import Data.Map as Map
import Data.Maybe (maybeToList)

--                      a P->T edge label means the number of dots needed to fire
--                      a T->P edge label means the number of dots produced by firing in each place
data Place      pl tl = P pl Int [Transition tl pl] deriving (Eq, Show)
data Transition tl pl = T tl Int [Place pl tl]      deriving (Eq, Show)

-- we distinguish label types
data PLabel = Start | End
            | PL String deriving (Ord, Eq, Show)
data TLabel = Fork | Join | Noop
            | TL String deriving (Ord, Eq, Show)

-- the simple version of a petri net assumes all edge weights are 1;
-- a couple of helper functions help to set up a petri net that hasn't started running yet
p pl ts = P (PL pl) 1 ts
t tl ps = T (TL tl) 1 ps
end = [P End 1 []]
start = P Start 1

example_1 = start
            [t "middle"
             [P End 1 []]]

example_2 = start
            [t'fork
             [p "left branch"
              [t "left event"
               [p "left middle"
                t'join]]
             ,p "right branch"
              [t "right event"
               [p "right middle"
                t'join]]
             ]]
  where
    t'fork = T Fork 1
    t'join = [T Join 1 end]

-- a "marking" keeps track of how many dots are in which plaes
type Marking = Map.Map PLabel Int
start_marking = Map.fromList [(Start, 1)]

-- which transitions are ready to fire?
-- return a list of transition labels whose places meet the edgecount requirement
readyToFire :: Marking -> Place PLabel TLabel -> [TLabel]
readyToFire marking (P pl needed ts) =
  if length (maybeToList $ Map.lookup pl marking) >= needed
  then getLabel ts ++ (concatMap (readyToFire marking) (concat $ pChildren ts))
  else []
  where getLabel ts  = [ tl | (T tl _ _) <- ts ]
        pChildren ts = [ c  | (T tl _ c) <- ts ]

-- todo -- convert this to some sort of fix or fold
play :: PetriNet PLabel TLabel -> [[TLabel]]
play pn =
  [[]] -- note that we should automatically play through any Fork | Join | Noop events
       -- but halt on (TL _) as that indicates we need an external user action to occur
  where
    step :: Marking -> [Place PLabel TLabel] -> [TLabel]
    step m ps = concatMap (readyToFire m) ps

-- the above syntax implies a petri net where one of the places (typically the start node)
-- can be used as a root; but a properly general petri net could have any number of starting places!
-- let's accommodate that:
data PetriNet pl tl = MkPN { graph :: [Place pl tl]
                           , marking :: Marking
                           }

main = do
  putStrLn "example 1:";  print (readyToFire start_marking example_1)
  putStrLn "example 2:";  print (readyToFire start_marking example_2)
  
-- references:
-- http://www.pnml.org/version-2009/version-2009.php
-- https://en.wikipedia.org/wiki/Petri_net
