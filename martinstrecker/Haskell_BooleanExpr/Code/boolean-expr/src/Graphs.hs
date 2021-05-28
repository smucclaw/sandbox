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

mynodes :: [LNode String]
mynodes = [(0, "a"), (1, "b"), (2, "c")]

myedges :: [LEdge Int]
myedges = [(0, 1, 10), (0, 2, 20), (2, 0, 30), (1, 2, 25)]

mygraph ::NamedGraph
mygraph = mkGraph mynodes myedges

-- defaultVis :: (Graph gr) => gr nl el -> DotGraph Node
--defaultVis = graphToDot nonClusteredParams
-- defaultVis = graphToDot quickParams

-- mydot :: DotGraph Node
-- just run mydot to generate the file graph.pdf
mydot = runGraphviz (graphToDot quickParams mygraph) Pdf "graph.pdf"

----------------------------------------------------------------------

smallGrNodes :: [LNode String]
smallGrNodes = [(0, "A"), (1, "B"), (2, "C"), (3, "G")]

smallGrEdges :: [LEdge Int]
smallGrEdges = [(0, 1, 3), (1, 2, 4), (1, 3, 2), (2, 3, 5), (3, 2, 5)]

smallGraph :: Gr String Int
smallGraph = mkGraph smallGrNodes smallGrEdges

smallGrDot :: IO FilePath
smallGrDot = runGraphviz (graphToDot quickParams smallGraph) Pdf "graph.pdf"

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

type SearchPath a = (a, [a])

type GraphSearchPath = SearchPath Node

nextPath :: Gr a b -> GraphSearchPath -> [GraphSearchPath]
nextPath gr (nd, p) =
  let sucnds = suc gr nd
  in map (\scnd -> (scnd, p ++ [nd])) sucnds


displayGraphSearchPath gr (nd, p) = (fromJust (lab gr nd), map (fromJust . (lab gr)) p)


{-
map (Data.Graph.Inductive.lab mygraph) (take 5 (breadthfirst (Data.Graph.Inductive.suc mygraph) (\x -> True) 0))
map (displayGraphSearchPath mygraph) (take 5 (breadthfirst (nextPath mygraph) (\x -> True) (0, [])))
-}


----------------------------------------------------------------------
-- Cabbage, Ferryman, Goat, Wolf problem
----------------------------------------------------------------------

data Side = Ls | Rs
  deriving (Eq, Ord, Show, Read)

type Cfgw_state = (Side, Side, Side, Side)

otherSide :: Side -> Side
otherSide Ls = Rs
otherSide Rs = Ls

cross_cabbage :: Cfgw_state -> Cfgw_state
cross_cabbage (cs, fs, gs, ws) = (otherSide cs, fs, gs, ws)

cross_ferryman :: Cfgw_state -> Cfgw_state
cross_ferryman (cs, fs, gs, ws) = (cs, otherSide fs, gs, ws)

cross_goat :: Cfgw_state -> Cfgw_state
cross_goat (cs, fs, gs, ws) = (cs, fs, otherSide gs, ws)

cross_wolf :: Cfgw_state -> Cfgw_state
cross_wolf (cs, fs, gs, ws) = (cs, fs, gs, otherSide ws)

valid_state :: Cfgw_state -> Bool
valid_state (cs, fs, gs, ws) = (cs /= gs || gs == fs) && (ws /= gs || gs == fs)

cross_boat :: Cfgw_state -> [Cfgw_state]
cross_boat s =
  filter valid_state
  ([cross_ferryman, cross_ferryman . cross_cabbage, cross_ferryman . cross_goat, cross_ferryman . cross_wolf]
   <*> [s])

start_state :: Cfgw_state
start_state = (Ls, Ls, Ls, Ls)

goal_state :: Cfgw_state -> Bool
goal_state (Rs, Rs, Rs, Rs) = True
goal_state _ = False


cfgw_search_nexts :: SearchPath Cfgw_state -> [SearchPath Cfgw_state]
cfgw_search_nexts (nd, p) = 
  let sucnds = cross_boat nd
  in map (\scnd -> (scnd, p ++ [nd])) sucnds

-- with pruning: avoid duplicate visits to the same state
cfgw_search_nexts_prune :: SearchPath Cfgw_state -> [SearchPath Cfgw_state]
cfgw_search_nexts_prune (nd, p) = 
  let sucnds = cross_boat nd
  in (filter (\(nn, np) -> nn `notElem` np) (map (\scnd -> (scnd, p ++ [nd])) sucnds))

cfgw_search_sol :: SearchPath Cfgw_state -> Bool
cfgw_search_sol (nd, p) = goal_state nd

{-
(take 1 (breadthfirst cfgw_search_nexts cfgw_search_sol (start_state, [])))
breadthfirst cfgw_search_nexts_prune cfgw_search_sol (start_state, [])
-}

code_side :: Side -> Int
code_side Ls = 0
code_side Rs = 1

code_cfgw_state :: Cfgw_state -> Int
code_cfgw_state (cs, fs, gs, ws) = (code_side cs)*8 + (code_side fs)*4  + (code_side gs)*2  + (code_side ws)

cfgwNodes :: [LNode Cfgw_state]
cfgwNodes = [(code_cfgw_state (cs, fs, gs, ws), (cs, fs, gs, ws)) | cs <- [Ls, Rs], fs <- [Ls, Rs], gs <- [Ls, Rs], ws <- [Ls, Rs]]

cfgwEdges :: [LEdge String]
cfgwEdges = concatMap (\(n, s) -> (map (\s' -> (n, code_cfgw_state s', "")) (cross_boat s))) cfgwNodes

type CfgwGraph = Gr Cfgw_state String
cfgwGraph :: CfgwGraph
cfgwGraph = mkGraph cfgwNodes cfgwEdges


stateToString :: Cfgw_state -> String
stateToString (cs, fs, gs, ws) = show (cs, fs, gs, ws)

instance Labellable Side where
  toLabelValue Ls = StrLabel (T.pack "L")
  toLabelValue Rs = StrLabel (T.pack "R")


instance Labellable Cfgw_state where
  toLabelValue s  = StrLabel (T.pack (stateToString s))
  
cfgwdot = runGraphviz (graphToDot quickParams cfgwGraph) Pdf "graph.pdf"
