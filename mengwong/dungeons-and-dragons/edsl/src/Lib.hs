module Lib
    ( someFunc
    ) where

import Data.Tree
import Data.Graph.Inductive
import Data.List
import Data.GraphViz (preview, GraphvizParams (fmtNode, fmtEdge, globalAttributes), graphToDot, nonClusteredParams, setDirectedness, DotGraph, printDotGraph)

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
    , leaf $ state "Choose Height"
    , leaf $ state "Choose Appearance"
    , leaf $ state "Choose Alignment"
    ]
  , leaf . state $ "Get Ability Scores"
  , leaf $ "Choose Race" :-> [(Just "Dwarf", "Choose Dwarf Sub-Race")
                             ,(Just "Elf",   "Choose Elf Sub-Race")]
  ]

-- The initial graph needs to be slightly cleaned up before it is ready for prime time.
normalize :: StateTree -> StateTree
normalize = grow

-- In the "grow" phase of normalization, we promote any targets of "siblings", to leaf nodes at the same level, if they don't already exist there.
grow :: StateTree -> StateTree
grow (Node parent siblings) =
  Node parent (siblings ++ nub [ leaf $ state target
                               | (Node (_ :-> outs) children) <- siblings
                               , (_, target) <- outs
                               , not $ target `elem` (stateName . rootLabel <$> siblings)
                                 -- yes I know this is accidentallyquadratic.tumblr.com
                               ])

-- output to Dot representation of original spec.
-- every non-leaf node is a cluster


-- output to Petri net representation.
-- Petri Nets aren't strictly hierarchical.
-- We flatten the hierarchy by doing a couple of things:
-- we rewrite all targetless children of a state to be indegrees of a join event that points to a parent state.
-- we rewrite all sourceless children of the root state to be targets of a fork event.
-- that's how we do synchronization!

synchronize :: StateTree -> StateTree
synchronize = fork . join

fork = todo
join = todo
todo = id

-- asPetri :: StateTree -> DotGraph State


someFunc :: IO ()
someFunc = putStrLn "someFunc"
