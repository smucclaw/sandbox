{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE OverloadedStrings #-}
module Fgl where

import Data.Text (Text)
import qualified Data.Text as T (pack)
import Generic.Data ( genumFrom, gtoEnum, gconIndex )

import Data.Graph.Inductive.PatriciaTree (Gr)
import Data.Graph.Inductive (mkGraph)

import Utils

import Gates

-- | https://hackage.haskell.org/package/fgl-5.7.0.3/docs/Data-Graph-Inductive-Graph.html#t:LNode
-- Labeled node with index=Int, label=Text
nodes :: [(Int, Text)]
-- nodes = ((,) <$> gconIndex  <*> makeNodeLabel) <$> nodeList
nodes = nodeList <&> do -- Reader applicative
  index <- gconIndex -- generically get the index of the constructor
  label <- makeNodeLabel
  return (index, label)
  where
    makeNodeLabel :: NodeRef -> Text
    makeNodeLabel node = gateInfo node & do -- Reader applicative
      typ <- gType
      descr <- gDescr
      return $ (T.pack . show) typ <> ": " <> descr

edges :: [(Int, Int, Text)]
-- edges = edges0 <&> (\(g1, g2) -> (gconIndex @NodeRef g1, gconIndex @NodeRef g2, "" :: Text))
edges = edges0 <&> do -- Reader applicative
  node1 <- fst
  node2 <- snd
  return (gconIndex node1, gconIndex node2, "")

graph :: Gr Text Text
graph = mkGraph @Gr nodes edges


fglMain :: IO ()
fglMain = do
  putStrLn "__fglMain__"
  print $ gconIndex Bulb'May
  print $ gconIndex Or'May
  print $ genumFrom Bulb'MustNot
  print $ genumFrom (gtoEnum @NodeRef 0)