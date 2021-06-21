{-# LANGUAGE PackageImports #-}

module Lib
    ( writePCC
    ) where

import qualified Data.Map as Map
import Data.Tree
import Data.List

import Data.Graph.Inductive
import Data.GraphViz (preview, GraphvizParams (fmtNode, fmtEdge, globalAttributes), graphToDot, nonClusteredParams, setDirectedness, DotGraph, printDotGraph)

import Petri

-- from rule34-haskell package
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
                   , outEdges  :: [(Maybe EdgeLabel, State)]
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
  [
  --   "Pre-Equipment" :-> [(Nothing, state "Choose Equipment")]
  --   `contains`
  --   [ leaf $ state "Choose Class"
  --   , leaf $ state "Choose Background"
  --   ]
  -- ,
  --   state "Choose Description" `contains`
  --   [ leaf $ state "Choose Age"
  --   , leaf $ "Choose Height" :-> [(Nothing, state "Choose Width")]
  --   --- ^ add "Choose Width" (not in original spec) to demonstrate need for recursion in the @grow@ function
  --   , leaf $ state "Choose Appearance"
  --   , leaf $ state "Choose Alignment"
  --   ]
  -- ,
    leaf $ state "Choose Ability Scores"
  ,
    leaf $ "Choose Race" :-> [(Just "Dwarf", state "Choose Dwarf Sub-Race")
                             ,(Just "Elf",   state "Choose Elf Sub-Race")]
  ]

-- The initial graph needs to be slightly cleaned up before it is ready for prime time.
normalize :: StateTree -> StateTree
normalize = id

-- In the "grow" phase of normalization, we promote any targets of "siblings", to leaf nodes at the same level, if they don't already exist there.
-- actually, this is not a good idea, because it ends up introducing incorrect relationships between boxes and their contents.
grow :: StateTree -> StateTree
grow (Node parent siblings) =
  let grownSiblings = grow <$> siblings
  in
  Node parent (grownSiblings ++ nub [ leaf $ target
                               | (Node (_ :-> outs) children) <- grownSiblings
                               , (_, target) <- outs
                               , stateName target `notElem` (stateName . rootLabel <$> grownSiblings)
                                 -- yes I know this is accidentallyquadratic.tumblr.com
                               ])

-- output to Dot representation of original spec.
-- every non-leaf node is a cluster
asHSM :: a
asHSM = undefined 

asPetri :: StateTree -> PetriNet PLabel TLabel
asPetri (Node (statename :-> nexts) children) =
  let itemname      = statename
      (front, back) = plprefix itemname
      middle        = TL itemname
      (pre, post)   = if length children == 1
                      then (Noop $ itemname ++ " PUSH", Noop $ itemname ++ " POP")
                      else (Fork $ itemname ++ " FORK", Join $ itemname ++ " JOIN")
      childPetris   = asPetri <$> children
      nextPetris    = asPetri <$> (leaf . snd <$> nexts)
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
             <> mconcat childPetris <>
             MkPN [back]           [post]       gather                 [(post, back, 1)]
      nextStates    = mconcat
        [ MkPN    []    [proceed]    [(back, proceed, 1)]   [(proceed,next1,1)]
        | (edgeLabel, nextstate) <- nexts
        , let nextstatename = stateName nextstate
              (next1,next2) = plprefix nextstatename
              proceed = maybe (Noop $ "proceeding directly from " ++ itemname ++ " to " ++ nextstatename)
                              (\el -> TL $ "after " ++ show back ++ ", choice \"" ++ el ++ "\" leads to " ++ nextstatename) edgeLabel
        ]
   in
   nubPN $ withChildren <> nextStates

prefix :: String -> (String, String)
prefix itemname = case take 6 itemname of
                    "Choose" -> ("Awaiting " <> itemname, "Decided " <> itemname)
                    _        -> ("Begin "    <> itemname, "End "     <> itemname)

plprefix itemname = let (pl1, pl2) = prefix itemname in (PL pl1, PL pl2)

someFunc :: IO ()
someFunc = do
  let pcc = asPetri (normalize charCreator)
  Petri.run pcc (Map.fromList [(head $ places pcc, 1)])

pccPetriOP :: PetriOptionalParams
pccPetriOP = petriOP_{
  markings = Map.fromList [(PL "Begin Character Creation", 3)],
  transitionHighlights = [Fork "Character Creation FORK"]
  }

previewPCC :: IO ()
previewPCC = previewPetri pccPetriOP $
  asPetri (normalize charCreator)

writePCC :: IO ()
writePCC = writePetri "viz/pcc" pccPetriOP $
  asPetri $
  -- normalize $
  charCreator
