{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TupleSections #-}

module Petri where

import qualified Data.Map as Map
import Control.Monad
import Data.Maybe (listToMaybe)
import Data.List (nub, intersect, intercalate, (\\))
import Generic.Data (Generic, Generically(..))
import qualified Prettyprinter as PP
import Prettyprinter (vsep, hsep, line, pretty, viaShow, hang, indent, Doc)

import Debug.Trace

-- the simple version of a petri net assumes all edge weights are 1.
--                      a P->T edge label means the number of dots needed to fire
--                      a T->P edge label means the number of dots produced by firing in each place
data Place      pl tl = P pl Int [Transition tl pl] deriving (Eq, Show, Read)
data Transition tl pl = T tl Int [Place pl tl]      deriving (Eq, Show, Read)

type StringText = String

-- we distinguish label types
data PLabel = Start | End
            | PL StringText deriving (Ord, Eq, Show, Read)
data TLabel = Fork StringText
            | Join StringText
            | Noop StringText
            | Case StringText (Maybe StringText) -- read from symbol table; conditional branch; must match Accumulator's st
            | TL   StringText deriving (Ord, Eq, Show, Read)

-- a couple of helper functions help to set up a petri net that hasn't started running yet
p pl ts = P (PL pl) 1 ts
t tl ps = T (TL tl) 1 ps
end = [P End 1 []]
start = P Start 1

example_1 :: Place PLabel TLabel
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

data Accumulator = Acc { mp :: Marking PLabel
                       , st :: Map.Map StringText (Maybe StringText) -- symbol table for recording Race = Dwarf or Race = Elf; must match the TLabel Case type
                       }
                   deriving (Show, Read, Eq)

-- the start node(s) of a petri net is(are) the node(s) with no indegrees. generously label each with a token.
start_marking pn =
  let start_places = filter (\x -> length (indegrees pn x) == 0) (places pn)
  in Map.fromList ((, 1) <$> start_places)

start_accumulator pn = Acc (start_marking pn) Map.empty

-- the end node(s) of a petri net is(are) the node(s) with no outdegrees.
end_marking pn =
  let end_places = filter (\x -> length (outdegrees pn x) == 0) (places pn)
  in Map.fromList ((, 1) <$> end_places)

indegrees  pn p = [ q | (_,q,_) <- tpEdges pn, p == q ]
outdegrees pn p = [ q | (q,_,_) <- ptEdges pn, p == q ]

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
                      deriving (Ord, Eq, Show, Read, Generic)
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
enabled :: PetriNet PLabel TLabel -> Accumulator -> [TLabel]
enabled pn (Acc marking symtab) =
  [ transition
  | transition <- transitions pn
  , all (\(pl, n) -> Map.lookup pl marking >= Just n)
      [ (pl, n) | (pl, tl, n) <- ptEdges pn , tl == transition ]
  ]

type AccumulatorE = Either String Accumulator

-- complication: step0 matches on tl == eventName, so we have to reformat
-- the list of events to be a ((Case n v),v) for it to match the tl eventNames
chooseCase :: PetriNet PLabel TLabel -> AccumulatorE -> AccumulatorE
chooseCase pn acce = do
  acc <- acce
  let
    caseReady = [ (transition,evalue)
                | transition@(Case ename evalue) <- enabled pn acc
                , st acc Map.!? ename == Just evalue
                ]
  -- the actual choice(s) is the intersection between caseReady and the symbol table
  -- where the values match
  -- in a future version of this language we will allow cases to use < = > operators
  -- and we will test for totality not just over data constructors but over numbers
  foldl (step0 pn) acce caseReady
  

getLabel :: [Transition a pl] -> [a]
getLabel ts  = [ tl | (T tl _ _) <- ts ]
pChildren :: [Transition tl pl] -> [Place pl tl]
pChildren ts = concat [ ps | (T tl _ ps) <- ts ]
tChildren :: [Place pl tl] -> [Transition tl pl]
tChildren ps = concat [ ts | (P pl _ ts) <- ps ]

getPlabel :: Place pl tl -> pl
getPlabel (P pl _ _) = pl
getTlabel :: Transition tl pl -> tl
getTlabel (T tl _ _) = tl

type Event = (EventName, EventValue)
type EventName = TLabel
type EventValue = Maybe StringText

play0 :: PetriNet PLabel TLabel -> AccumulatorE -> AccumulatorE
play0 pn acce = do
  acc <- acce
  let
    autoTransitions = (,Nothing) <$> filter autoEvent (enabled pn acc)
    afterAuto = foldl (step0 pn) (Right acc) autoTransitions
    afterCase = chooseCase pn afterAuto
  if acce /= afterCase
    then play0 pn afterCase
    else afterCase
  -- surely there's a better way to say we want to converge to a fixpoint

autoEvent (TL   _  ) = False
autoEvent (Case _ _) = False
autoEvent _          = True

-- TODO: add support for inhibitor arcs.
step0 :: PetriNet PLabel TLabel
      -> AccumulatorE
      -> Event
      -> AccumulatorE
step0 _ (Left acc) _ = Left acc
step0 pn (Right acc@(Acc mm symtab)) (eventName, eventValue) =
  let ready = enabled pn acc
      removal = [ (maybe (Just 0) (Just . subtract n), pl)
                | (pl, tl, n) <- ptEdges pn
                , tl == eventName ]
      duringMarking = foldl (flip (uncurry Map.alter)) mm removal
      addition = [ (maybe (Just n) (Just . (+n)), pl)
                 | (tl, pl, n) <- tpEdges pn
                 , tl == eventName ]
      afterMarking  = foldl (flip (uncurry Map.alter)) duringMarking addition
  in
    if   eventName `notElem` ready
    then Left ("unable to fire " ++ show eventName ++ ": not enabled! (expecting "++show ready++ ")")
    else Right (Acc afterMarking (case eventName of
                                    TL ename -> Map.union (Map.singleton ename eventValue) symtab
                                    _        -> symtab))


-- play1 :: PetriNet PLabel TLabel         -- underlying PN
--       -> Either String (Marking PLabel) -- "accumulator"
--       -> Event                          -- incoming event
--       -> Either String [Marking PLabel] -- output
-- play1 _ (Left x) _ = Left x
-- play1 pn (Right m0) e = do
--   let m1 = play0 pn m0
--   m2 <- step0 pn m1 e
--   play0 pn m2

play1 :: PetriNet PLabel TLabel         -- underlying PN
      -> AccumulatorE                   -- marking and symbol table
      -> Event                          -- incoming event
      -> AccumulatorE                   -- wrapped in Either for error handling
play1 _ (Left x) _ = Left x
play1 pn (Right acc0@(Acc m0 symtab)) e = do
  let acc1 = play0 pn (Right acc0)
      acc2 = step0 pn acc1 e
  acc3 <- play0 pn acc2
  return $ acc3 { mp = Map.filter (/= 0) (mp acc3) }

play :: PetriNet PLabel TLabel -> AccumulatorE -> [Event]
     -> AccumulatorE
play pn startAccE events = foldl (play1 pn) startAccE events

playlog pn startAccE events = scanl (play1 pn) startAccE events

main = do
-- putStrLn "* example 1"; mydo pn_1
--  putStrLn "* example 2"; mydo pn_2
  putStrLn "* example 4"; mydo pn_4
  where mydo pn = print $ play pn (Right $ start_accumulator pn) []

run :: PetriNet PLabel TLabel
    -> ((Int, Event, Accumulator) -> IO ())
    -> [Event]
    -> IO ()
run pn dumper events = do
  let runlog  = zip3 [1..] ((Noop "start",Nothing):events) (playlog pn (Right $ start_accumulator pn) events)
  putStrLn $ "* petri net:\n" ++ show pn
  forM_ runlog (\(count, event, acce) -> do
                   putStrLn $ "** " ++ show count ++ ": " ++ show event
                   case acce of
                     Left errstr -> putStrLn errstr
                     Right acc   -> do print acc
                                       dumper (count,event,acc)
               )


-- references:
-- http://www.pnml.org/version-2009/version-2009.php
-- https://en.wikipedia.org/wiki/Petri_net
