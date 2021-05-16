{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE ScopedTypeVariables #-}
module GraphViz where

import Control.Concurrent (forkIO)
import Control.Monad (void)
import Data.Tuple (swap)

import Data.Graph.Inductive.PatriciaTree (Gr)
import Data.Graph.Inductive (mkGraph, Graph, Node)

import Data.GraphViz.Attributes (Labellable (..), toLabel)
import Data.GraphViz (preview, GraphvizParams (fmtNode, fmtEdge, globalAttributes), graphToDot, nonClusteredParams, setDirectedness, DotGraph, printDotGraph)
import Data.GraphViz.Commands (runGraphvizCanvas', GraphvizCanvas (Xlib))
import Data.GraphViz.Types (GlobalAttributes(GraphAttrs, attrs))
import Data.GraphViz.Attributes.Complete (Attribute(RankDir), RankDir (FromLeft))

import Data.Map.Strict ( (!), fromList, Map )

import Utils ( (<&>) )
import Petri (PetriNet (..), PLabel, TLabel)

petriGraphViz :: (Graph gr, Ord el, Labellable nl, Labellable el) => gr nl el -> DotGraph Node
petriGraphViz = setDirectedness graphToDot $
  nonClusteredParams
    { fmtNode = \ (_,l) -> [toLabel l]
    , fmtEdge = \ (_, _, l) -> [toLabel l]
    -- , globalAttributes = [GraphAttrs { attrs = [RankDir FromLeft] }]
    --- ^ I added this line to customise the graph's orientation
    }


petriFgl :: Graph gr => PetriNet PLabel TLabel -> gr (Either PLabel TLabel) Int
petriFgl MkPN { places, transitions, ptEdges, tpEdges} =
  mkGraph fglNodes fglEdges
  where
    fglNodes :: [(Int, Either PLabel TLabel)] =
      zip [1 :: Int ..]
        ((places <&> Left) ++ (transitions <&> Right))
    fglNodesDict :: Map (Either PLabel TLabel) Int =
      fromList (fglNodes <&> swap)
    fglEdges :: [(Int, Int, Int)] =
      (ptEdges <&> (\(Left -> p, Right -> t, n) ->
        (fglNodesDict ! p, fglNodesDict ! t, n)))
      ++
      (tpEdges <&> (\(Right -> t, Left -> p, n) ->
        (fglNodesDict ! t, fglNodesDict ! p, n)))
      