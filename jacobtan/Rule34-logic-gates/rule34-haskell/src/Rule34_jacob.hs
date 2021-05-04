{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE ViewPatterns #-}
module Rule34_jacob where

import Utils ( foldl', (&), (<&>), (>>>), show', (!) )
import qualified Data.Map.Strict as Map
import Data.Text (Text)
import qualified Data.Text as Text
import qualified Data.Bifunctor
import qualified Data.Set
import Data.Maybe as Maybe

import Data.Tree

import Rule34 (rule34_1, Label(..), MyRule(..), ConditionTree, Condition(..), Predicate, Inner(..), Deontic(..))

import Data.Graph.Inductive.Graph (mkGraph, nmap)
import Data.Graph.Inductive.PatriciaTree (Gr)

import Encoding ( GateType(..) )
import Graphviz (preview, preview'custom)

import Debug.Trace

data ParaRef = PMustNot | PMay | PMustNotBulb | PMayBulb
  | P341 | P341a | P341b | P341c | P341d | P341e | P341f
  | P342 | P343 | P344 | P345 | P346 | P347
  | P'NotLocum | P'BusinessEntity'NotLawRelated | P'2ndSchedule
  | P'IsLocum | P341a'P341c_tIf
  | P'3rdSchedule
  | P' Text
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
  deriving (Eq, Show)

outputBulbs =
  [ Stmt PMustNotBulb "Must Not (bulb)" Bulb [PMustNot] [] [] []
  , Stmt PMustNot "Must Not" OR [] [] [] []
  , Stmt PMayBulb "May (bulb)" Bulb [PMay] [] [] []
  , Stmt PMay "May" OR [] [] [] []
  ]

-- | encoding of the legal text
rule34_text :: [Statement]
rule34_text = outputBulbs ++ init [

  --- ^ PMustNot originally uses a "Buffer" logic gate due to having only 1 input.
  ---     But OR is probably more appropriate because another rule that appears
  ---     later may also output to PMustNot.
  ---       (An OR gate with 1 input still makes sense.)

  Stmt P341 "34.1 associated with bad business" OR [P341a, P341b, P341c, P341d, P' "341e", P' "341f"] [PMustNot] [] [],
  Stmt P341a "34.1a undignified" Switch [] [] [] [],
  Stmt P341b "34.1b materially interferes" Switch [] [] [] [],
  Stmt P341c "34.1c unfairly attractive" Switch [] [] [] [],
  Stmt P341d "34.1d fee sharing" Switch [] [] [] [],
  Stmt (P' "341e") "34.1e GOTO 1st Schedule" Switch [] [] [] [],
  mkStmt "34.1f" "otherwise prohibited" Switch [] [] [] [],

  Stmt P342 "34.2 connected [see sub conditions]" Switch [] [PMay] [P341] [],
  Stmt P343 "34.3 Law-related, i.e. 4th schedule" Switch [] [PMay] [P341] [],

  Stmt P344 "34.4" AND [P'NotLocum, P'BusinessEntity'NotLawRelated, P'2ndSchedule] [PMay] [P341] [],
  Stmt P'NotLocum "not locum" Switch  [] [] [] [],
  Stmt P'BusinessEntity'NotLawRelated "business entity\nnot law-related" Switch [] [] [] [],
  Stmt P'2ndSchedule "2nd schedule" Switch [] [] [] [],

  Stmt P345 "34.5" AND [P'IsLocum, P'BusinessEntity'NotLawRelated, P'2ndSchedule] [PMay] [P341a'P341c_tIf] [P341b],
  Stmt P341a'P341c_tIf "34.1a, 34.1c-f" OR [P341a, P341c, P341d, P' "341e", P' "341f"] [] [] [],
  Stmt P'IsLocum "is locum" Switch [] [] [] [],

  Stmt P346 "34.6" NOR [P342, P343, P344, P345] [PMustNot] [] [],

  Stmt P347 "34.7" Buffer [P'3rdSchedule] [PMay] [] [PMustNot],
  Stmt P'3rdSchedule "3rd schedule" Switch [] [] [] [],

  Stmt undefined undefined undefined undefined undefined undefined undefined
  --- ^ for trailing commas. Used with the @init@ function.
  ]

mkStmt :: Text -> Text -> GateType -> [ParaRef] -> [ParaRef] -> [ParaRef] -> [ParaRef] -> Statement
mkStmt sPN sPT = Stmt (P' $ label2ref sPN) sPT

label2ref x = Text.filter (/= '.') $ Text.takeWhile (/= ' ') x

-- | check that all pointers used are defined
validateStatements :: Foldable t => t Statement -> t Statement
validateStatements statements = if null missingDefinitions
    then statements
    else error $ "*** Error *** these are used but not defined: " ++ show (Data.Set.toAscList missingDefinitions)
  where
    missingDefinitions = Data.Set.difference (Data.Set.fromList usedSet) (Data.Set.fromList definedSet)
    (definedSet, usedSet) = foldl' f ([],[]) statements
    f (defined, used) Stmt{ sParaRef, sInputs, sOutputs, sSubjectTo, sDespite }
      = (sParaRef : defined, sInputs ++ sOutputs ++ sSubjectTo ++ sDespite ++ used)

-- | Int represents node index
data MakeGraphState = MGState {
  mgsOutPointers :: Map.Map ParaRef Int,
  --- ^ OutPointers: a paragraph is originally represented as a single logic gate.
  ---     But defeasibility rewriting may add additional gates on top. So the gate
  ---     giving the output may change. Output pointers are used to keep track.
  mgsInPointers :: Map.Map ParaRef Int,
  --- ^ InPointers: keep track of the logic gate responsible for handling the inputs of a
  ---     "paragraph". Currently, this looks useful only for "Must Not" and "May".
  ---     E.g. "Must Not" might get defeated and its output gate changes. But later on
  ---     another paragraph might want to output to it (i.e. connect to its input).
  ---     Useful in the hypothetical scenario that para 7 is written before para 6.
  ---     * In my present understanding, input pointers are not expected to be modified
  ---         by any rewriting.
  mgsNodes :: [(Int, GateType, Text)], -- Text is node label
  mgsEdges :: [(Output, Input)],
  mgsCounter :: Int }

data Input = IRef ParaRef | I Int
data Output = ORef ParaRef | O Int

--- *** warning *** The Haskel langauge extension NamedFieldPuns can be confusing for the uninitiated.
---   cf. https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/record_puns.html
makeGraph1 :: [Statement] -> MakeGraphState
makeGraph1 (validateStatements -> statements) =
  foldl' f0 (MGState mempty mempty [] [] 0) statements
  & \state1 -> foldl' f1 state1 statements
  where
    -- | First pass: create logic gates, without defeasibility
    f0 :: MakeGraphState -> Statement -> MakeGraphState
    f0 mgsState
      Stmt{ sParaRef, sLabel, sGateType, sInputs, sOutputs, sSubjectTo, sDespite }
      = writeState mgsState
      where
        writeState :: MakeGraphState -> MakeGraphState
        writeState mgsState@MGState{ mgsOutPointers, mgsInPointers, mgsNodes, mgsEdges, mgsCounter }
          = let i = succ mgsCounter in mgsState{
            mgsOutPointers = Map.insert sParaRef i mgsOutPointers,
            mgsInPointers = Map.insert sParaRef i mgsInPointers,
            mgsNodes = (i, sGateType, sLabel) : mgsNodes,
            mgsEdges = fmap (, IRef sParaRef) (ORef <$> sInputs) -- connect to inputs
              ++ fmap (ORef sParaRef ,) (IRef <$> sOutputs) -- connect to outputs
              ++ mgsEdges,
            mgsCounter = i
            }
    -- | Second pass: defeasibility rewrites
    f1 :: MakeGraphState -> Statement -> MakeGraphState
    f1 mgsState
      Stmt{ sParaRef, sLabel, sGateType, sInputs, sOutputs, sSubjectTo, sDespite }
      = mgsState & rewriteSubjectTo & rewriteDespite
      where
        -- | defeasibility rewrite for "subject to"
        rewriteSubjectTo stateAfterInit@MGState{ mgsCounter, mgsOutPointers } =
          if null sSubjectTo then stateAfterInit
          else foldl' g (stateAfterInit & addAND) sSubjectTo
          where
            oldParaIndex = mgsOutPointers ! sParaRef
            andNodeIndex = succ mgsCounter
            addAND :: MakeGraphState -> MakeGraphState
            addAND mgsState@MGState{ mgsOutPointers, mgsNodes, mgsEdges, mgsCounter }
              = mgsState{
                  mgsNodes = (andNodeIndex, AND, show' sParaRef <> " with defeasibility") : mgsNodes,
                  mgsCounter = andNodeIndex,
                  mgsOutPointers = Map.insert sParaRef andNodeIndex mgsOutPointers,
                  mgsEdges = (O oldParaIndex, I andNodeIndex) : mgsEdges
                  }
            g :: MakeGraphState -> ParaRef -> MakeGraphState
            g mgsState@MGState{ mgsOutPointers, mgsNodes, mgsEdges, mgsCounter } subjectTo
              = let j = succ mgsCounter in mgsState {
                  mgsNodes = (j, NOT, show' sParaRef <> " subject to " <> show' subjectTo) : mgsNodes,
                  mgsCounter = j,
                  mgsEdges = (ORef subjectTo, I j) : (O j, I andNodeIndex) : mgsEdges
                  }
        -- | defeasibility rewrite for "despite"
        rewriteDespite stateAfterRewriteSubjectTo@MGState{ mgsCounter, mgsOutPointers } =
          if null sDespite then stateAfterRewriteSubjectTo
          else foldl' h stateAfterRewriteSubjectTo sDespite
          where
            h :: MakeGraphState -> ParaRef -> MakeGraphState
            h mgsState@MGState{ mgsOutPointers, mgsNodes, mgsEdges, mgsCounter } despite
              = mgsState {
                  mgsNodes = andNode : notNode : mgsNodes,
                  mgsCounter = k2,
                  mgsEdges = andEdgeToDespite : notEdgeToAnd : notEdgeToPara : mgsEdges,
                  mgsOutPointers = reassignPointer
                  }
              where
                k1 = succ mgsCounter
                andNode = (k1, AND, show' despite <> " with defeasibility")
                andEdgeToDespite = (O $ mgsOutPointers ! despite, I k1)
                k2 = succ k1
                notNode = (k2, NOT, show' sParaRef <> " despite " <> show' despite)
                notEdgeToAnd = (O k2, I k1)
                notEdgeToPara = (ORef sParaRef, I k2)
                reassignPointer = Map.insert despite k1 mgsOutPointers

makeGraph2 :: MakeGraphState -> Gr (GateType, Text) Text
makeGraph2 MGState{ mgsOutPointers, mgsInPointers, mgsNodes, mgsEdges } =
  mkGraph @Gr (mgsNodes <&> makeNode) (mgsEdges <&> makeFinalEdge <&> \(x,y) -> (x,y,"" :: Text))
  where
    makeNode :: (Int, GateType, Text) -> (Int, (GateType, Text))
    makeNode (i, gateType, label) =
      (i, (gateType, label))
    makeFinalEdge :: (Output, Input) -> (Int, Int)
    makeFinalEdge = Data.Bifunctor.bimap
      (\case
        O i -> i
        ORef oParaRef -> mgsOutPointers ! oParaRef)
      (\case
        I o -> o
        IRef iParaRef -> mgsInPointers ! iParaRef)

makeGraph3 = nmap makeGraphVizNodeLabel
  where
    makeGraphVizNodeLabel (gateType, label) =
      show' gateType <> ": " <> label

makeGraph :: [Statement] -> Gr (GateType, Text) Text
makeGraph = makeGraph1 >>> makeGraph2

makeGraphViz :: [Statement] -> Gr Text Text
makeGraphViz = makeGraph1 >>> makeGraph2 >>> makeGraph3

preview1 :: IO ()
preview1 = preview (makeGraphViz rule34_text) >> putStrLn "< visualise a graph using the Xlib GraphvizCanvas >"
  
preview2 :: IO ()
preview2 = preview'custom (makeGraphViz rule34_text) >> putStrLn "< visualise a graph using the Xlib GraphvizCanvas >"

rule34_jacobMain :: IO ()
rule34_jacobMain = do
  putStrLn "__rule34_jacobMain__"
  preview1
  preview2

importGraph :: Gr Text Text
importGraph = makeGraph (outputBulbs ++ myruleToStm rule34_1)

myruleToStm :: MyRule -> [Statement]
myruleToStm r =
  let mystmts = myConditionToStm (deontic2PR $ deontic r) $ condition r
  in traceShow mystmts mystmts

deontic2PR :: Deontic -> [ParaRef]
deontic2PR MustNot = [PMustNot]
deontic2PR May = [PMay]

myConditionToStm :: [ParaRef] -> ConditionTree Predicate -> [Statement]
myConditionToStm sOutputs ctp =
  let (MkCondition l pre innerpred post) = rootLabel ctp
      labeledChildren = filter (\c ->  (Maybe.isJust . pncr) c &&
                                       (Maybe.isJust . ptcr) c) (subForest ctp)
      conditionRefs = Maybe.fromJust . pncr <$> labeledChildren
      mygate = if length labeledChildren > 0 then myInnerToGate innerpred else Switch
      mylabel = P' (label2ref . Text.pack . fromJust . pncr $ ctp)
      mystmt = mkStmt
               (Text.pack $ Maybe.fromJust $ pncr ctp)
               (Text.pack $ Maybe.fromJust $ ptcr ctp)
               mygate (P' . label2ref . Text.pack <$> conditionRefs) sOutputs [] []
      mychildren = concatMap (myConditionToStm sOutputs) labeledChildren
  in
    traceShow (pre, innerpred, post, mygate) (mystmt : mychildren)
  where cr = clabel . rootLabel
        pncr = paraNum . cr
        ptcr = predTerm . cr
     

myInnerToGate :: Inner Predicate -> GateType
myInnerToGate Any        = OR
myInnerToGate Or         = OR
myInnerToGate Union      = OR
myInnerToGate UnionComma = OR
myInnerToGate All        = AND
myInnerToGate Compl      = AND
myInnerToGate (Leaf _)   = Switch
