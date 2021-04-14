module Graphviz where

import Data.Text (Text, pack)
import Generic.Data ( Generic, gconIndex, genumFrom, gtoEnum )

import Data.Graph.Inductive.PatriciaTree (Gr)
import Data.Graph.Inductive (mkGraph)
import Data.GraphViz.Attributes (Labellable (..))
import Data.GraphViz (preview)

import Gates
import Fgl

-- | unused
instance Labellable GateInfo where
  toLabelValue = toLabelValue . show


graphvizMain :: IO ()
graphvizMain = do
  putStrLn "__graphvizMain__"
  preview graph >> putStrLn "< visualise a graph using the Xlib GraphvizCanvas >"