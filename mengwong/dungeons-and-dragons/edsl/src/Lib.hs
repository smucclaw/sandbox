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
-- Petri Nets aren't strictly hierarchical.
-- We flatten the hierarchy by doing a couple of things:
-- we rewrite all targetless children of a state to be indegrees of a join event that points to a parent state.
-- we rewrite all sourceless children of the root state to be targets of a fork event.
-- that's how we do synchronization!


-- a labeled out edge becomes a downstream place

asPetri :: StateTree -> PetriNet PLabel TLabel
asPetri (Node (state :-> nexts) []) -- no children; the transition is "choose"
  | take 6 state == "Choose" = let itemname = drop 7 state
                                   awaiting = PL $ "Awaiting " <> itemname
                                   decided  = PL $ "Decided " <> itemname
                               in MkPN
                                  [awaiting, decided]
                                  [TL state]
                                  [(awaiting,TL state,1)]
                                  [(TL state,decided,1)]
  | otherwise = let begin  = PL $ "Begin " ++ state
                    middle = TL state
                    end    = PL $ "End " ++ state
                in MkPN
                   [begin, end]
                   [middle]
                   [(begin,middle,1)]
                   [(middle,begin,1)]

asPetri (Node (state :-> nexts) [child]) -- got children; a single child; the transition is the child
  | take 6 state == "Choose" = let itemname = drop 7 state
                                   awaiting = PL $ "Awaiting " <> itemname
                                   decided  = PL $ "Decided " <> itemname
                                   childPetri = asPetri child
                               in childPetri <>
                                  MkPN
                                  [awaiting, decided]
                                  []
                                  [(awaiting,head (transitions childPetri),1)]
                                  [(last (transitions childPetri),decided,1)]
  | otherwise = error $ "unsupported state command " ++ state

asPetri (Node (state :-> nexts) children) -- got children; multiple children; we fork/join the children
  | take 6 state == "Choose" = let itemname = drop 7 state
                                   awaiting = PL $ "Awaiting " <> itemname
                                   decided  = PL $ "Decided " <> itemname
                                   myfork   = Fork $ itemname ++ " FORK"
                                   myjoin   = Join $ itemname ++ " JOIN"
                                   childPetris = asPetri <$> children
                               in mconcat childPetris <> MkPN
                                  [awaiting, decided]
                                  [myfork, myjoin]
                                  ((awaiting,myfork,1) : [ (endState,myjoin,1)
                                                         | childPetri <- childPetris
                                                         , let endState = last $ places childPetri ])
                                  ((myjoin,decided,1) : [ (myfork,startState,1)
                                                        | childPetri <- childPetris
                                                        , let startState = head $ places childPetri
                                                        ])
  | otherwise = let begin  = PL $ "Begin " ++ state
                    end    = PL $ "End " ++ state
                    myfork = Fork $ state ++ " FORK"
                    myjoin = Join $ state ++ " JOIN"
                    childPetris = asPetri <$> children
                in MkPN [begin] [myfork] [(begin,myfork,1)]
                    [ (myfork,startState,1)
                    | childPetri <- childPetris
                    , let startState = head $ places childPetri
                    ]
                   <> mconcat childPetris
                   <> MkPN
                   [end]
                   [myjoin]
                   [ (endState,myjoin,1)
                   | childPetri <- childPetris
                   , let endState = last $ places childPetri ]
                   [(myjoin,end,1)]

-- TODO: hook up my "decided" to the next stages' inputs via a NOOP
        
synchronize :: StateTree -> StateTree
synchronize = fork . join

fork = todo
join = todo
todo = id

-- asPetri :: StateTree -> DotGraph State


someFunc :: IO ()
someFunc = do
  let pcc = asPetri charCreator
  Petri.run pcc (Map.fromList [(head $ places pcc, 1)])

