{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DeriveGeneric #-}

module Petri where

import qualified Data.Map as Map
import Control.Monad
import Data.Maybe (maybeToList)
import Data.List (nub, intersect, intercalate)
import Generic.Data (Generic, Generically(..))
import qualified Prettyprinter as PP
import Prettyprinter (vsep, hsep, line, pretty, viaShow, hang, indent, Doc)

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

notTL (TL _) = False
notTL _      = True

-- a couple of helper functions help to set up a petri net that hasn't started running yet
p pl ts = P (PL pl) 1 ts
t tl ps = T (TL tl) 1 ps
end = [P End 1 []]
start = P Start 1

example_1 = start
            [t "middle"
             end]
pn_1 = pn_from_simple [example_1]

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
pn_2 = pn_from_simple [example_2]

example_3 = start
            [T (Noop "middle") 1
             end]
pn_3 = pn_from_simple [example_3]

example_4 = start
            [t'fork
             [p "left branch"
              [t "left event"
               [p "left middle"
                t'join]]
             ,p "right branch"
              [T (Noop "right event") 1
               [p "right middle"
                t'join]]
             ]]
  where
    t'fork =  T (Fork "fork 1") 1
    t'join = [T (Join "fork 1") 1 end]
pn_4 = pn_from_simple [example_4]


-- a "marking" keeps track of how many dots are in which plaes
type Marking pl = Map.Map pl Int
start_marking = Map.fromList [(Start, 1)]

-- the above syntax implies a petri net where one of the places (typically the start node)
-- can be used as a root; but a properly general petri net could have any number of starting places!
-- A more correct representation would also allow us to weight each P->T and T->P edge independently.
-- we don't have that yet. Let's write a converter from the above simple format to a more correct
-- format.
data PetriNet pl tl = MkPN { places :: [pl]
                           , transitions :: [tl]
                           , ptEdges :: [(pl,tl,Int)]
                           , tpEdges :: [(tl,pl,Int)]
                           }
                      deriving (Ord, Eq, Show, Generic)
                      deriving (Semigroup, Monoid) via Generically (PetriNet pl tl)

nubPN :: (Eq pl, Eq tl) => PetriNet pl tl -> PetriNet pl tl
nubPN (MkPN ps ts pte tpe) = MkPN (nub ps) (nub ts) (nub pte) (nub tpe)

pn_from_simple :: (Eq pl, Eq tl) => [Place pl tl] -> PetriNet pl tl
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
enabled :: PetriNet PLabel TLabel -> Marking PLabel -> [TLabel]
enabled pn marking =
  [ transition
  | transition <- transitions pn
  , all (\(pl, n) -> Map.lookup pl marking >= Just n) [ (pl, n) | (pl, tl, n) <- ptEdges pn , tl == transition ]
  ]

getLabel ts  = [ tl | (T tl _ _) <- ts ]
pChildren ts = concat [ ps | (T tl _ ps) <- ts ]
tChildren ps = concat [ ts | (P pl _ ts) <- ps ]

getPlabel (P pl _ _) = pl
getTlabel (T tl _ _) = tl

type Remarks = [String]

type PlayLog = (Marking PLabel, Remarks, [TLabel])

-- step as far as possible through a net until we encounter a non-deterministic "choice".
-- we show which steps could autoplay, then we return to the caller with a list of TLabels.
-- we're waiting for input and expecting that input to be one of those TLabels.
play :: PetriNet PLabel TLabel -- immutable petri net "background"
     -> Marking PLabel         -- which places have dots in them?
     -> [TLabel]               -- we receive from the environment a set of events -- those transitions are to fire
     -> [          -- we return a list of zero or more steps representing subsequent activity in the net.
  ( Marking PLabel -- marking for the step
  , Remarks        -- human-readable commentary
  , [TLabel]       -- transitions that are enabled in the step; the next read from the environment should be one of the TLs.
  )]
play pn m events =
  -- how do we know when to return? when the list of TLabels doesn't change -- we've reached a fixpoint!
  let starter = (m, ["play: starting"], events)
  in
  starter : untilStable (autostep pn) starter

untilStable :: (Eq a) => (a -> a) -> a -> [a]
untilStable f i0 =
  let i1 = f i0
      i2 = f i1
  in if i1 == i2
     then [i1]
     else  i1 : untilStable f i1

autostep :: PetriNet PLabel TLabel -> PlayLog -> PlayLog
autostep pn (mm,r,events) =
  -- only autostep those events which are TLabel typed Noop, Fork, or Join -- but not TL, because that requires user input
  let autoEnabled = filter notTL events
  in if null autoEnabled
     then (mm,["autostep: original events: " ++ show events
              ,"autostep: no more autoEnabled events found; returning input event set"],events)
     else step pn (mm,["autostep: stepping..."],autoEnabled)

step :: PetriNet PLabel TLabel -> PlayLog -> PlayLog
step pn (m,r,events) =
  -- of those events which are actually enabled (ready to fire)
  -- perform the transition by deleting dots from the input places
  -- and create dots in the output places
  let ready = enabled pn m
      tofire = intersect events ready
      remarks1 = ["step: enabled: "         ++ show ready
                 ,"step: received events: " ++ show events
                 ,"step: intersection: "    ++ show tofire
                 ]
      (newMarking, remarks2) = Prelude.foldl (fire pn) (m,remarks1) tofire
      expecting = enabled pn newMarking
      remarks3 = [ "step: new marking: "      ++ show newMarking
                 , "step: expecting events: " ++ show expecting
                 ]
  in (newMarking, intercalate [""] [r, remarks1, remarks2, remarks3], expecting)

-- fire a particular transition against a particular marking of a particular petri net
fire :: PetriNet PLabel TLabel -> (Marking PLabel,Remarks) -> TLabel -> (Marking PLabel, Remarks)
fire pn (mOrig,remarks) tl' = do
  -- adjust the marking by removing the appropriate number of dots from source places
  let adjustments = [ (maybe (Just 0) (Just . subtract n), pl)
                    | (pl, tl, n) <- ptEdges pn
                    , tl == tl' ]
  -- and add the appropriate number of dots to the destination places
                    ++
                    [ (maybe (Just n) (Just . (+n)), pl)
                    | (tl, pl, n) <- tpEdges pn
                    , tl == tl' ]
      result = foldl (flip (uncurry Map.alter)) mOrig adjustments
  (result, ["fire: performing [" ++ show tl' ++ "] (" ++ (show $ length adjustments) ++ " adjustments)"])
  

data Auto = Full | Semi | Manual
  deriving (Eq)


main = do
-- putStrLn "* example 1"; mydo pn_1
--  putStrLn "* example 2"; mydo pn_2
  putStrLn "* example 4"; mydo pn_4
  where mydo pn = run pn start_marking

run :: PetriNet PLabel TLabel -> Marking PLabel -> IO ()
run pn marking = do
  let ready = enabled pn start_marking
      playlog = play pn marking ready
  putStrLn $ "petri net: " ++ show pn
  putStrLn $ "we start with initial transitions: " ++ show ready
  putStrLn $ "PLAYLOG:\n" ++ show (showpl (zip [1..] playlog))

showpl :: [(Int,PlayLog)] -> Doc ann
showpl playlog =
  vsep [   pretty "** " <> viaShow n <>
         line <> vsep [ 
                        (hang 4 $ pretty "*** Remarks:" <> line <> vsep (pretty <$> rs)) <> line <> line <>
                        pretty "*** Result Marking:" <> line <> viaShow mpl <> line <> line <>
                        pretty "*** Expecting: " <> line <> viaShow tls
                      ]
          | (n,(mpl, rs, tls)) <- playlog ]

-- references:
-- http://www.pnml.org/version-2009/version-2009.php
-- https://en.wikipedia.org/wiki/Petri_net
