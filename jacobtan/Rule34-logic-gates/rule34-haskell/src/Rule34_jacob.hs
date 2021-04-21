{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE TupleSections #-}
module Rule34_jacob where

import Utils ( foldl', (&), (<&>), (>>>), show' )
import qualified Data.Map.Strict as Map
import Data.Text (Text)
import qualified Data.Text as Text

import Data.Graph.Inductive.Graph (mkGraph)
import Data.Graph.Inductive.PatriciaTree (Gr)

import Encoding ( GateType(..) )
import Graphviz (preview, preview'custom)
import qualified Data.Bifunctor

data ParaRef = PMustNot | PMay | PMustNotBulb | PMayBulb 
  | P341 | P341a | P341b | P341c | P341d | P341e | P341f
  | P342 | P343 | P344 | P345 | P346 | P347
  | P'NotLocum | P'BusinessEntity'NotLawRelated | P'2ndSchedule
  | P'IsLocum | P341a'P341c_to_f
  | P'3rdSchedule
  deriving (Eq, Ord, Show)

data Direction = In | Out deriving (Eq, Ord)

data Statement = Stmt {
  sParaRef :: ParaRef,
  sLabel :: Text,
  sGateType :: GateType,
  sInputs :: [ParaRef],
  sOutputs :: [ParaRef],
  sSubjectTo :: [ParaRef],
  sDespite :: [ParaRef]
}

-- | encoding of the legal text
rule34_text :: [Statement]
rule34_text = init [
  Stmt PMustNotBulb "Must Not (bulb)" Bulb [PMustNot] [] [] [],
  Stmt PMustNot "Must Not" Buffer [] [] [] [],

  Stmt P341 "34.1 associated with bad business" OR [P341a, P341b, P341c, P341d, P341e, P341f] [PMustNot] [] [],
  Stmt P341a "34.1a undignified" Switch [] [] [] [],
  Stmt P341b "34.1b materially interferes" Switch [] [] [] [],
  Stmt P341c "34.1c unfairly attractive" Switch [] [] [] [],
  Stmt P341d "34.1d fee sharing" Switch [] [] [] [],
  Stmt P341e "34.1e GOTO 1st Schedule" Switch [] [] [] [],
  Stmt P341f "34.1f otherwise prohibited" Switch [] [] [] [],

  Stmt PMayBulb "May (bulb)" Bulb [PMay] [] [] [],
  Stmt PMay "May" OR [] [] [] [],

  Stmt P342 "34.2 connected [see sub conditions]" Switch [] [PMay] [P341] [],
  Stmt P343 "34.3 Law-related, i.e. 4th schedule" Switch [] [PMay] [P341] [],

  Stmt P344 "34.4" AND [P'NotLocum, P'BusinessEntity'NotLawRelated, P'2ndSchedule] [PMay] [P341] [],
  Stmt P'NotLocum "not locum" Switch  [] [] [] [],
  Stmt P'BusinessEntity'NotLawRelated "business entity\nnot law-related" Switch [] [] [] [],
  Stmt P'2ndSchedule "2nd schedule" Switch [] [] [] [],
  
  Stmt P345 "34.5" AND [P'IsLocum, P'BusinessEntity'NotLawRelated, P'2ndSchedule] [PMay] [P341a'P341c_to_f] [P341b],
  Stmt P341a'P341c_to_f "34.1a, 34.1c-f" OR [P341a, P341c, P341d, P341e, P341f] [] [] [],
  Stmt P'IsLocum "is locum" Switch [] [] [] [],

  Stmt P347 "34.7" Buffer [P'3rdSchedule] [PMay] [] [PMustNot],
  Stmt P'3rdSchedule "3rd schedule" Switch [] [] [] [],

  Stmt undefined undefined undefined undefined undefined undefined undefined
  --- ^ for trailing commas
  ]

-- | Int represents node index
data MakeGraphState = MGState {
  mgsPointers :: Map.Map ParaRef Int,
  --- ^ A paragraph may be represented by a newer logic gate node
  ---      as @makeGraph@ builds the graph.
  mgsNodes :: [(Int, GateType, Text)], -- Text is node label
  mgsEdges :: [(Input, Output)],
  mgsCounter :: Int }

data Input = IRef ParaRef | I Int
data Output = ORef ParaRef | O Int

makeGraph1 :: [Statement] -> MakeGraphState
makeGraph1 statements = statements
  & foldl' f (MGState mempty [] [] 0)
  where
    f :: MakeGraphState -> Statement -> MakeGraphState
    f mgsState
      Stmt{ sParaRef, sLabel, sGateType, sInputs, sOutputs, sSubjectTo, sDespite }
      = mgsState & initState & rewriteSubjectTo & rewriteDespite
      where
        initState :: MakeGraphState -> MakeGraphState
        initState mgsState@MGState{ mgsPointers, mgsNodes, mgsEdges, mgsCounter }
          = let i = succ mgsCounter in mgsState{
            mgsPointers = Map.insert sParaRef i mgsPointers,
            mgsNodes = (i, sGateType, sLabel) : mgsNodes,
            mgsEdges = fmap (, O i) (sInputs <&> IRef)
              ++ fmap (IRef sParaRef ,) (sOutputs <&> O . (mgsPointers Map.!))
              ++ mgsEdges,
            mgsCounter = i
            }
        -- | defeasibility rewrite for "subject to"
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
                  mgsEdges = (I oldParaIndex, O andNodeIndex) : mgsEdges
                  }
            g :: MakeGraphState -> ParaRef -> MakeGraphState
            g mgsState@MGState{ mgsPointers, mgsNodes, mgsEdges, mgsCounter } subjectTo
              = let j = succ mgsCounter in mgsState {
                  mgsNodes = (j, NOT, show' sParaRef <> " subject to " <> show' subjectTo) : mgsNodes,
                  mgsCounter = j,
                  mgsEdges = (IRef subjectTo, O j) : (I j, O andNodeIndex) : mgsEdges
                  }
        -- | defeasibility rewrite for "despite"
        rewriteDespite stateAfterRewriteSubjectTo@MGState{ mgsCounter, mgsPointers } =
          if null sDespite then stateAfterRewriteSubjectTo
          else foldl' h stateAfterRewriteSubjectTo sDespite
          where
            h :: MakeGraphState -> ParaRef -> MakeGraphState
            h mgsState@MGState{ mgsPointers, mgsNodes, mgsEdges, mgsCounter } despite
              = mgsState {
                  mgsNodes = andNode : notNode : mgsNodes,
                  mgsCounter = k2,
                  mgsEdges = andEdgeToDespite : notEdgeToAnd : notEdgeToPara : mgsEdges,
                  mgsPointers = reassignPointer
                  }
              where
                k1 = succ mgsCounter
                andNode = (k1, AND, show' despite <> " with defeasibility")
                andEdgeToDespite = (I $ mgsPointers Map.! despite, O k1)
                k2 = succ k1
                notNode = (k2, NOT, show' sParaRef <> " despite " <> show' despite)
                notEdgeToAnd = (I k2, O k1)
                notEdgeToPara = (IRef sParaRef, O k2)
                reassignPointer = Map.insert despite k1 mgsPointers

makeGraph2 :: MakeGraphState -> Gr Text Text
makeGraph2 MGState{ mgsPointers, mgsNodes, mgsEdges } =
  mkGraph @Gr (mgsNodes <&> makeNode) (mgsEdges <&> makeFinalEdge <&> \(x,y) -> (x,y,"" :: Text))
  where
    makeNode :: (Int, GateType, Text) -> (Int, Text)
    makeNode (i, gateType, label) =
      (i, show' gateType <> ": " <> label)
    makeFinalEdge :: (Input, Output) -> (Int, Int)
    makeFinalEdge = Data.Bifunctor.bimap
      (\case
        I i -> i
        IRef iParaRef -> mgsPointers Map.! iParaRef)
      (\case
        O o -> o
        ORef oParaRef -> mgsPointers Map.! oParaRef)

makeGraph :: [Statement] -> Gr Text Text
makeGraph = makeGraph1 >>> makeGraph2

rule34_jacobMain :: IO ()
rule34_jacobMain = do
  putStrLn "__rule34_jacobMain__"
  preview (makeGraph rule34_text) >> putStrLn "< visualise a graph using the Xlib GraphvizCanvas >"
  preview'custom (makeGraph rule34_text) >> putStrLn "< visualise a graph using the Xlib GraphvizCanvas >"
