{-# OPTIONS_GHC -XFlexibleInstances #-}

module Graphs where

import Data.Maybe
import Data.Text.Lazy as T (pack)

import Data.Graph.Inductive.Graph
import Data.Graph.Inductive.PatriciaTree

import Data.GraphViz
import Data.GraphViz.Printing
import Data.GraphViz.Commands
import Data.GraphViz.Attributes.Complete

type NamedGraph = Gr String Int


----------------------------------------------------------------------
-- Experiments using Graphviz, in the Gr graph representation
----------------------------------------------------------------------

mynodes :: [LNode String]
mynodes = [(0, "a"), (1, "b"), (2, "c")]

myedges :: [LEdge Int]
myedges = [(0, 1, 10), (0, 2, 20), (2, 0, 30), (1, 2, 25)]

mygraph ::NamedGraph
mygraph = mkGraph mynodes myedges

-- mydot :: DotGraph Node
-- just run mydot to generate the file graph.pdf
mydot = runGraphviz (graphToDot quickParams mygraph) Pdf "graph.pdf"

-- ----------
-- Further experimens with graphs (as presented on the slides and in the exercises)

smallGrNodes :: [LNode String]
smallGrNodes = [(0, "A"), (1, "B"), (2, "C"), (3, "G")]

smallGrEdges :: [LEdge Int]
smallGrEdges = [(0, 1, 3), (1, 2, 4), (1, 3, 2), (2, 3, 5), (3, 2, 5)]

-- Empty string version
smallGrEdgesES :: [LEdge String]
smallGrEdgesES = [(0, 1, ""), (1, 2, ""), (1, 3, ""), (2, 3, ""), (3, 2, "")]

-- Attempt to create 2-dimensional node contents. Not convincing - would require monospace font.
notsosmallGrNodes ::  [LNode String]
notsosmallGrNodes = [(0, " |x\nx| "), (1, " |x\n |x"), (2, "x| \n |x"), (3, "x| \nx| ")]

smallGraph :: Gr String Int
smallGraph = mkGraph smallGrNodes smallGrEdges

smallGraphES :: Gr String String
smallGraphES = mkGraph smallGrNodes smallGrEdgesES

notsosmallGr :: Gr String String
notsosmallGr = mkGraph notsosmallGrNodes smallGrEdgesES

smallGrDot :: IO FilePath
smallGrDot = runGraphviz (graphToDot quickParams smallGraph) Pdf "graph.pdf"

smallGrDotES = runGraphviz (graphToDot quickParams smallGraphES) Pdf "graph.pdf"

notsosmallGrDot = runGraphviz (graphToDot quickParams notsosmallGr) Pdf "graph.pdf"

----------------------------------------------------------------------
-- The edge-list and next-fun representation formats
----------------------------------------------------------------------

data EdgeListGraph a = ELG [a] [(a, a)]
  deriving (Eq, Ord, Show, Read)

data NextFunGraph a = NFG [a] (a -> [a])


smallGrELG =
  ELG ["A", "B", "C", "G"] [("A", "B"), ("B", "C"), ("B", "G"), ("C", "G"), ("G", "C")]

smallGrNexts x = case x of
  "A" -> ["B"]
  "B" -> ["C", "G"]
  "C" -> ["G"]
  "G" -> ["C"]
  _   -> []

smallGrNFG = NFG ["A", "B", "C", "G"] smallGrNexts

edgeListGraphToGrNodes :: [a] -> [LNode a]
edgeListGraphToGrNodes ns = zip [0 .. (length ns) -1] ns

-- the elements swapped as compared to the above
grToEdgeListGraphNodes :: [a] -> [(a, Node)]
grToEdgeListGraphNodes ns = zip ns [0 .. (length ns) -1]

edgeListGraphToGrEdges :: (a -> Node) -> [(a, a)] -> [LEdge String]
edgeListGraphToGrEdges m = map (\(v1, v2) -> (m v1, m v2, ""))

-- conversion from edge-list format to Gr graph format
edgeListGraphToGr :: (Eq a) => EdgeListGraph a -> Gr a String
edgeListGraphToGr (ELG ns es) =
  let inv_nodes_map = grToEdgeListGraphNodes ns
      m = (\n -> fromJust (lookup n inv_nodes_map))
  in mkGraph (edgeListGraphToGrNodes ns) (edgeListGraphToGrEdges m es)


-- conversion from next-fun format to edge-list format
edgeNextsToEdgeList :: (a -> [a]) -> [a] -> [(a, a)]
edgeNextsToEdgeList nxts = concatMap (\v1 -> (map (\v2 -> (v1, v2)) (nxts v1)))

nextFunGraphToEdgeListGraph :: NextFunGraph a -> EdgeListGraph a
nextFunGraphToEdgeListGraph (NFG nds nxts) = ELG nds (edgeNextsToEdgeList nxts nds)


-- ---------- some more examples

-- the above smallGraph generated via NFG and conversions
smallGraph2 :: Gr String String
smallGraph2 =
  edgeListGraphToGr (nextFunGraphToEdgeListGraph
                     (NFG ["A", "B", "C", "G"]  smallGrNexts))
smallGrDot2 :: IO FilePath
smallGrDot2 = runGraphviz (graphToDot quickParams smallGraph2) Pdf "graph.pdf"


-- a larger graph appearing on the slides
exampleGraphNexts :: String -> [String]
exampleGraphNexts x = case x of
  "A" -> ["B", "E", "D"]
  "B" -> ["C", "G"]
  "C" -> ["F", "G", "I"]
  "D" -> ["H"]
  "E" -> ["H", "I"]
  "F" -> ["J"]
  "G" -> []
  "H" -> []
  "I" -> ["J"]
  "J" -> []
  _   -> []


exampleGraph :: EdgeListGraph String
exampleGraph = nextFunGraphToEdgeListGraph (NFG ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"] exampleGraphNexts)

exampleGraphDot = runGraphviz (graphToDot quickParams (edgeListGraphToGr exampleGraph)) Pdf "graph.pdf"


----------------------------------------------------------------------
-- search procedures (section 4 of the exercises)
----------------------------------------------------------------------

depthfirst :: (t -> [t]) -> (t -> Bool) -> t -> [t]
depthfirst nexts sol x = dfs [x]
  where
    dfs [] = []
    dfs (nd:nds) =
      if sol nd
      then nd : dfs (nexts nd ++ nds)
      else dfs (nexts nd ++ nds)

breadthfirst :: (t -> [t]) -> (t -> Bool) -> t -> [t]
breadthfirst nexts sol x = bfs [x]
  where
    bfs [] = []
    bfs (nd:nds) =
      if sol nd
      then nd : bfs (nds ++ nexts nd)
      else bfs (nds ++ nexts nd)


type SearchPath a = [a]

liftNextsToPath :: (a -> [a]) -> SearchPath a -> [SearchPath a]
liftNextsToPath nxts pth = map (\n -> pth ++ [n]) (nxts (last pth))

liftNextsToPathNoDup :: Eq a => (a -> [a]) -> SearchPath a -> [SearchPath a]
liftNextsToPathNoDup nxts pth =
  concatMap
  (\n -> if n `elem` pth then [] else [pth ++ [n]])
  (nxts (last pth))

pathsFromToBFS nexts start goal =
  breadthfirst
  (liftNextsToPathNoDup nexts)
  (\pth -> last pth == goal)
  [start]

pathsFromToDFS nexts start goal =
  depthfirst
  (liftNextsToPathNoDup nexts)
  (\pth -> last pth == goal)
  [start]

  
----------------------------------------------------------------------
-- Cabbage, Ferryman, Goat, Wolf problem
----------------------------------------------------------------------

data Side = Ls | Rs
  deriving (Eq, Ord, Show, Read)

type CfgwState = (Side, Side, Side, Side)

otherSide :: Side -> Side
otherSide Ls = Rs
otherSide Rs = Ls

crossCabbage, crossFerryman, crossGoat, crossWolf :: CfgwState -> CfgwState
crossCabbage  (cs, fs, gs, ws) = (otherSide cs, fs, gs, ws)
crossFerryman (cs, fs, gs, ws) = (cs, otherSide fs, gs, ws)
crossGoat     (cs, fs, gs, ws) = (cs, fs, otherSide gs, ws)
crossWolf     (cs, fs, gs, ws) = (cs, fs, gs, otherSide ws)

validState :: CfgwState -> Bool
validState (cs, fs, gs, ws) = (cs /= gs || gs == fs) && (ws /= gs || gs == fs)

crossBoat :: CfgwState -> [CfgwState]
crossBoat s =
  filter validState
  ([crossFerryman, crossFerryman . crossCabbage, crossFerryman . crossGoat, crossFerryman . crossWolf]
   <*> [s])

solvePuzzle = pathsFromToDFS crossBoat (Ls, Ls, Ls, Ls) (Rs, Rs, Rs, Rs)


-- display reduced graph (containing only valid nodes)
cfgwNodes :: [CfgwState]
cfgwNodes = [(cs, fs, gs, ws) | cs <- [Ls, Rs], fs <- [Ls, Rs], gs <- [Ls, Rs], ws <- [Ls, Rs], validState(cs, fs, gs, ws)]

cfgwGraph = edgeListGraphToGr (nextFunGraphToEdgeListGraph (NFG cfgwNodes crossBoat))


instance Labellable CfgwState where
  toLabelValue s  = StrLabel (T.pack (show s))

cfgwDot = runGraphviz (graphToDot quickParams cfgwGraph) Pdf "graph.pdf"

