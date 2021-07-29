{-# LANGUAGE PackageImports #-}

module Lib
    ( writePCC,
      asPetri,
      safePost,
      ccSimple
    ) where

import Types
import qualified Sketches.CCSimple
import qualified Sketches.CCMedium
import qualified Sketches.CharCreator
import qualified Sketches.SafePost

import qualified Data.Map as Map
import Data.Tree
import Data.List
import Data.List.Split
import Control.Monad

import Data.Graph.Inductive
import Data.GraphViz (preview, GraphvizParams (fmtNode, fmtEdge, globalAttributes), graphToDot, nonClusteredParams, setDirectedness, DotGraph, printDotGraph)

import Petri

-- from rule34-haskell package
import GraphViz

-- Now we have a grammar for specifying the character creator HSM!
ccSimple = Sketches.CCSimple.sketch
safePost = Sketches.SafePost.sketch

  
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

-- see Note in README.org [asPetri]
asPetri :: StateTree -> PetriNet PLabel TLabel
asPetri (Node (statename :-> nexts) children) =
  let -- first we deal with the children -- any boxes inside this state.
      (front, back, gathered) = plprefix statename
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

      nextPetris    = mconcat $ asPetri <$> (leaf . snd <$> nexts)
      -- If any of the out edges are labeled, we're in a choice situation. To achieve closure for this node and its descendants, we need to OR-join its labeled children.
      -- To achieve an OR-join, for each labeled out-edge, identify the outless nodes of that out-edge's subgraph, and create an individual exit transition leading to an OR gate place.
      gatherNextOr  = mconcat
        [ MkPN    [gathered]    [proceed, gatherNext]
                                                [(back, proceed, 1)
                                                ,(oless, gatherNext, 1)]   [(proceed,next1,1)
                                                                           ,(gatherNext,gathered,1)]
        | (Just edgeLabel, nextstate) <- nexts
        , let nextstatename = stateName nextstate
              (next1,next2,next3) = plprefix nextstatename
              orOutless  = outless $ asPetri (leaf nextstate)
              proceed    = mkCase statename edgeLabel
              gatherNext = Join $ nextstatename ++ " BACK TO " ++ statename
        , oless@(PL ol) <- orOutless
        ]
      -- unlabeled children proceed as per usual; their outless children are eventually gathered to the top-level
      gatherNextAnd = mconcat
        [ MkPN    []    [proceed]    [(back, proceed, 1)]   [(proceed,next1,1)]
        | (Nothing, nextstate) <- nexts
        , let nextstatename = stateName nextstate
              (next1,next2,next3) = plprefix nextstatename
              proceed = Noop $ "proceeding directly from " ++ statename ++ " to " ++ nextstatename
        ]
  in
   nubPN $ withChildren <> gatherNextOr <> gatherNextAnd <> nextPetris
  where
    outless :: PetriNet PLabel TLabel -> [PLabel]
    outless pn = let outful = [ place | place <- places pn
                                      , (place,_,_) <- ptEdges pn ]
                 in places pn \\ outful
    mkCase :: StringText -> StringText -> TLabel
    mkCase previousPlace edgeLabel
      = Case previousPlace (Just edgeLabel)

prefix :: String -> (String, String, String)
prefix statename = case take 6 statename of
                    "Choose" -> ("Awaiting " <> statename, "Decided " <> statename, "Gathered " <> statename)
                    _        -> ("Begin "    <> statename, "End "     <> statename, "Gathered " <> statename)

plprefix statename = let (pl1, pl2, pl3) = prefix statename in (PL pl1, PL pl2, PL pl3)

pccPetriOP :: PetriOptionalParams
pccPetriOP = petriOP_{
  markings = Map.fromList [(PL "Begin Character Creation", 3)],
  transitionHighlights = [Fork "Character Creation FORK"]
  }

previewPCC :: IO ()
previewPCC = previewPetri pccPetriOP $
  asPetri (normalize Sketches.CharCreator.sketch)

-- writePCC :: String -> String -> IO ()
-- writePCC outfile sketch = writePetri outfile pccPetriOP $
--   asPetri $
--   -- normalize $
--   case sketch of
--     "charCreator" -> charCreator
--     "ccSimple"    -> ccSimple
--     "safePost"    -> safePost
--     _ -> error "choose one of: charCreator, ccSimple, safePost"

writePCC :: String -> String -> String -> IO()
writePCC outfile sketch eventFile = do
  let
    pn = asPetri $ case sketch of
      "charCreator" -> Sketches.CharCreator.sketch
      "ccSimple" -> Sketches.CCSimple.sketch
      "ccMedium" -> Sketches.CCMedium.sketch
      "safePost" -> Sketches.SafePost.sketch
      _ -> error "choose one of: charCreator, ccSimple, safePost"
  events <- (read <$> readFile eventFile) :: IO [Event]
  Petri.run pn
    (\(count,(eventName, eventValue),acc) -> do
        let opts = petriOP_{
              markings = mp acc,
              transitionHighlights = [eventName]
              }
            outfilebase = outfile ++ "-" ++ show count
        putStrLn $ "[[" ++ "../" ++ outfilebase ++ ".png" ++ "]]"
        putStrLn "#+BEGIN_EXAMPLE"
        writePetri outfilebase opts pn
        putStrLn "#+END_EXAMPLE"
    )
    events
