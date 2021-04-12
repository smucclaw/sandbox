{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ApplicativeDo #-}
module Gates where

import Data.Text (Text, pack)
import Data.Function ((&))
import Data.Functor ((<&>))
import Generic.Data ( Generic, gconIndex, genumFrom, gtoEnum )

import Data.Graph.Inductive.PatriciaTree (Gr)
import Data.Graph.Inductive (mkGraph)
import Data.GraphViz.Attributes (Labellable (..))
import Data.GraphViz (preview)

-- *** Readme *** --
-- Use graphviz library for visualisation.
-- Graphviz uses fgl library.
-- Fgl library represents nodes using a unique index of type Int.
-- I use Generic.Data from generic-data library to
--    auto-generate unique indices. (using the function: gconIndex)

data GateType = NOT | AND | OR | NOR | Bulb | Switch deriving Show

data GateInfo = GInfo { gType :: GateType, gDescr :: Text } deriving Show

-- | Use a typeclass to specify info about each specific gate (node).
class Gate a where
  gateInfo :: a -> GateInfo
instance Gate GateRef where
  gateInfo = \case
    Bulb'MustNot -> GInfo Bulb "Must Not"
    Bulb'May -> GInfo Bulb "May"
    And'MustNot -> GInfo AND "Must Not"
    Or'May -> GInfo OR "May"
    N1 -> GInfo Switch "N1"
    N2 -> GInfo Switch "N2"
    M3 -> GInfo Switch "N3"
    M4 -> GInfo Switch "M4"
    M5 -> GInfo Switch "M5"

-- | Gates used in the model.
data GateRef = Bulb'MustNot | Bulb'May | And'MustNot | Or'May | N1 | N2 | M3 | M4 | M5
  deriving (Generic, Show)

-- | unused
instance Labellable GateInfo where
  toLabelValue = toLabelValue . show

-- | https://hackage.haskell.org/package/fgl-5.7.0.3/docs/Data-Graph-Inductive-Graph.html#t:LNode
-- Labeled node with index=Int, label=Text
nodes :: [(Int, Text)]
-- nodes = ((,) <$> gconIndex  <*> makeNodeLabel) <$> nodeList
nodes = nodeList <&> do -- Reader applicative
  index <- gconIndex -- generically get the index of the constructor
  label <- makeNodeLabel
  return (index, label)
  where
    nodeList :: [GateRef]
    nodeList = genumFrom (gtoEnum @GateRef 0)
    -- ^ Use generics to generate a list of all the nodes (gates),
    --   i.e. a list of all the constructors in the GateRef data type.
    makeNodeLabel :: GateRef -> Text
    makeNodeLabel node = gateInfo node & do -- Reader applicative
      typ <- gType
      descr <- gDescr
      return $ (pack . show) typ <> ": " <> descr

edges0 :: [(GateRef, GateRef)]
edges0 = [
  (And'MustNot, Bulb'MustNot),
  (N1, And'MustNot),
  (N2, And'MustNot),

  (Or'May, Bulb'May),
  (M3, Or'May),
  (M4, Or'May),
  (M5, Or'May)
  ]

edges :: [(Int, Int, Text)]
-- edges = edges0 <&> (\(g1, g2) -> (gconIndex @GateRef g1, gconIndex @GateRef g2, "" :: Text))
edges = edges0 <&> do -- Reader applicative
  node1 <- fst
  node2 <- snd
  return (gconIndex node1, gconIndex node2, "")

graph :: Gr Text Text
graph = mkGraph @Gr nodes edges

main :: IO ()
main = do
  print $ gconIndex Bulb'May
  print $ gconIndex Or'May
  print $ genumFrom Bulb'MustNot
  print $ genumFrom (gtoEnum @GateRef 0)
  preview graph >> putStrLn "< visualise a graph using the Xlib GraphvizCanvas >"