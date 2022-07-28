{-# LANGUAGE DataKinds #-}
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
import Data.PetriNet (LabelledNode)

-- Concretely, Petri nets are implemented using hashmaps and an fgl graph.
-- places/transitions are hash maps mapping node names to a record containing
-- the label and the corresponding node in the fgl graph.
-- graph is an fgl graph with the nodes being labelled with their name.
data PetriNet nodeName nodeLabel arcLabel = PetriNet
  { places :: NodeMap nodeName nodeLabel,
    transitions :: NodeMap nodeName nodeLabel,
    graph :: Gr (GraphNode nodeName) arcLabel
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

data GraphNode nodeName = GraphNode
  { nodeType :: PTNet.NodeType,
    nodeName :: nodeName
  }
  deriving (Eq, Generic, Ord, Read, Show)

instance Hashable a => Hashable (GraphNode a)

-- Utility functions
lookupGraphNode ::
  (Eq a, Hashable a) =>
  PetriNet a b c ->
  GraphNode a ->
  Maybe (NodeMapVal b)
lookupGraphNode PetriNet { places } GraphNode { nodeType = PTNet.PlaceType, nodeName } =
  HashMap.lookup nodeName places
lookupGraphNode PetriNet { transitions } GraphNode { nodeType = PTNet.TransitionType, nodeName } =
  HashMap.lookup nodeName transitions

node2graphNode :: PTNet.Node nodeType a -> GraphNode a
node2graphNode (PTNet.Place nodeName) =
  GraphNode { nodeType = PTNet.PlaceType, nodeName }
node2graphNode (PTNet.Transition nodeName) =
  GraphNode { nodeType = PTNet.TransitionType, nodeName }

graphNode2place :: App.Alternative m => GraphNode a -> m (PTNet.Node PTNet.PlaceType a)
graphNode2place GraphNode { nodeType = PTNet.PlaceType, nodeName } =
  nodeName |> PTNet.Place |> pure
graphNode2place _ = App.empty

graphNode2transition :: App.Alternative m => GraphNode a -> m (PTNet.Node PTNet.TransitionType a)
graphNode2transition GraphNode { nodeType = PTNet.TransitionType, nodeName } =
  nodeName |> PTNet.Transition |> pure
graphNode2transition _ = App.empty

data InOrOut = In | Out

-- Helper function to grab the incoming and outgoing ars for a node in a
-- Petri net.
inOutArcs ::
  (Eq a1, Hashable a1) =>
  (GraphNode a1 -> Maybe (PTNet.Node srcType a2)) ->
  InOrOut ->
  PTNet.Node nodeType a1 ->
  PetriNet a1 b c ->
  Maybe [PTNet.InOutArc srcType a2 b c]
inOutArcs graphNode2node inOrOut node petriNet@PetriNet {..} =
  node |> node2maybeContext |> fmap context2fglArcs |> fmap fglArcs2labelledArcs
  where
    node2maybeContext node =
      -- First convert the node to an internal graph node and use that
      -- to lookup the fglNode in the graph.
      node |> node2graphNode |> lookupGraphNode petriNet |> fmap fglNode
      -- Once we have the fglNode, we use it to decompose the graph and
      -- grab the context, which is wrapped in a Maybe.
      -- This is to account for the fact that the fglNode may not actually exist
      -- in the graph.
      |> fmap (`Fgl.match` graph) |> fmap fst |> join

    -- Given a context, grab the arcs that are incoming or outgoing to node.
    -- These arcs are in fgl format, with type
    -- [Adj c] = [(Node, c)] = [(Int, c)]
    context2fglArcs (inArcs, _, _, outArcs) =
      case inOrOut of In -> inArcs ; Out -> outArcs

    -- The final step is to convert the arcs from fgl format into our desired
    -- format, which has type [(Node (FlipNodeType nodeType) a, c)]
    fglArcs2labelledArcs arcs =
      flip mapMaybe arcs $ \(inOutArcLabel, otherNode) -> do
        let (maybeContext, _) = otherNode `Fgl.match` graph
        (_, _, graphNode, _) <- maybeContext
        NodeMapVal { nodeLabel } <- lookupGraphNode petriNet graphNode
        otherNode <- graphNode2node graphNode
        let otherNode' = PTNet.LabelledNode { node = otherNode, nodeLabel }
        pure (PTNet.LabelledArc { otherNode = otherNode' , inOutArcLabel })

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
             (nodeNames2labelledNode PTNet.Transition)
    where
      -- GHC's type inference breaks down if we don't annotate these 2 functions.
      -- Also, these need ScopedTypeVariables to be annotated correctly, as they
      -- refer to the a and b bound in the outer scope.
      nodeNames2labelledNode :: (t -> PTNet.Node nodeType1 a) -> [t] -> [LabelledNode nodeType1 a b]
      nodeNames2labelledNode placeOrTransition nodeNames =
        nodeNames |> mapMaybe (node2labelledNode placeOrTransition)

      node2labelledNode :: (t -> PTNet.Node nodeType1 a) -> t -> Maybe (LabelledNode nodeType1 a b)
      node2labelledNode placeOrTransition node = do
        let node' = placeOrTransition node
        nodeLabel <- PTNet.lookupLabel petriNet node'
        pure PTNet.LabelledNode { node = node', nodeLabel }

  numNodes PetriNet { graph } = Fgl.noNodes graph

  lookupLabel petriNet node = 
    node |> node2graphNode |> lookupGraphNode petriNet |> fmap nodeLabel

  inArcs place@(PTNet.Place _) = inOutArcs graphNode2transition In place
  inArcs transition@(PTNet.Transition _) = inOutArcs graphNode2place In transition

  outArcs place@(PTNet.Place _) = inOutArcs graphNode2transition Out place
  outArcs transition@(PTNet.Transition _) = inOutArcs graphNode2place Out transition

  addNode node nodeLabel petriNet@PetriNet { .. } =
    PetriNet { graph = graph', places = places', transitions = transitions' }
    where
      graphNode = node2graphNode node

      fglNode
        | Just NodeMapVal { .. } <- lookupGraphNode petriNet graphNode = fglNode
        | otherwise = graph |> Fgl.newNodes 1 |> head

      insertLabelledNode nodeName nodeMap =
        HashMap.insert nodeName NodeMapVal { .. } nodeMap

      (places', transitions') = case graphNode of
        GraphNode PTNet.PlaceType nodeName  ->
          (insertLabelledNode nodeName places, transitions)
        GraphNode PTNet.TransitionType nodeName ->
          (places, insertLabelledNode nodeName transitions)

      graph' = Fgl.insNode (fglNode, graphNode) graph 

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

  addArc arc@PTNet.Arc { .. } petriNet@PetriNet { .. } =
    (node2fglNode arcSrc, node2fglNode arcDest)
    |> sequenceT |> fmap labelEdge |> maybe petriNet updatePetriNet
    where
      node2fglNode :: PTNet.Node nodeType a -> Maybe Fgl.Node
      node2fglNode node =
        node |> node2graphNode |> lookupGraphNode petriNet |> fmap fglNode

      labelEdge (src, dest) = (src, dest, arcLabel)

      updatePetriNet labelledEdge =
        petriNet { graph = Fgl.insEdge labelledEdge graph }
 
testPetriNet :: PetriNet String Double Int
testPetriNet =
  PTNet.empty
  |> PTNet.addNode (PTNet.Place "P1") 0.1
  |> PTNet.addNode (PTNet.Transition "T1") 0.2
  |> PTNet.addNode (PTNet.Transition "T2") 0.3
  |> PTNet.addArc (PTNet.Arc (PTNet.Place "P1") (PTNet.Transition "T1") 1)
  |> PTNet.addArc (PTNet.Arc (PTNet.Place "P1") (PTNet.Transition "T2") 2)
  |> PTNet.addArc (PTNet.Arc (PTNet.Transition "T2") (PTNet.Place "P1") 3)
  |> PTNet.addArcs []
  -- |> PTNet.addArc (PTNet.Arc (PTNet.Place "P1", PTNet.Place "P1", 4))
  -- |> PTNet.addArc (PTNet.Arc (PTNet.Transition "T1", PTNet.Transition "T2", 4))

-- testArcs :: Maybe [(Node TransitionType String String, Int)]
testArcs = PTNet.arcs (PTNet.Place "P1") testPetriNet