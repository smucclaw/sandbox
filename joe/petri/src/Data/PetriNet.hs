{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeFamilyDependencies #-}

module Data.PetriNet where
import Control.Applicative as App
import Data.Kind (Constraint, Type)
import GHC.Generics (Generic)
-- import GHC.TypeLits (ErrorMessage (Text), TypeError)

import Data.Hashable (Hashable)
import Data.Tuple.All (sequenceT)
import Flow ((|>))

{-
  NodeType is a type living in the Type universe.  
  Using DataKinds, we promote it to its own type universe called NodeType.
  This universe is disjoint from Type.
  The constructors PlaceType and TransitionType are then promoted to types
  living in this universe.

  Note that this type is isomorphic to Bool and the type family FlipNodeType
  functions like a type-level negation operator.
  Alternatively, one may view the (->) type constructor as a non-dependent
  analogue of the Pi type so that FlipNodeType as a family of types indexed by
  the input srcType living in the NodeType universe.

  TypeFamilyDependencies is used here to indicate that this indexed family
  is injective in the sense that for each output type destType, there is only
  one index srcType corresponding to it.
  Practically, this tells GHC that RHS of the equalities can be inverted,
  which helps to avoid some unintuitive type errors.
-}
data NodeType  = PlaceType | TransitionType
  deriving (Eq, Generic, Ord, Read, Show)

instance Hashable NodeType

type family FlipNodeType srcType = destType | destType -> srcType where
  FlipNodeType PlaceType = TransitionType
  FlipNodeType TransitionType = PlaceType

-- NodeType is used by the Node type to elevate and store information about the
-- data constructor at the type level.
-- Notice how the output type is indexed by NodeType so that PlaceType and
-- TransitionType function as type-level tags telling us if Node was constructed
-- via Place or Transition.
-- More specifically, this allows us to ban, at the type-level, arcs formed by
-- the pairs (Place _, Place _) and (Transition _, Transition _).

data Node (nodeType :: NodeType) nodeName where
  Place :: a -> Node PlaceType a
  Transition :: a -> Node TransitionType a

deriving instance Eq a => Eq (Node nodeType a)
deriving instance Ord a => Ord (Node nodeType a)
deriving instance Show a => Show (Node nodeType a)

data LabelledNode nodeType a b = LabelledNode
  { node :: Node nodeType a,
    nodeLabel :: b
  }
  deriving (Eq, Ord, Show)

data Arc srcType a c = Arc
  { arcSrc :: Node srcType a,
    arcDest :: Node (FlipNodeType srcType) a,
    arcLabel :: c
  }
  deriving (Eq, Ord, Show)

data InOutArcs srcType a b c = LabelledArcs
  { incomingArcs :: [InOutArc (FlipNodeType srcType) a b c],
    outgoingArcs :: [InOutArc (FlipNodeType srcType) a b c]
  }
  deriving (Eq, Ord, Show)

data InOutArc srcType a b c = LabelledArc
  { otherNode :: LabelledNode srcType a b,
    inOutArcLabel :: c
  }
  deriving (Eq, Ord, Show)

{-
  Family of constraints indexed by 2 type universes a and b, followed by the
  srcType and destType, which live in the universes (a -> Node a a) and
  (b -> Node b b) respectively.
-}
-- type ValidArc :: NodeType -> NodeType -> Constraint
-- type family ValidArc srcType destType where
--   ValidArc PlaceType TransitionType = ()
--   ValidArc TransitionType PlaceType = ()
--   ValidArc _ _ =
--     TypeError (Text "Excuse me, you can only add arcs between places and transitions!")

type InOutArcsType nodeType destType pn a b c =
  Node nodeType a ->
  pn a b c ->
  [Arc nodeType a c]

-- PetriNet class that defines some of the basic operations on a Petri net.
--
-- a is the type of names for nodes 
-- b is the type of labels for nodes.
-- c is the type of labels for arcs.
class PetriNet pn a b c where
  -- Construct an empty Petri net.
  empty :: pn a b c

  -- Check if a given node exists in the Petri net.
  nodeElem :: (Eq a, Eq b) => Node nodeType a -> pn a b c -> Bool
  place@(Place _) `nodeElem` petriNet =
    petriNet |> nodes |> fst |> map node |> (place `elem`)

  transition@(Transition _) `nodeElem` petriNet =
    petriNet |> nodes |> snd |> map node |> (transition `elem`)

  -- Get all the nodes in a Petri net.
  nodes :: pn a b c -> ([LabelledNode PlaceType a b], [LabelledNode TransitionType a b])

  -- Given a Petri net and a node, find the label corresponding to that node.
  lookupLabel :: pn a b c -> Node nodeType a -> Maybe b

  -- Count the number of nodes in a Petri net.
  numNodes :: pn a b c -> Int
  numNodes petriNet =
    length places + length transitions
    where
      (places, transitions) = nodes petriNet

  -- Add a node to a Petri net.
  addNode :: Node nodeType a -> b -> pn a b c -> pn a b c

  -- Delete a node from a Petri net.
  delNode :: Node nodeType a -> pn a b c -> pn a b c

  -- Given a node and a Petri net, find all incoming and outgoing arcs for that node.
  arcs ::
    Node nodeType a ->
    pn a b c ->
    Maybe (InOutArcs nodeType a b c)
  arcs node petriNet =
    (inArcs', outArcs') |> sequenceT |> fmap (uncurry LabelledArcs)
    where
      aux inOrOutArcs = petriNet |> inOrOutArcs node
      inArcs' = aux inArcs
      outArcs' = aux outArcs

  -- Get the incoming arcs for a node in a Petri net.
  inArcs :: Node nodeType a -> pn a b c -> Maybe [InOutArc (FlipNodeType nodeType) a b c]
  inArcs node petriNet = petriNet |> arcs node |> fmap incomingArcs

  -- Get the outgoing arcs for a node in a Petri net.
  outArcs :: Node nodeType a -> pn a b c -> Maybe [InOutArc (FlipNodeType nodeType) a b c]
  outArcs node petriNet = petriNet |> arcs node |> fmap outgoingArcs

  -- Add a new arc to a Petri net.
  addArc :: Arc srcType a c -> pn a b c -> pn a b c
  
  -- Delete an arc from a Petri net.
  delArc :: Arc srcType a c -> pn a b c -> pn a b c

type Marking pn a b c tokenType =
  Node PlaceType a -> pn a b c -> Maybe [tokenType]

-- emptyMarking :: Marking pn a b c tokenType
-- emptyMarking (Place _) _ = Just []

class PetriNet pn a b c => MarkedPetriNet pn a b c tokenType where
  marking :: Marking pn a b c tokenType

-- isEnabled :: Node TransitionType a -> Marking pn a b c tokenType -> pn a b c -> Bool
-- fireTranstion :: SNode Transition a b -> pn a b c -> pn a b c

addArcs ::
  (Foldable t, PetriNet pn a b c) =>
  t (Arc srcType a c) ->
  pn a b c ->
  pn a b c
addArcs arcs petriNet = foldl (flip addArc) petriNet arcs