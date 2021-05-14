{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DeriveGeneric #-}
module Petri where

import qualified Data.Map as Map
import Data.Maybe (maybeToList)
import Data.List (nub, intersect)
import Generic.Data (Generic, Generically(..))

-- the simple version of a petri net assumes all edge weights are 1.
--                      a P->T edge label means the number of dots needed to fire
--                      a T->P edge label means the number of dots produced by firing in each place
data Place      pl tl = P pl Int [Transition tl pl] deriving (Eq, Show)
data Transition tl pl = T tl Int [Place pl tl]      deriving (Eq, Show)

type StringText = String

-- we distinguish label types
data PLabel = Start | End
            | PL StringText deriving (Ord, Eq, Show)
data TLabel = Fork StringText
            | Join StringText
            | Noop StringText
            | TL   StringText deriving (Ord, Eq, Show)

-- a couple of helper functions help to set up a petri net that hasn't started running yet
p pl ts = P (PL pl) 1 ts
t tl ps = T (TL tl) 1 ps
end = [P End 1 []]
start = P Start 1

example_1 = start
            [t "middle"
             end]

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
    t'fork =  T (Fork "fork 1") 1
    t'join = [T (Join "fork 1") 1 end]

-- a "marking" keeps track of how many dots are in which plaes
type Marking pl = Map.Map pl Int
start_marking = Map.fromList [(Start, 1)]

-- the above syntax implies a petri net where one of the places (typically the start node)
-- can be used as a root; but a properly general petri net could have any number of starting places!
-- A more correct representation would also allow us to weight each P->T and T->P edge independently.
-- we don't have that yet. Let's write a converter from the above simple format to a more correct
-- format.
data PetriNet pl tl = MkPN { places :: [PLabel]
                           , transitions :: [TLabel]
                           , ptEdges :: [(PLabel,TLabel,Int)]
                           , tpEdges :: [(TLabel,PLabel,Int)]
                           }
                      deriving (Ord, Eq, Show, Generic)
                      deriving (Semigroup, Monoid) via Generically (PetriNet pl tl)

pn_from_simple :: [Place PLabel TLabel] -> PetriNet p t
pn_from_simple ps = MkPN
                    (nub $ getPlaces ps)
                    (nub $ getTransitions ps)
                    (nub $ getPTedges ps)
                    (nub $ getTPedges (tChildren ps))
  where
    getPlaces      ps = concat [ pl : getPlaces (pChildren ts) | (P pl _ ts  ) <- ps ]
    getTransitions ps = concat [ tl : getTransitions ps'       | (P pl _ ts  ) <- ps
                                                               , (T tl _ ps' ) <- ts ]
    getPTedges     ps = concat [ (pl,tl,pt) : getPTedges ps'   | (P pl pt ts ) <- ps
                                                               , (T tl _ ps' ) <- ts ]
    getTPedges     ts = concat [ (tl,pl,tp) : getTPedges ts'   | (T tl _ ps  ) <- ts
                                                               , (P pl tp ts') <- ps ]
-- now let's actually run the petri net.

-- which transitions are ready to fire?
-- return a list of transition labels where all input places meet the edgecount requirement
readyToFire :: PetriNet PLabel TLabel -> Marking PLabel -> [TLabel]
readyToFire pn marking =
  [ transition
  | transition <- transitions pn
  , all (\(pl, n) -> Map.lookup pl marking >= Just n) [ (pl, n) | (pl, tl, n) <- ptEdges pn , tl == transition ]
  ]

getLabel ts  = [ tl | (T tl _ _) <- ts ]
pChildren ts = concat [ ps | (T tl _ ps) <- ts ]
tChildren ps = concat [ ts | (P pl _ ts) <- ps ]

getPlabel (P pl _ _) = pl
getTlabel (T tl _ _) = tl

-- todo -- convert this to some sort of fix or fold
play :: PetriNet PLabel TLabel -> Marking PLabel -> [[TLabel]]
play pn m =
  [[]] -- note that we should automatically play through any Fork | Join | Noop events
       -- but halt on (TL _) as that indicates we need an external user action to occur
  where
    step :: PetriNet PLabel TLabel -> Marking PLabel -> [TLabel] -> Marking PLabel
    step pn m events =
      -- of those events which are actaully readyToFire
      -- perform the transition by deleting dots from the input places
      -- and create dots in the output places
      let tofire = intersect events (readyToFire pn m)
      in Prelude.foldl (fire pn) m tofire

-- fire a particular transition against a particular marking of a particular petri net
fire :: PetriNet PLabel TLabel -> Marking PLabel -> TLabel -> Marking PLabel
fire pn mOrig tl' =
  -- adjust the marking by removing the appropriate number of dots from source places
  let adjustments = [ (maybe (Just 0) (Just . (subtract n)), pl)
                    | (pl, tl, n) <- ptEdges pn
                    , tl == tl' ]
  -- and add the appropriate number of dots to the destination places
                    ++
                    [ (maybe (Just n) (Just . (+n)), pl)
                    | (tl, pl, n) <- tpEdges pn
                    , tl == tl' ]
  in Prelude.foldl (flip (uncurry Map.alter)) mOrig adjustments
  


data Auto = Full | Semi | Manual
  deriving (Eq)


main = do
  putStrLn "* example 1"; run (pn_from_simple [example_1]) start_marking
  putStrLn "* example 2"; run (pn_from_simple [example_2]) start_marking

run pn sm = do
  let ready1 = readyToFire pn sm
  putStrLn $ "petri net: " ++ show pn
  putStrLn $ "start marking: " ++ show sm
  putStrLn $ "ready to fire: " ++ show ready1
  mapM_  print (fire pn start_marking <$> ready1)
  
-- references:
-- http://www.pnml.org/version-2009/version-2009.php
-- https://en.wikipedia.org/wiki/Petri_net
