{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE TupleSections #-}
module Rule34_jacob where

import Utils
import qualified Data.Map.Strict as Map
import Data.Text (Text)
import qualified Data.Text as Text
import qualified Data.Bifunctor

import Data.Graph.Inductive.Graph (mkGraph)
import Data.Graph.Inductive.PatriciaTree (Gr)

import Encoding ( GateType(..) )
-- import Data.GraphViz (preview)
import Graphviz (preview'custom)

data ParaRef = P341 | P341a | P341b | P341c | P341d | P341e | P341f
  | P342 | P343 | P344 | P345 | P346 | P347 | PMustNot | PMay
  deriving (Eq, Ord)

data Direction = In | Out deriving (Eq, Ord)

data Statement = Stmt {
  sParaRef :: ParaRef,
  sLabel :: Text,
  sGateType :: GateType,
  sInputs :: [ParaRef],
  -- sOutputs :: [ParaRef],
  sSubjectTo :: [ParaRef],
  sDespite :: [ParaRef]
}

-- | encoding of the legal text
rule34_text :: [Statement]
rule34_text = init [
  Stmt PMustNot "Must Not" Bulb [P341] [] [],
  Stmt P341 "34.1 associated with bad business" OR [P341a, P341b, P341c, P341d, P341e, P341f] [] [],
  Stmt P341a "34.1a undignified" Switch [] [] [],
  Stmt P341b "34.1b materially interferes" Switch [] [] [],
  Stmt P341c "34.1c unfairly attractive" Switch [] [] [],
  Stmt P341d "34.1d fee sharing" Switch [] [] [],
  Stmt P341e "34.1e GOTO 1st Schedule" Switch [] [] [],
  Stmt P341f "34.1f otherwise prohibited" Switch [] [] [],

  Stmt P342 "34.2 connected [see sub conditions]" Switch [] [P341] [],

  Stmt undefined undefined undefined undefined undefined undefined
  --- ^ for trailing commas
  ]

-- | Int represents node index
data MakeGraphState = MGState {
  mgsPointers :: Map.Map ParaRef Int,
  --- ^ A paragraph may be represented by a newer logic gate node
  ---      as @makeGraph@ builds the graph.
  mgsNodes :: [(Int, GateType, Text)], -- Text is node label
  mgsEdges :: [(ParaRef, Int)],
  mgsCounter :: Int }

makeGraph1 :: [Statement] -> MakeGraphState
makeGraph1 statements = statements
  & foldl f (MGState mempty [] [] 0)
  where
    f :: MakeGraphState -> Statement -> MakeGraphState
    f mgsState@MGState{ mgsPointers, mgsNodes, mgsEdges, mgsCounter = i } Stmt {sParaRef, sLabel, sGateType, sInputs} =
      mgsState{
        mgsPointers = Map.insert sParaRef i mgsPointers,
        mgsNodes = (i, sGateType, sLabel) : mgsNodes,
        mgsEdges = mgsEdges ++ fmap (,i) sInputs,
        mgsCounter = succ i
        }

-- makeNodes :: [Statement] -> [(Int, Text)]
-- makeNodes statements = statements
--   <&> (\Stmt{ sLabel, sGateType } ->
--     (Text.pack . show) sGateType <> ": " <> sLabel)
--   & zip [0..]

makeGraph2 :: MakeGraphState -> Gr Text Text
makeGraph2 MGState{ mgsPointers, mgsNodes, mgsEdges } =
  mkGraph @Gr (mgsNodes <&> makeNode) (mgsEdges <&> makeFinalEdge <&> \(x,y) -> (x,y,"" :: Text))
  where
    makeNode :: (Int, GateType, Text) -> (Int, Text)
    makeNode (i, gateType, label) =
      (i, (Text.pack . show) gateType <> ": " <> label)
    makeFinalEdge :: (ParaRef, Int) -> (Int, Int)
    makeFinalEdge =
      -- \(paraRef, int) -> (pointers Map.! paraRef, int) -- replaced with hlint suggestion
      Data.Bifunctor.first (mgsPointers Map.!) -- hlint suggested this

makeGraph :: [Statement] -> Gr Text Text
makeGraph = makeGraph1 >>> makeGraph2

rule34_jacobMain :: IO ()
rule34_jacobMain = do
  putStrLn "__rule34_jacobMain__"
  preview'custom (makeGraph rule34_text) >> putStrLn "< visualise a graph using the Xlib GraphvizCanvas >"
