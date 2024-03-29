module Graphviz (
  preview,
  preview'custom,
  graphvizMain,
  defaultVis,
  checkDirectednessVis'custom,
  printDotGraph
) where

import Control.Concurrent (forkIO)
import Control.Monad (void)

import Data.Graph.Inductive.PatriciaTree (Gr)
import Data.Graph.Inductive (mkGraph, Graph, Node)
import Data.GraphViz.Attributes (Labellable (..), toLabel)
import Data.GraphViz (preview, GraphvizParams (fmtNode, fmtEdge, globalAttributes), graphToDot, nonClusteredParams, setDirectedness, DotGraph, printDotGraph)
import Data.GraphViz.Commands (runGraphvizCanvas', GraphvizCanvas (Xlib))
import Data.GraphViz.Types (GlobalAttributes(GraphAttrs, attrs))
import Data.GraphViz.Attributes.Complete (Attribute(RankDir), RankDir (FromLeft))

import Fgl ( myGraph )

-- | copy-paste and modified from https://hackage.haskell.org/package/graphviz-2999.20.1.0/docs/Data-GraphViz.html
defaultVis :: (Graph gr, Labellable nl, Labellable el) => gr nl el -> DotGraph Node
defaultVis = graphToDot $
  nonClusteredParams
    { fmtNode = \ (_,l) -> [toLabel l]
    , fmtEdge = \ (_, _, l) -> [toLabel l]
    }


-- | Cf. checkDirectednessVis :: (Graph gr, Ord el) => gr nl el -> DotGraph Node
--     at https://hackage.haskell.org/package/graphviz-2999.20.1.0/docs/Data-GraphViz.html
checkDirectednessVis'custom :: (Graph gr, Ord el, Labellable nl, Labellable el) => gr nl el -> DotGraph Node
checkDirectednessVis'custom = setDirectedness graphToDot $
  nonClusteredParams
    { fmtNode = \ (_,l) -> [toLabel l]
    , fmtEdge = \ (_, _, l) -> [toLabel l]
    , globalAttributes = [GraphAttrs { attrs = [RankDir FromLeft] }]
    --- ^ I added this line to customise the graph's orientation
    }


-- | custom GraphViz preview function
--     copy-paste then edit of https://hackage.haskell.org/package/graphviz-2999.20.1.0/docs/src/Data.GraphViz.html#preview
preview'custom   :: (Ord el, Graph gr, Labellable nl, Labellable el) => gr nl el -> IO ()
preview'custom g = void $ forkIO (void $ runGraphvizCanvas' dotgraph Xlib)
  where
    dotgraph :: DotGraph Node
    dotgraph = checkDirectednessVis'custom g


graphvizMain :: IO ()
graphvizMain = do
  putStrLn "__graphvizMain__"
  preview myGraph >> putStrLn "< visualise a graph using the Xlib GraphvizCanvas >"