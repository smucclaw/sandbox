{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DeriveGeneric #-}

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

type Remarks = [String]

data PlayLog = PStep { marking :: Marking PLabel  -- marking for the step
                     , remarks :: Remarks         -- human-readable commentary
                     , lit     :: Maybe TLabel    -- a lit transition
                     , events  :: [TLabel]        -- input event transitions.
                     }
             deriving (Eq, Show)


-- machinery to handle an event stream
type StreamHandler state event log = (state,log) -> event -> (state,log)
data MyPetri = MyPetri (PetriNet PLabel TLabel) (Marking PLabel) deriving (Show)
type Event = (EventName, EventValue)
type EventName = StringText
type EventValue = Maybe StringText

play0 :: (MyPetri,[StringText]) -> (MyPetri,[StringText])
play0 mp@(MyPetri pn mm,log) =
  let
    autoTransitions = filter notTL $ enabled pn mm
    pnew = foldr step0 (MyPetri pn mm) autoTransitions
  in
    (pnew,log ++ ["play0: ran " ++ show autotransition | autotransition <- autoTransitions])

step0 :: TLabel -> MyPetri -> MyPetri
step0 event (MyPetri pn mm) =
  let ready = enabled pn mm
      removal = [ (maybe (Just 0) (Just . subtract n), pl)
                | (pl, tl, n) <- ptEdges pn
                , tl == event ]
      duringMarking = foldl (flip (uncurry Map.alter)) mm removal
      addition = [ (maybe (Just n) (Just . (+n)), pl)
                 | (tl, pl, n) <- tpEdges pn
                 , tl == event ]
      afterMarking  = foldl (flip (uncurry Map.alter)) mm addition
      in MyPetri pn afterMarking

play1 :: (MyPetri,[StringText]) -> Event -> (MyPetri,[StringText],Maybe Event)
play1 (pn,log) e@(ename, evalue) =
  (pn,log ++ ["play1: rejected event " ++ ename],Just e)


  
-- step as far as possible through a net until we encounter a non-deterministic "choice".
-- we show which steps autoplay given the input events until they're all consumed.
-- given a marking, we're waiting for input and expecting that input to be one or more of the enabled TLabels.
play :: PetriNet PLabel TLabel -- immutable petri net "background"
     -> Marking PLabel         -- which places have dots in them?
     -> [TLabel]               -- we receive from the environment a set of events -- those transitions are to fire
     -> [PlayLog]
play pn m events =
  -- how do we know when to return? when there are no events left to handle!
  let starter = PStep m ["play: starting"] Nothing events
  in
  starter : untilStable (autostep pn) starter

-- a step can rewrite the marking and add events to the input list.
-- all notTL events are auto-fireable. So when a place is enabled, we examine all its ptEdges to look for nonTL transitions.
-- any notTL transitions get added to the input event list for subsequent firing.

-- a typical step looks like this:
-- Stage 1:
--   PStep is unlit -- the "lit" element is Nothing, meaning no transition is being fired at the moment
--   marking has some marked places
--   from that we compute which transitions are enabled
--   we are given some events from the environment in the input stream.
--   we compute the relevant events as being those which lie in the intersection of enabled ++ input
--   we auto-fire all the relevant events, calling stage 2 upon each one, collecting a log of the PSteps returned by stages 2a and 2b
-- Stage 2a:
--   given a relevant event, we return:
--     a "during" PStep with a marking showing the input places drained, and the transition lit
-- Stage 2b:
--     an "after" PStep showing:
--       the new place markings populated,
--       the transition unlit, and
--       newly enabled auto-fireable (notTL) events added to the input event stream
-- helper functions for stage 2:
-- Helper 3a: given a lit transition
--   drains the sources
-- Helper 3b: given a lit transition
--   fills the sinks

untilStable :: (Eq a) => (a -> [a]) -> a -> [a]
untilStable f i0 =
  let i1 = f i0
      i2 = f (last i1)
  in if last i1 == last i2
     then i1
     else i1 ++ untilStable f (last i1)

autostep :: PetriNet PLabel TLabel -> PlayLog -> [PlayLog]
autostep pn orig@(PStep mm r l events) =
  if null events
  then let ready = filter notTL $ enabled pn mm
           tentative = if not $ null ready
                       then [ orig, orig { remarks = ["autostep: event queue empty; found new auto-fireable enabled transitions"] } ] -- surprising if this happens
                       else [ orig, orig { remarks = ["autostep: event queue empty; no new auto-fireable transitions found"     ] } ]
       in if not $ null ready
          then tentative ++ step pn (PStep mm ["autostep: stepping through auto-fireable transitions"] Nothing ready)
          else tentative
  else step pn (PStep mm ["autostep: stepping through P..."] Nothing events)

step :: PetriNet PLabel TLabel -> PlayLog -> [PlayLog]
step pn orig@(PStep m r l events) =
  -- of those events which are actually enabled (ready to fire)
  -- perform the transition, logging the before, during, and after

  let ready = enabled pn m
      tofire = intersect events ready
      remarks1 = ["p step1: enabled: "         ++ show ready
                 ,"p step1: received events: " ++ show events
                 ,"p step1: intersection: "    ++ show tofire
                 ]

      fireLog = Prelude.foldl (fire pn) [orig] tofire
      aMarking = marking $ head fireLog
      expecting = enabled pn aMarking
      newEvents = filter notTL expecting
      newStream = nub $ (events \\ tofire) ++ newEvents
  in
    [ PStep  m       (intercalate [""] [r, remarks1]) Nothing events ]
    ++ reverse fireLog ++
    [ PStep  aMarking [ "step: calculated new expecting: " ++ show expecting
                      , "step: calculated new event stream: " ++ show newStream
                      ] Nothing newStream
    ]

-- TODO: add support for inhibitor arcs with weight 0
-- fire a particular transition against a particular marking of a particular petri net
-- show the "during" marking is a PStep lit; the after "after" marking is a PStep unlit.

fire :: PetriNet PLabel TLabel -> [PlayLog] -> TLabel -> [PlayLog]
fire pn psteps event =
  let pstep = head psteps
      m = marking pstep
      e = events  pstep
      
      removal = [ (maybe (Just 0) (Just . subtract n), pl)
                | (pl, tl, n) <- ptEdges pn
                , tl == event ]
      duringMarking = foldl (flip (uncurry Map.alter)) m removal

      addition = [ (maybe (Just n) (Just . (+n)), pl)
                 | (tl, pl, n) <- tpEdges pn
                 , tl == event ]
      afterMarking  = foldl (flip (uncurry Map.alter)) m addition
  in ( PStep  afterMarking ["fire: [" ++ show event ++ "] filled "  ++ show (length addition) ++ " sinks"]   Nothing      (e \\ [event])
     : PStep duringMarking ["fire: [" ++ show event ++ "] drained " ++ show (length removal)  ++ " sources"] (Just event) (e \\ [event])
     : psteps )


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
  putStrLn $ "* petri net:\n" ++ show pn
  putStrLn $ "we start with initial transitions: " ++ show ready
  putStrLn $ "* PLAYLOG:\n" ++ show (showpl (zip [1..] playlog))

showpl :: [(Int,PlayLog)] -> Doc ann
showpl playlog =
  vsep [   pretty "** " <> viaShow n <>
         line <> vsep [ 
                        pretty "*** Marking:" <> line <> vsep ((\m  -> pretty ("- " ++ show m)) <$> Map.toList mpl) <> line <> line <>
                        pretty "*** Remarks:" <> line <> vsep ((\tl -> pretty ("- " ++ tl)) <$> rs) <> line <>
                        (if not $ null lit then pretty "*** Lit Transition: " <> line <> viaShow lit <> line else PP.emptyDoc) <>
                        pretty "*** Event Stream: " <> line <> viaShow tls
                      ]
          | (n, PStep mpl rs lit tls) <- playlog ]

-- references:
-- http://www.pnml.org/version-2009/version-2009.php
-- https://en.wikipedia.org/wiki/Petri_net
