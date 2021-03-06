{-# LANGUAGE PackageImports #-}

module Lib
    ( writePCC
    ) where

import qualified Data.Map as Map
import Data.Tree
import Data.List
import Data.List.Split

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
ccSimple :: StateTree
ccSimple = 
  state "Character Creation" `contains`
  [
    leaf $ state "Choose Ability Scores"
  , leaf $ state "Choose Potato Scores"
  ]

charCreator :: StateTree
charCreator =
  state "Character Creation" `contains`
  [
    "Pre-Equipment" :-> [(Nothing, state "Choose Equipment")]
    `contains`
    [ leaf $ state "Choose Class"
    , leaf $ state "Choose Background"
    ]
  ,
    state "Choose Description" `contains`
    [ leaf $ state "Choose Age"
    , leaf $ "Choose Height" :-> [(Nothing, state "Choose Width")]
    --- ^ add "Choose Width" (not in original spec) to demonstrate need for recursion in the @grow@ function
    , leaf $ state "Choose Appearance"
    , leaf $ state "Choose Alignment"
    ]
  ,
    leaf $ state "Choose Ability Scores"
    , leaf $ state "Choose Potato Scores"
  ,
    leaf $ "Choose Race" :-> [(Just "Dwarf", state "Choose Dwarf Sub-Race")
                             ,(Just "Elf",   state "Choose Elf Sub-Race")]
  ]

safePost :: StateTree
safePost =
  leaf $ "Safe Contract" :-> [(Just "Equity Financing", state "Conversion")
                             ,(Just "Liquidity Event", "Greater of" :-> [(Just "Cash-Out Amount",   state "Residual Pro-Rata")
                                                                        ,(Just "Conversion Amount", state "Conversion Pro-Rata")])
                             ,(Just "Dissolution", state "Residual Pro-Rata")
                              -- Liquidiation Priority is not a state transition, it is a decorator to the Liquidity and Dissolution Events.
                             -- Termination is not actually a state transition, it just indicates exclusivity between the other state transitions, which is implicit here
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

mymain = play0 (MyPetri (asPetri charCreator) (Map.fromList [(PL "Begin Character Creation",1)]), ["init"])

myenabled (MyPetri pn mm) = enabled pn mm

-- see Note in README.org [asPetri]
asPetri :: StateTree -> PetriNet PLabel TLabel
asPetri (Node (statename :-> nexts) children) =
  let -- first we deal with the children -- any boxes inside this state.
      (front, back) = plprefix statename
      middle        = TL statename
      (pre, post)   = if length children == 1
                      then (Noop $ statename ++ " PUSH", Noop $ statename ++ " POP")
                      else (Fork $ statename ++ " FORK", Join $ statename ++ " JOIN")
      childPetris   = asPetri <$> children
      scatter       = [ (pre,startState,1)
                      | childPetri <- childPetris
                      , let startState = head $ places childPetri ]
      gather        = [ (endState,post,1)
                      | endState <- outless $ mconcat childPetris ]
      withChildren  = case length children of
        --   places                transitions  p->t edges             t->p edges
        0 -> MkPN [front, back]    [middle]     [(front, middle, 1)]   [(middle,back,1)]
        _ -> MkPN [front]          [pre]        [(front, pre, 1)]      scatter
             <> mconcat childPetris <>
             MkPN [back]           [post]       gather                 [(post, back, 1)]

      nextPetris    = asPetri <$> (leaf . snd <$> nexts)
      nextStates    = mconcat
        [ MkPN    []    [proceed]    [(back, proceed, 1)]   [(proceed,next1,1)]
        | (edgeLabel, nextstate) <- nexts
        , let nextstatename = stateName nextstate
              (next1,next2) = plprefix nextstatename
              proceed = maybe (Noop $ "proceeding directly from " ++ statename ++ " to " ++ nextstatename)
                              (mkCase statename) edgeLabel
        ]
   in
   nubPN $ withChildren <> nextStates <> mconcat nextPetris
  where
    outless :: PetriNet PLabel TLabel -> [PLabel]
    outless pn = let outful = [ place | place <- places pn
                                      , (place,_,_) <- ptEdges pn ]
                 in places pn \\ outful
    mkCase :: StringText -> StringText -> TLabel
    mkCase previousPlace edgeLabel
      | '=' `elem` edgeLabel = let els = wordsBy (=='=') edgeLabel in Case (els !! 0) (els !! 1)
      | otherwise            = Case previousPlace edgeLabel

prefix :: String -> (String, String)
prefix statename = case take 6 statename of
                    "Choose" -> ("Awaiting " <> statename, "Decided " <> statename)
                    _        -> ("Begin "    <> statename, "End "     <> statename)

plprefix statename = let (pl1, pl2) = prefix statename in (PL pl1, PL pl2)

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

writePCC :: String -> String -> IO ()
writePCC outfile sketch = writePetri outfile pccPetriOP $
  asPetri $
  -- normalize $
  case sketch of
    "charCreator" -> charCreator
    "ccSimple"    -> ccSimple
    "safePost"    -> safePost
    _ -> error "choose one of: charCreator, ccSimple, safePost"
