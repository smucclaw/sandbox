{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE ImportQualifiedPost #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE StandaloneKindSignatures #-}
{-# LANGUAGE TypeFamilyDependencies #-}
{-# LANGUAGE UndecidableInstances #-}

module Data.PetriNet where
import Control.Applicative qualified as App
import Data.Bifunctor (bimap)
import Control.Monad (join)
import Data.Kind (Type)
import Data.Monoid (Endo(..))
import GHC.Generics (Generic)
import GHC.TypeLits (ErrorMessage (Text), TypeError)

import Data.Hashable (Hashable)
import Data.Tuple.All (sequenceT)
import Flow ((|>), (.>))

{-
Node is a family of types doubly indexed by 2 types:
- nodeType:
  This type indicates the type (as in a place or a transition) of the node.
  In practice, this is either:
  - PlaceType, which indicates that the node is a place
  - TransType, which indicates that the node is a transition
- nodeName:
  This is the type of the names that will be associated with each node.
  This could be String, but we only require that it be hashable.

Notice that the data constructors of Node inject into different type universes,
ie the output of Place is indexed by PlaceType, while that of Trans(ition)
is indexed by TransType.
This elevates information about the node to the type-level, so that we know,
at the type-level, if the node is a place or transition.

Now, FlipPT can be viewed as a type-level function which behaves as a boolean
toggle between PlaceType and TransType, leaving all other types untouched.

Note that we could also do this by using DataKinds and saying
data NodeType = PlaceType | TransType
so that NodeType would be promoted to its own standalone type universe, which
is disjoint from * = Type, with PlaceType and TransType living in there.
Then, FlipPT could have the type FlipPT :: NodeType -> NodeType, in which case
we see that NodeType is essentially a type-level boolean type, with FlipPT
acting as boolean negation.

This is used in the Arc record to force the arcDest to be a transition when
arcSrc is a place, and vice versa.
Practically, this means that the typechecker will prevent us from creating
arcs like (Place, Place) and (Trans, Trans).
-}
data PlaceType :: Type
  deriving Generic

data TransType :: Type
  deriving Generic

data Node :: Type -> Type -> Type where
  Place :: nodeName -> Node PlaceType nodeName
  Trans :: nodeName -> Node TransType nodeName

deriving instance Eq a => Eq (Node nodeType a)
deriving instance Ord a => Ord (Node nodeType a)
deriving instance Show a => Show (Node nodeType a)
-- deriving instance Generic (Node nodeType a)

{-
Here we use TypeFamilyDependencies to force GHC to recognize this as an
injective type family.
In other words, GHC will now happily rewrite LHS -> RHS when dealing with
type equality constraints.
This may help to avoid some weird and unintuitive type errors, though
I (Joe) have yet to come across any without.
-}
type FlipPT :: Type -> Type
type family FlipPT srcType = destType | destType -> srcType where
  FlipPT PlaceType = TransType
  FlipPT TransType = PlaceType
  FlipPT a = a

data LabelledNode nodeType a b = LabelledNode
  { node :: Node nodeType a,
    nodeLabel :: b
  }
  deriving (Eq, Generic, Ord, Show)

instance
  (Hashable (Node nodeType a), Hashable b) =>
  Hashable (LabelledNode nodeType a b)

data Arc srcType a = Arc
  { arcSrc :: Node srcType a,
    arcDest :: Node (FlipPT srcType) a
  }
  deriving (Eq, Generic, Ord, Show)

instance
  (Hashable (Node srcType a), Hashable (Node (FlipPT srcType) a)) =>
  Hashable (Arc srcType a)
  
data LabelledArc srcType a c = LabelledArc
  { arc :: Arc srcType a,
    arcLabel :: c
  }
  deriving (Eq, Generic, Ord, Show)

instance
  (Hashable (Arc srcType a), Hashable c) =>
  Hashable (LabelledArc srcType a c)

data InOutArc srcType a b c = InOutArc
  { otherNode :: LabelledNode srcType a b,
    inOutArcLabel :: c
  }
  deriving (Eq, Generic, Ord, Show)

instance
  (Hashable (LabelledNode srcType a b), Hashable c) =>
  Hashable (InOutArc srcType a b c)

data InOutArcs srcType a b c = InOutArcs
  { incomingArcs :: [InOutArc (FlipPT srcType) a b c],
    outgoingArcs :: [InOutArc (FlipPT srcType) a b c]
  }
  deriving (Eq, Generic, Ord, Show)

instance
  Hashable (InOutArc (FlipPT srcType) a b c) =>
  Hashable (InOutArcs srcType a b c)

type InOutArcsType nodeType destType pn a b c =
  Node nodeType a ->
  pn a b c ->
  [LabelledArc nodeType a c]

-- PetriNet class that defines some of the basic operations on a Petri net,
-- viewed as a directed, bipartite graph.
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

  trans@(Trans _) `nodeElem` petriNet =
    petriNet |> nodes |> snd |> map node |> (trans `elem`)

  -- Get all the nodes in a Petri net.
  nodes :: pn a b c -> ([LabelledNode PlaceType a b], [LabelledNode TransType a b])

  -- Given a Petri net and a node, find the label corresponding to that node.
  lookupLabel :: pn a b c -> Node nodeType a -> Maybe b

  -- Count the number of nodes in a Petri net.
  numNodes :: pn a b c -> Int
  numNodes petriNet =
    petriNet |> nodes |> bimap length length |> uncurry (+)

  -- Add a node to a Petri net.
  addNode :: LabelledNode nodeType a b -> pn a b c -> pn a b c

  -- Delete a node from a Petri net.
  delNode :: Node nodeType a -> pn a b c -> pn a b c

  -- Given a node and a Petri net, find all incoming and outgoing arcs for that node.
  arcs ::
    Node nodeType a ->
    pn a b c ->
    Maybe (InOutArcs nodeType a b c)
  arcs node petriNet =
    node |> App.liftA2 (,) inArcs' outArcs' |> sequenceT |> fmap (uncurry InOutArcs)
    where
      aux inOrOutArcs = flip inOrOutArcs petriNet
      inArcs' = aux inArcs
      outArcs' = aux outArcs

  -- Get the incoming arcs for a node in a Petri net.
  inArcs :: Node nodeType a -> pn a b c -> Maybe [InOutArc (FlipPT nodeType) a b c]
  inArcs node petriNet = petriNet |> arcs node |> fmap incomingArcs

  -- Get the outgoing arcs for a node in a Petri net.
  outArcs :: Node nodeType a -> pn a b c -> Maybe [InOutArc (FlipPT nodeType) a b c]
  outArcs node petriNet = petriNet |> arcs node |> fmap outgoingArcs

  -- Add a new arc to a Petri net.
  addArc :: LabelledArc srcType a c -> pn a b c -> pn a b c
  
  -- Delete an arc from a Petri net.
  delArc :: Arc srcType a -> pn a b c -> pn a b c

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
  t (LabelledArc srcType a c) ->
  pn a b c ->
  pn a b c
addArcs arcs petriNet = foldl (flip addArc) petriNet arcs


-- Work-in-progress function that converts a Petri net into the textual .net
-- format accepted by the Tina tool for Petri nets.
-- https://projects.laas.fr/tina/
toTina ::
  forall pn a b c.
  (Show a, Show b, PetriNet pn a b c) =>
  pn a b c ->
  String
toTina petriNet =
  petriNet
  -- Grab all nodes and apply place2tina (resp trans2tina) to all the
  -- places (resp transitions).
  -- This converts all the places/trans into strings in Tina's .net format.
  |> nodes |> bimap (foldMap place2tina) (foldMap trans2tina)
  -- Finally, we combine all the strings.
  |> uncurry (<>) |> runCont
  where
    -- Technially, strings are represented as continuations via
    -- toCont(inuation), which is the Yoneda embedding from a monoid into the
    -- corresponding endomorphism monoid.
    -- More concretely, it maps an element x of a monoid m to (x <>), its
    -- corresponding continuation, ie action, in the monoid of endormophisms
    -- over m.
    --
    -- runCont(inuation) is then the inverse mapping from the endomorphism
    -- monoid back to the original monoid.
    -- It takes a continuation as input and runs it with the identity element
    -- mempty of the original monoid and returns the result.
    --
    -- Note that the Yoneda Lemma says that these embeddings are inverses so
    -- that we can happily identify an element of a monoid with its corresponding
    -- continuation.
    --
    -- This is essentially the same trick as employed by difference lists and
    -- ShowS and showsPrec, to re-associate a left fold of the form
    -- (((as ++ bs) ++ cs) ++ ds) into (as ++ (bs ++ (cs ++ ds))), which is more
    -- efficient to compute when dealing with singly linked lists.
    toCont :: Monoid m => m -> Endo m
    toCont = (<>) .> Endo

    runCont :: Monoid m => Endo m -> m
    runCont = flip appEndo mempty

    -- Specialized version of the CPS transformation that takes the
    -- contrapositive: forall a b c. (a -> b) -> (b -> c) -> (a -> c)
    -- toCps :: Monoid m => (m -> m) -> Endo m -> Endo m
    -- toCps f endo = Endo f <> endo

    -- Convert a single place to a string in Tina's .net format.
    place2tina :: LabelledNode PlaceType a b -> Endo String
    place2tina LabelledNode {node = Place nodeName, nodeLabel} =
      foldMap toCont ["pl ", show nodeName, " : ", show nodeLabel, "\n"]

    -- Convert a single transition to a string in Tina's .net format.
    trans2tina :: LabelledNode TransType a b -> Endo String
    trans2tina LabelledNode {node = node@(Trans _), nodeLabel} =
      petriNet |> arcs node |> maybe mempty inOutArcs2cont

    inOutArcs2cont :: InOutArcs TransType a b c -> Endo String
    inOutArcs2cont InOutArcs {..} =
      mconcat
        [ toCont "tr ",
          foldMap getPlaceName incomingArcs,
          toCont "-> ",
          foldMap getPlaceName outgoingArcs,
          toCont "\n"
        ]

    getPlaceName :: InOutArc PlaceType a b c -> Endo String
    getPlaceName InOutArc {otherNode = LabelledNode {node = Place nodeName}} =
      foldMap toCont [show nodeName, " "]