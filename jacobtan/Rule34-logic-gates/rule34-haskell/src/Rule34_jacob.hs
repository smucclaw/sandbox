{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE TupleSections #-}
module Rule34_jacob where

import Utils
import qualified Data.Map.Strict as Map
import Data.Text (Text)
import qualified Data.Text as Text

import Data.Graph.Inductive.Graph (mkGraph)
import Data.Graph.Inductive.PatriciaTree (Gr)

import Encoding ( GateType(..) )
-- import Data.GraphViz (preview)
import Graphviz (preview'custom)

data ParaRef = P341 | P341a | P341b | P341c | P341d | P341e | P341f
  | P342 | P343 | P344 | P345 | P346 | P347 | PMustNot | PMay
  deriving (Eq, Ord, Show)

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

  Stmt PMay "May" Bulb [P342] [] [],
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
  mgsEdges :: [(Input, Int)],
  mgsCounter :: Int }

data Input = IRef ParaRef | I Int

makeGraph1 :: [Statement] -> MakeGraphState
makeGraph1 statements = statements
  & foldl' f (MGState mempty [] [] 0)
  where
    f :: MakeGraphState -> Statement -> MakeGraphState
    f mgsState
      Stmt{ sParaRef, sLabel, sGateType, sInputs, sSubjectTo }
      = mgsState & initState & rewriteSubjectTo
      where
        initState :: MakeGraphState -> MakeGraphState
        initState mgsState@MGState{ mgsPointers, mgsNodes, mgsEdges, mgsCounter }
          = let i = succ mgsCounter in mgsState{
            mgsPointers = Map.insert sParaRef i mgsPointers,
            mgsNodes = (i, sGateType, sLabel) : mgsNodes,
            mgsEdges = mgsEdges ++ fmap (, i) (sInputs <&> IRef),
            mgsCounter = i
            }
        -- | defeasibility rewrite
        rewriteSubjectTo stateAfterInit@MGState{ mgsCounter, mgsPointers } =
          if null sSubjectTo then stateAfterInit
          else foldl' g (stateAfterInit & addAND) sSubjectTo
          where
            oldParaIndex = mgsPointers Map.! sParaRef
            andNodeIndex = succ mgsCounter
            addAND :: MakeGraphState -> MakeGraphState
            addAND mgsState@MGState{ mgsPointers, mgsNodes, mgsEdges, mgsCounter }
              = mgsState{
                  mgsNodes = (andNodeIndex, AND, show' sParaRef <> " with defeasibility") : mgsNodes,
                  mgsCounter = andNodeIndex,
                  mgsPointers = Map.insert sParaRef andNodeIndex mgsPointers,
                  mgsEdges = (I oldParaIndex, andNodeIndex) : mgsEdges
                  }
            g :: MakeGraphState -> ParaRef -> MakeGraphState
            g mgsState@MGState{ mgsPointers, mgsNodes, mgsEdges, mgsCounter } subjectTo
              = let j = succ mgsCounter in mgsState {
                  mgsNodes = (j, NOT, show' sParaRef <> " subject to " <> show' sSubjectTo) : mgsNodes,
                  mgsCounter = j,
                  mgsEdges = (IRef subjectTo, j) : (I j, andNodeIndex) : mgsEdges
                  }

makeGraph2 :: MakeGraphState -> Gr Text Text
makeGraph2 MGState{ mgsPointers, mgsNodes, mgsEdges } =
  mkGraph @Gr (mgsNodes <&> makeNode) (mgsEdges <&> makeFinalEdge <&> \(x,y) -> (x,y,"" :: Text))
  where
    makeNode :: (Int, GateType, Text) -> (Int, Text)
    makeNode (i, gateType, label) =
      (i, show' gateType <> ": " <> label)
    makeFinalEdge :: (Input, Int) -> (Int, Int)
    makeFinalEdge = \case
      (I i, j) -> (i,j)
      (IRef paraRef, int) -> (mgsPointers Map.! paraRef, int)

makeGraph :: [Statement] -> Gr Text Text
makeGraph = makeGraph1 >>> makeGraph2

rule34_jacobMain :: IO ()
rule34_jacobMain = do
  putStrLn "__rule34_jacobMain__"
  preview'custom (makeGraph rule34_text) >> putStrLn "< visualise a graph using the Xlib GraphvizCanvas >"
