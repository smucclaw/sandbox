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
import Data.GraphViz (preview)

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

  Stmt undefined undefined undefined undefined undefined undefined 
  ]

-- pointers :: Map.Map ParaRef Int
-- pointers = mempty

-- | Int represents node index
data MakeGraphState = MGState {
  mgsPointers :: Map.Map ParaRef Int,
  mgsEdges :: [(ParaRef, Int)] }

makeGraph :: [Statement] -> MakeGraphState
makeGraph statements = statements
  & zip [0..]
  & foldl f (MGState mempty [])
  where
    f :: MakeGraphState -> (Int, Statement) -> MakeGraphState
    f mgsState@MGState{ mgsPointers, mgsEdges } (i, Stmt {sParaRef, sInputs}) =
      mgsState{
        mgsPointers = Map.insert sParaRef i mgsPointers,
        mgsEdges = mgsEdges ++ fmap (,i) sInputs
        }

makeGraph2 :: MakeGraphState -> [(Int, Int)]
makeGraph2 MGState{ mgsPointers, mgsEdges } = mgsEdges <&>
    -- \(paraRef, int) -> (pointers Map.! paraRef, int) -- replaced with hlint suggestion
    Data.Bifunctor.first (mgsPointers Map.!) -- hlint suggested this

makeNodes :: [Statement] -> [(Int, Text)]
makeNodes statements = statements
  <&> (\Stmt{ sLabel, sGateType } ->
    (Text.pack . show) sGateType <> ": " <> sLabel)
  & zip [0..]

makeGraph3 :: [Statement] -> Gr Text Text
makeGraph3 statements =
  mkGraph @Gr (makeNodes statements) (statements & makeGraph & makeGraph2 <&> \(x,y) -> (x,y,"" :: Text))

rule34_jacobMain :: IO ()
rule34_jacobMain = do
  putStrLn "__rule34_jacobMain__"
  preview (makeGraph3 rule34_text) >> putStrLn "< visualise a graph using the Xlib GraphvizCanvas >"
