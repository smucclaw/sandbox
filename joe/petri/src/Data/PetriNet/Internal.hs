{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE ImportQualifiedPost #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving #-}

module Data.PetriNet.Internal where

import Control.Applicative qualified as App
import Control.Monad (join)
import Data.Bifunctor (bimap)
import GHC.Generics (Generic)
import Data.Maybe (mapMaybe)

import Data.Graph.Inductive.Graph qualified as Fgl
import Data.Graph.Inductive.PatriciaTree (Gr)

import Data.Hashable (Hashable)
import Data.HashMap.Strict qualified as HashMap

import Data.Tuple.All (sequenceT)

import Flow ((.>), (|>))

import Data.PetriNet qualified as PTNet
-- import Data.PetriNet (LabelledNode)

-- Concretely, Petri nets are implemented using hashmaps and an fgl graph.
-- places/transitions are hash maps mapping node names to a record containing
-- the label and the corresponding node in the fgl graph.
-- graph is an fgl graph with the nodes being labelled with their name.
data PetriNet nodeName nodeLabel arcLabel = PetriNet
  { places :: NodeMap nodeName nodeLabel,
    transitions :: NodeMap nodeName nodeLabel,
    graph :: Gr (FglNodeLabel nodeName) arcLabel
  }

deriving instance
  (Eq a, Eq b, Eq c, Ord c) => Eq (PetriNet a b c)
deriving instance
  (Show a, Show b, Show c) => Show (PetriNet a b c)

type NodeMap nodeName nodeLabel = 
  HashMap.HashMap nodeName (NodeMapVal nodeLabel)

data NodeMapVal nodeLabel = NodeMapVal
  { nodeLabel :: nodeLabel,
    fglNode :: Fgl.Node
  }
  deriving (Eq, Generic, Ord, Read, Show)

instance Hashable b => Hashable (NodeMapVal b)

data FglNodeLabel nodeName = FglPlaceLabel nodeName  | FglTransLabel nodeName
  deriving (Eq, Generic, Ord, Read, Show)

instance Hashable a => Hashable (FglNodeLabel a)

-- Utility functions
lookupFglNodeLabel ::
  (Eq a, Hashable a) =>
  PetriNet a b c ->
  FglNodeLabel a ->
  Maybe (NodeMapVal b)
lookupFglNodeLabel PetriNet { places } (FglPlaceLabel nodeName) =
  HashMap.lookup nodeName places
lookupFglNodeLabel PetriNet { transitions } (FglTransLabel nodeName) =
  HashMap.lookup nodeName transitions

node2fglNodeLabel :: PTNet.Node nodeType a -> FglNodeLabel a
node2fglNodeLabel (PTNet.Place nodeName) = FglPlaceLabel nodeName
node2fglNodeLabel (PTNet.Trans nodeName) = FglTransLabel nodeName

fglNodeLabel2place :: App.Alternative m => FglNodeLabel a -> m (PTNet.Node PTNet.PlaceType a)
fglNodeLabel2place (FglPlaceLabel nodeName) = PTNet.Place nodeName |> pure
fglNodeLabel2place _ = App.empty

fglNodeLabel2transition :: App.Alternative m => FglNodeLabel a -> m (PTNet.Node PTNet.TransType a)
fglNodeLabel2transition (FglTransLabel nodeName) = PTNet.Trans nodeName |> pure
fglNodeLabel2transition _ = App.empty

data InOrOut = In | Out
  deriving (Eq, Generic, Ord, Read, Show)

-- Helper function to grab the incoming and outgoing ars for a node in a
-- Petri net.
inOutArcs ::
  (Eq a1, Hashable a1) =>
  (FglNodeLabel a1 -> Maybe (PTNet.Node srcType a2)) ->
  InOrOut ->
  PTNet.Node nodeType a1 ->
  PetriNet a1 b c ->
  Maybe [PTNet.InOutArc srcType a2 b c]
inOutArcs fglNodeLabel2node inOrOut node petriNet@PetriNet {..} =
  node |> node2maybeContext |> fmap context2fglArcs |> fmap fglArcs2labelledArcs
  where
    node2maybeContext node =
      -- First convert the node to an FGL node label and use that
      -- to lookup the fglNode in the graph.
      node |> node2fglNodeLabel |> lookupFglNodeLabel petriNet |> fmap fglNode
      -- Once we have the fglNode, we use it to decompose the graph and
      -- grab the context, which is wrapped in a Maybe.
      -- This is to account for the fact that the fglNode may not actually exist
      -- in the graph.
      |> fmap (`Fgl.match` graph) |> fmap fst |> join

    -- Given a context, grab the arcs that are incoming or outgoing to node.
    -- These arcs are in FGL format, with type
    -- [Adj c] = [(Node, c)] = [(Int, c)]
    context2fglArcs (inArcs, _, _, outArcs) =
      case inOrOut of In -> inArcs ; Out -> outArcs

    -- The final step is to convert the arcs from fgl format into our desired
    -- format, which has type [InOutArc (FlipNodeType nodeType) a c]
    fglArcs2labelledArcs arcs =
      flip mapMaybe arcs $ \(inOutArcLabel, otherNode) -> do
        let (maybeContext, _) = otherNode `Fgl.match` graph
        (_, _, fglNodeLabel, _) <- maybeContext
        NodeMapVal { nodeLabel } <- lookupFglNodeLabel petriNet fglNodeLabel
        otherNode <- fglNodeLabel2node fglNodeLabel
        let otherNode' = PTNet.LabelledNode { node = otherNode, nodeLabel }
        pure (PTNet.InOutArc { PTNet.otherNode = otherNode' , inOutArcLabel })

instance (Eq a, Hashable a) => PTNet.PetriNet PetriNet a b c where
  empty =
    PetriNet
    { places = HashMap.empty, transitions = HashMap.empty, graph = Fgl.empty }

  nodes petriNet@PetriNet { .. } =
    (places, transitions)
    -- Grab all the node names.
    |> join bimap HashMap.keys
    -- Look up their labels in their respective node maps and turn them into nodes.
    |> bimap (nodeNames2labelledNode PTNet.Place)
             (nodeNames2labelledNode PTNet.Trans)
    where
      -- GHC's type inference breaks down if we don't annotate these 2 functions.
      -- Also, these need ScopedTypeVariables to be annotated correctly, as they
      -- refer to the a and b bound in the outer scope.
      nodeNames2labelledNode :: (a -> PTNet.Node nodeType a) -> [a] -> [PTNet.LabelledNode nodeType a b]
      nodeNames2labelledNode placeOrTransition nodeNames =
        mapMaybe (nodeName2labelledNode placeOrTransition) nodeNames

      nodeName2labelledNode :: (a -> PTNet.Node nodeType a) -> a -> Maybe (PTNet.LabelledNode nodeType a b)
      nodeName2labelledNode placeOrTransition nodeName = do
        let node' = placeOrTransition nodeName
        nodeLabel <- PTNet.lookupLabel petriNet node'
        pure PTNet.LabelledNode { node = node', nodeLabel }

  numNodes PetriNet { graph } = Fgl.noNodes graph

  lookupLabel petriNet node = 
    node |> node2fglNodeLabel |> lookupFglNodeLabel petriNet |> fmap nodeLabel

  inArcs place@(PTNet.Place _) = inOutArcs fglNodeLabel2transition In place
  inArcs transition@(PTNet.Trans _) = inOutArcs fglNodeLabel2place In transition

  outArcs place@(PTNet.Place _) = inOutArcs fglNodeLabel2transition Out place
  outArcs transition@(PTNet.Trans _) = inOutArcs fglNodeLabel2place Out transition

  addNode PTNet.LabelledNode { .. } petriNet@PetriNet { .. } =
    PetriNet { graph = graph', places = places', transitions = transitions' }
    where
      fglNodeLabel = node2fglNodeLabel node

      fglNode
        | Just NodeMapVal { .. } <- lookupFglNodeLabel petriNet fglNodeLabel = fglNode
        | otherwise = graph |> Fgl.newNodes 1 |> head

      insertLabelledNode nodeName nodeMap =
        HashMap.insert nodeName NodeMapVal { .. } nodeMap

      (places', transitions') = case fglNodeLabel of
        FglPlaceLabel nodeName  ->
          (insertLabelledNode nodeName places, transitions)
        FglTransLabel nodeName ->
          (places, insertLabelledNode nodeName transitions)

      graph' = Fgl.insNode (fglNode, fglNodeLabel) graph 

  -- delNode node petriNet@PetriNetI { .. } =
  --   if not (eitherNode `Bimap.member` nodeMap)
  --   o
  --     then petriNet
  --     else PetriNetI { graph = graph', nodeMap = nodeMap' }
  --     where
  --       eitherNode = node2eitherNode node

  -- delNode node PetriNetI { .. } =
  --   PetriNetI { graph = graph', nodeMap = nodeMap }
  --   where
  --     graph' = delMapNode nodeMap node' graph
  --     node' = node2eitherNode node

  addArc PTNet.LabelledArc { arc = PTNet.Arc { .. }, .. } petriNet@PetriNet { .. } =
      (node2fglNode arcSrc, node2fglNode arcDest)
      |> sequenceT |> fmap labelEdge |> maybe petriNet updatePetriNet
      where
        node2fglNode :: PTNet.Node nodeType a -> Maybe Fgl.Node
        node2fglNode node =
          node |> node2fglNodeLabel |> lookupFglNodeLabel petriNet |> fmap fglNode

        labelEdge (src, dest) = (src, dest, arcLabel)

        updatePetriNet labelledEdge =
          petriNet { graph = Fgl.insEdge labelledEdge graph }
 
testPetriNet :: PetriNet String Double Int
testPetriNet =
  PTNet.empty
  |> PTNet.addNode (PTNet.LabelledNode (PTNet.Place "P1") 0.1)
  |> PTNet.addNode (PTNet.LabelledNode (PTNet.Trans "T1") 0.2)
  |> PTNet.addNode (PTNet.LabelledNode (PTNet.Trans "T2") 0.3)
  |> PTNet.addArc (PTNet.LabelledArc (PTNet.Arc (PTNet.Place "P1") (PTNet.Trans "T1")) 1)
  |> PTNet.addArc (PTNet.LabelledArc (PTNet.Arc (PTNet.Trans "T2") (PTNet.Place "P1")) 3)
  |> PTNet.addArcs []
  -- |> PTNet.addArc (PTNet.LabelledArc (PTNet.Arc (PTNet.Place "P1") (PTNet.Place "P1")) 1)
  -- |> PTNet.addArc (PTNet.LabelledArc (PTNet.Arc (PTNet.Trans "T1") (PTNet.Trans "T2")) 1)

-- testArcs :: Maybe [(Node TransitionType String String, Int)]
testArcs = PTNet.arcs (PTNet.Place "P1") testPetriNet