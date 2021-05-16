{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE ScopedTypeVariables #-}
module GraphViz where

import Control.Concurrent (forkIO)
import Control.Monad (void)
import Data.Tuple (swap)
import qualified Data.Text.Lazy.IO as Text.Lazy.IO

import Data.Graph.Inductive.PatriciaTree (Gr)
import Data.Graph.Inductive (mkGraph, Graph, Node)

import Data.GraphViz.Attributes (Labellable (..), toLabel)
import Data.GraphViz (preview, GraphvizParams (fmtNode, fmtEdge, globalAttributes), graphToDot, nonClusteredParams, setDirectedness, DotGraph, printDotGraph, Shape (BoxShape, Circle), shape)
import Data.GraphViz.Commands (runGraphvizCanvas', GraphvizCanvas (Xlib))
import Data.GraphViz.Types (GlobalAttributes(GraphAttrs, attrs))
import Data.GraphViz.Attributes.Complete (Attribute(RankDir), RankDir (FromLeft))

import Data.Map.Strict ( (!), fromList, Map )

import Utils ( (<&>), (&), execShell )
import Petri (PetriNet (..), PLabel, TLabel)

-- for GraphViz
-- https://hackage.haskell.org/package/graphviz-2999.20.1.0/docs/Data-GraphViz-Attributes.html#t:Labellable
instance Labellable PLabel where toLabelValue = toLabelValue . show
instance Labellable TLabel where toLabelValue = toLabelValue . show

-- petriGraphViz :: (Graph gr, Ord el, Labellable nl, Labellable el) => gr nl el -> DotGraph Node
petriGraphViz :: Graph gr => gr (Either PLabel TLabel) Int -> DotGraph Node
petriGraphViz = setDirectedness graphToDot $
  nonClusteredParams
    { fmtNode = \ (_,l) -> case l of
        Left p -> [toLabel p, shape Circle]
        Right t -> [toLabel t, shape BoxShape]
    , fmtEdge = \ (_, _, l) -> [toLabel l]
    -- , globalAttributes = [GraphAttrs { attrs = [RankDir FromLeft] }]
    --- ^ I added this line to customise the graph's orientation
    }

petriFgl :: Graph gr => PetriNet PLabel TLabel -> gr (Either PLabel TLabel) Int
petriFgl MkPN { places, transitions, ptEdges, tpEdges} =
  mkGraph fglNodes fglEdges
  where
    fglNodes :: [(Int, Either PLabel TLabel)] =
      zip [1 :: Int ..] ((places <&> Left) ++ (transitions <&> Right))
    fglNodesDict :: Map (Either PLabel TLabel) Int =
      fromList (fglNodes <&> swap)
    fglEdges :: [(Int, Int, Int)] =
      (ptEdges <&> (\(Left -> p, Right -> t, n)
        -> (fglNodesDict ! p, fglNodesDict ! t, n)))
      ++
      (tpEdges <&> (\(Right -> t, Left -> p, n)
        -> (fglNodesDict ! t, fglNodesDict ! p, n)))
      
previewPetri :: PetriNet PLabel TLabel -> IO ()
previewPetri (petriFgl @Gr -> petriGraphViz -> dotGraph) =
  void $ forkIO (void $ runGraphvizCanvas' dotGraph Xlib)

-- | graph to .dot and .png
writePetri :: PetriNet PLabel TLabel -> String -> IO ()
writePetri (petriFgl @Gr -> petriGraphViz -> dotGraph) filePath = do
  printDotGraph dotGraph & Text.Lazy.IO.writeFile filePath
  -- dot to png
  execShell "dot ../viz/rule34_graph1.dot -Tpng > ../viz/rule34_graph1.png"
