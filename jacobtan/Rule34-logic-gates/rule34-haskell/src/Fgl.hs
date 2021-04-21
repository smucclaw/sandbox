{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
module Fgl where

import Data.Text (Text)
import qualified Data.Text as T (pack)
import Generic.Data ( gconIndex, gtoEnum ) 

import Data.Graph.Inductive.PatriciaTree (Gr)
import Data.Graph.Inductive.Graph
    ( Graph(mkGraph), Node, pre, suc )

import Utils ( (&), (<&>) )

import Encoding
    ( NodeInfo(gType, gDescr),
      NodeRef(Bulb'May, Or'May),
      nodeList,
      nodeInfo,
      edges0 )

-- *** Readme *** --
-- Fgl library represents nodes using a unique index of type Int.
-- I use Generic.Data from generic-data library to
--    auto-generate unique indices. (using the function: gconIndex)
--    https://hackage.haskell.org/package/generic-data-0.9.2.0/docs/Generic-Data.html

-- | https://hackage.haskell.org/package/fgl-5.7.0.3/docs/Data-Graph-Inductive-Graph.html#t:LNode
-- Labeled node with index=Int, label=Text
fglNodes :: [(Int, Text)]
-- nodes = ((,) <$> gconIndex  <*> makeNodeLabel) <$> nodeList
fglNodes = nodeList <&> do -- Reader applicative
  index <- gconIndex -- generically get the index of the constructor
  label <- makeNodeLabel
  return (index, label)

makeNodeLabel :: NodeRef -> Text
makeNodeLabel node = nodeInfo node & do -- Reader applicative
  typ <- gType
  descr <- gDescr
  return $ (T.pack . show) typ <> ": " <> descr

fglEdges :: [(Int, Int, Text)]
-- edges = edges0 <&> (\(g1, g2) -> (gconIndex @NodeRef g1, gconIndex @NodeRef g2, "" :: Text))
fglEdges = edges0 <&> do -- Reader applicative
  node1 <- fst
  node2 <- snd
  return (gconIndex node1, gconIndex node2, "")

myGraph :: Gr Text Text
myGraph = mkGraph @Gr fglNodes fglEdges


-- | typeclass to produce NodeRef from compatible input types
class HasNodeRef a b where
  toNodeRef :: a -> b
instance (HasNodeRef a b, Functor f, f ~ g) => HasNodeRef (f a) (g b) where
  toNodeRef = fmap toNodeRef
instance NodeRef ~ nr => HasNodeRef Node nr where
  toNodeRef = gtoEnum @NodeRef

-- | for convenient type application (see the @fgl@ function)
class X a
instance X a

-- | helper function to use fgl library's graph functions with my NodeRef type
fgl :: (X d, Graph gr, HasNodeRef c d) => (gr a b -> Node -> c) -> gr a b -> NodeRef -> d
fgl fglGraphFunc graph node = fglGraphFunc graph (gconIndex @NodeRef node) & toNodeRef


fglMain :: IO ()
fglMain = do
  putStrLn "__fglMain__"
  -- print $ (\fglGraphFunc graph node -> fglGraphFunc graph (gconIndex @NodeRef node))
  --   pre myGraph Bulb'May 
  print $ fgl @[NodeRef] pre myGraph Bulb'May 
  print $ fgl @[NodeRef] pre myGraph Or'May
  -- print $ gtoEnum @NodeRef 999
  --- ^ *** Exception: gtoEnum: out of bounds, index 999, cardinality 9