{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TupleSections #-}

module Petri where

import qualified Data.Map as Map
import Control.Monad
import Data.Maybe (maybeToList)
import Data.List (nub, intersect, intercalate, (\\))
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
            | Case StringText StringText -- read from symbol table; conditional branch
            | TL   StringText deriving (Ord, Eq, Show)

notTL (TL _) = False
notTL _      = True

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
  , all (\(pl, n) -> Map.lookup pl marking >= Just n)
      [ (pl, n) | (pl, tl, n) <- ptEdges pn , tl == transition ]
  ]

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

play0 :: PetriNet PLabel TLabel -> Marking PLabel -> Marking PLabel
play0 pn mm =
  let
    autoTransitions = (,Nothing) <$> filter notTL (enabled pn mm)
    pnew = foldl (step0 pn) (Right mm) autoTransitions
  in
    case pnew of
      Left onoes -> error onoes
      Right yay  -> yay

-- TODO: we need to store the eventValue in a symbol table.
-- TODO: add support for inhibitor arcs.
step0 :: PetriNet PLabel TLabel
      -> Either String (Marking PLabel)
      -> Event
      -> Either String (Marking PLabel)
step0 _ (Left mm) _ = Left mm
step0 pn (Right mm) (eventName, eventValue) =
  let ready = enabled pn mm
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
    else Right afterMarking


-- "yellow" because we are doing a FoldPlay
yellow :: PetriNet PLabel TLabel         -- underlying PN
       -> Either String (Marking PLabel) -- "accumulator"
       -> Event                          -- incoming event
       -> Either String (Marking PLabel) -- output
yellow _ (Left x) _ = Left x
yellow pn (Right m0) e =
  let
    m1 = play0 pn m0
  in
    case step0 pn (Right m1) e of
      Left  onoes -> Left  onoes
      Right yay   -> Right yay
  

play :: PetriNet PLabel TLabel -> Marking PLabel -> [Event]
 -> Either String (Marking PLabel)
play pn startM events =
  case foldl (yellow pn) (Right startM) events of
    Left onoes -> Left $ "runstream failure: " ++ onoes
    Right yay  -> Right yay


-- TODO: create symbol table to log choice values
  
data Auto = Full | Semi | Manual
  deriving (Eq)


main = do
-- putStrLn "* example 1"; mydo pn_1
--  putStrLn "* example 2"; mydo pn_2
  putStrLn "* example 4"; mydo pn_4
  where mydo pn = print $ play pn start_marking []

run :: PetriNet PLabel TLabel -> Marking PLabel -> IO ()
run pn marking = do
  let ready = enabled pn start_marking
      playlog = play pn marking ((,Nothing) <$> ready)
  putStrLn $ "* petri net:\n" ++ show pn
  putStrLn $ "we start with initial transitions: " ++ show ready


-- references:
-- http://www.pnml.org/version-2009/version-2009.php
-- https://en.wikipedia.org/wiki/Petri_net
