{-# LANGUAGE PackageImports #-}

module Lib
    ( someFunc
    ) where

import qualified Data.Map as Map
import Data.Tree
import Data.Graph.Inductive
import Data.List
import Data.GraphViz (preview, GraphvizParams (fmtNode, fmtEdge, globalAttributes), graphToDot, nonClusteredParams, setDirectedness, DotGraph, printDotGraph)

import Petri

-- from rule34-haskell package
import Graphviz
import GraphViz

type StateName = String
type EdgeLabel = String

-- What we think of as a "state" is a node -- in two ways:
-- 1. it is a node in a TREE -- a containment hierarchy, in the sense of "hierarchical state machine"
-- 2. it is a node in a GRAPH -- of possibly labeled edges, pointing to next-states

-- To satisfy the hierarchical aspect, we define a tree of states.
-- We talk about parents and children. And clusters.
type StateTree = Tree State

-- To satisfy the graph aspect, we make room inside each node for labeled exit edges.
-- We talk about sources and targets, aka "ins" and "outs".
data State = (:->) { stateName :: StateName
                   , outEdges  :: [(Maybe EdgeLabel, StateName)]
                   }
             deriving (Eq, Show)

-- We have some syntactic sugar for constructors
leaf x = Node x []
state x = x :-> []
x `contains` y = Node x y

-- Now we have a grammar for specifying the character creator HSM!
charCreator :: StateTree
charCreator =
  state "Character Creation" `contains`
  [ "Pre-Equipment" :-> [(Nothing, "Choose Equipment")]
    `contains`
    [ leaf $ state "Choose Class"
    , leaf $ state "Choose Background"
    ]
  , state "Choose Description" `contains`
    [ leaf $ state "Choose Age"
    , leaf $ "Choose Height" :-> [(Nothing, "Choose Width")]
    --- ^ add "Choose Width" (not in original spec) to demonstrate need for recursion in the @grow@ function
    , leaf $ state "Choose Appearance"
    , leaf $ state "Choose Alignment"
    ]
  , leaf $ state "Choose Ability Scores"
  , leaf $ "Choose Race" :-> [(Just "Dwarf", "Choose Dwarf Sub-Race")
                             ,(Just "Elf",   "Choose Elf Sub-Race")]
  ]

-- The initial graph needs to be slightly cleaned up before it is ready for prime time.
normalize :: StateTree -> StateTree
normalize = grow

-- In the "grow" phase of normalization, we promote any targets of "siblings", to leaf nodes at the same level, if they don't already exist there.
grow :: StateTree -> StateTree
grow (Node parent siblings) =
  let grownSiblings = grow <$> siblings
  in
  Node parent (grownSiblings ++ nub [ leaf $ state target
                               | (Node (_ :-> outs) children) <- grownSiblings
                               , (_, target) <- outs
                               , target `notElem` (stateName . rootLabel <$> grownSiblings)
                                 -- yes I know this is accidentallyquadratic.tumblr.com
                               ])

-- output to Dot representation of original spec.
-- every non-leaf node is a cluster
asHSM :: a
asHSM = undefined 

-- output to Petri net representation.
-- Petri Nets are a graph; they aren't strictly hierarchical -- we're not doing Nets In Nets.
-- so how do we take a Workflow approach to this?
-- https://en.wikipedia.org/wiki/Petri_net#Workflow_nets
-- 
-- We flatten the hierarchy into a workflow model by doing a couple of things:
-- we rewrite all targetless children of a state to be indegrees of a join event that points to a parent state.
-- we rewrite all sourceless children of the root state to be targets of a fork event.

-- a labeled out edge becomes a downstream transition from a place.
-- "case" conditions are represented as "nondeterminism" where a place can have multiple output transitions;
-- it's up to the environment to tell us which of the transitions actually fired.
-- in other words, case race of
--                        dwarf -> foo
--                        elf   -> bar
-- translates to (chose race) place, with two output transitions
--                -> [ race is dwarf ] -> (ready to choose dwarf sub-race) -> [ choose dwarf sub-race ] ->
--                -> [ race is elf   ] -> (ready to choose elf   sub-race) -> [ choose elf sub-race ] ->


-- (front)    -> [pre]  -> (recurse) -> [post] -> (back)
-- (awaiting) -> [fork] -> (recurse) -> [join] -> (decided)
-- (start)    -> [push] -> (recurse) -> [pop]  -> (end)
asPetri :: StateTree -> PetriNet PLabel TLabel
asPetri (Node (state :-> nexts) children) =
  let itemname      = case take 6 state of
                        "Choose" -> drop 7 state
                        _        -> state
      (front, back) = case take 6 state of
                        "Choose" -> (PL $ "Awaiting " <> itemname, PL $ "Decided " <> itemname)
                        _        -> (PL $ "Begin "    <> itemname, PL $ "End "     <> itemname)
      middle        = TL itemname
      (pre, post)   = if length children == 1
                      then (Noop $ itemname ++ " PUSH", Noop $ itemname ++ " POP")
                      else (Fork $ itemname ++ " FORK", Join $ itemname ++ " JOIN")
      childPetris   = asPetri <$> children
      mchildPetri   = mconcat childPetris
      scatter       = [ (pre,startState,1)
                      | childPetri <- childPetris
                      , let startState = head $ places childPetri ]
      gather        = [ (endState,post,1)
                      | childPetri <- childPetris
                      , let endState = last $ places childPetri ]
      withChildren  = case length children of
        --   places                transitions  p->t edges             t->p edges
        0 -> MkPN [front, back]    [middle]     [(front, middle, 1)]   [(middle,back,1)]
        _ -> MkPN [front]          [pre]        [(front, pre, 1)]      scatter
             <> mchildPetri <>
             MkPN [back]           [post]       gather                 [(post, back, 1)]
      nextStates   = mconcat
        [ MkPN    [next]           [proceed]    [(back, proceed, 1)]   [(proceed,next,1)]
        | (edgeLabel, statename) <- nexts
        , let next = PL statename
              proceed = maybe (Noop $ "proceeding directly from " ++ itemname ++ " to " ++ statename)
                              (\el -> TL $ "from " ++ itemname ++ ", choice \"" ++ el ++ "\" leads to " ++ statename) edgeLabel
        ]
   in
   nubPN $ withChildren <> nextStates

someFunc :: IO ()
someFunc = do
  let pcc = asPetri charCreator
  Petri.run pcc (Map.fromList [(head $ places pcc, 1)])

previewPCC :: IO ()
previewPCC = previewPetri $ asPetri charCreator