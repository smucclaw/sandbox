module Graphviz (
  preview,
  preview'custom,
  graphvizMain
) where

import Data.Text (Text, pack)
import Control.Concurrent (forkIO)

import Data.Graph.Inductive.PatriciaTree (Gr)
import Data.Graph.Inductive (mkGraph, Graph)
import Data.GraphViz.Attributes (Labellable (..), toLabel)
import Data.GraphViz (preview, GraphvizParams (fmtNode, fmtEdge, globalAttributes), graphToDot, nonClusteredParams, setDirectedness)
import Data.GraphViz.Commands (runGraphvizCanvas', GraphvizCanvas (Xlib))
import Data.GraphViz.Types (GlobalAttributes(GraphAttrs, attrs))
import Data.GraphViz.Attributes.Complete (Attribute(RankDir), RankDir (FromLeft))

import Encoding ( NodeInfo )
import Fgl ( myGraph )

-- | unused
instance Labellable NodeInfo where
  toLabelValue = toLabelValue . show

-- | custom GraphViz preview function
--     copy-paste then edit of https://hackage.haskell.org/package/graphviz-2999.20.1.0/docs/src/Data.GraphViz.html#preview
--   tons of GraphViz imports for this lol
preview'custom   :: (Ord el, Graph gr, Labellable nl, Labellable el) => gr nl el -> IO ()
preview'custom g = ign $ forkIO (ign $ runGraphvizCanvas' dg Xlib)
  where
    dg = setDirectedness graphToDot params g
    params = nonClusteredParams { fmtNode = \ (_,l) -> [toLabel l]
                                , fmtEdge = \ (_, _, l) -> [toLabel l]
                                , globalAttributes = [GraphAttrs { attrs = [RankDir FromLeft] }]
                                --- ^ I added this line to customise the graph's orientation
                                }
    ign = (>> return ())

graphvizMain :: IO ()
graphvizMain = do
  putStrLn "__graphvizMain__"
  preview myGraph >> putStrLn "< visualise a graph using the Xlib GraphvizCanvas >"