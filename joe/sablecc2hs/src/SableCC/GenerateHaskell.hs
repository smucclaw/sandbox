----------------------------------------------------------------------------
-- |
-- Module      :  SableCC.GenerateHaskell
-- Copyright   :  (c) Fontaine 2011
-- License     :  BSD3
--
-- Maintainer  :  fontaine@cs.uni-duesseldorf.de
-- Stability   :  experimental
-- Portability :  GHC-only
--
--
-----------------------------------------------------------------------------

{-# Language RecordWildCards #-}
module SableCC.GenerateHaskell
(
generateHaskellTables
)
where

import Prelude hiding ((<>))

import SableCC.XML.ParserDefinitionRaw as Raw
import SableCC.XML.XML2Parser
import SableCC.ParserTypes as Parser
import SableCC.ParserTypes as Lexer

import SableCC.AstDefinition as Ast

import SableCC.ParserDefinition as Parser
import SableCC.LexerDefinition as Lexer

import Data.Array as Array
import Text.PrettyPrint.HughesPJ
import qualified Data.List as List
import qualified Data.Map as Map
import Data.Maybe
import Data.Char as Char

-- | Read the parser tables from an XML file and generate
-- Haskell modules which contain the tables as Haskell sourcecode.
generateHaskellTables :: FilePath -> IO ()
generateHaskellTables xmlFile = do
  putStrLn "reading Parser"
  rawParser <- readParser xmlFile
  let
     parserDefinition = makeParserDefinition rawParser
     astDefinition = makeAstDefinition rawParser
     lexerDefinition = makeLexerDefinition rawParser
{-
  putStrLn "writing MakeUntypedAST.hs"
  writeFile "MakeUntypedAST.hs" $ render
    $ makeUntypedTransformation astDefinition
-}

  putStrLn "writing ParserTables.hs"
  writeFile "ParserTables.hs" $ render $ vcat [
     text "-- autogenerated File do not edit!"
    ,text "module ParserTables where"
    ,text "import SableCC.ParserTypes"
    ,text "import Data.Array as Array"
    ,text "import qualified Data.Map as Map"
    ,text "import SableAst"
    ,text "import SableTokens"
    ,text "import Data.Array"
    ,text "import Data.Dynamic"
    ,text "import Data.Char (chr)"
    ,text "eofTokenID :: Int"
    ,text "eofTokenID =" <+> (int $ parser_parser_eof_index rawParser)
    ,makeLexerTables lexerDefinition
    ,makeParserTables parserDefinition
    ,makeDynamicTransformation astDefinition
    ]

  putStrLn "writing SableAST.hs"
  writeFile "SableAst.hs" $ render $ makeSableAst astDefinition

{-
makeUntypedTransformation :: AstDefinition -> Doc
makeUntypedTransformation astDefinition = vcat [
   text "-- autogenerated File do not edit!"
  ,text "module MakeUntypedAST where"
  ,text "import ParserTypes (PToken, ReductionID (..), CST(..),AST(..)"
  ,text "import Data.Array"
  ,text "-- reduce actions that transform the CST to the AST"
  ,let len = unReductionID $ snd $ bounds $ reductionTable astDefinition
   in text "reduceTable = listArray (ReductionID 0,ReductionID" <+> int len <+> text ") $ reduceActions"
  ,text "cst2ast :: CST -> AST"
  ,text "cst2ast (CstLeaf t) = ASTLeaf t"
  ,text "cst2ast (CstNode reduction list)"
  ,text "  = (reduceTable ! reduction) $ map cst2ast list"
  ,text "reduceActions :: [[AST] -> AST]"
  ,text "reduceActions = ["
  ,nest 4 $ vcat $ punctuate comma $ map mkUntypedRule $ Array.elems $ reductionTable astDefinition
  ,nest 4 $ text "]"
  ]

mkUntypedRule :: Ast.Action -> Doc
mkUntypedRule Action {..} = vcat [
   text "-- rule :" <+> (int $ rule_index actionRule) <+> (text $ rule_ename actionRule)
  ,text "\\[" <> (hcat $ punctuate comma popArgs) <> text "] -> "
  ,nest 4 $ expr actionExpression
  ]
  where
    popArgs = map (text . action_result . unActionArgs)
               $ filter isPopAction $ rule_actions actionRule

    expr :: ActionExpression -> Doc
    expr term = case term of
      Var s -> text s
      EmptyList -> text "ASTList []"
      SingletonList e -> fun "ASTList" [text "[" <+> expr e <+> text "]"]
      AppendNode l n -> fun "ASTList" [fun "(++)" [fun "unASTList" [expr l] , text "[" <+> expr n <+> text "]"]]
      AppendList l1 l2 -> fun "ASTList" [fun "(++)" [fun "unASTList" [expr l1], fun "unASTList" [expr l2]]]
      NewNode prod alt l -> fun "ASTNode"
         [ text $ show $ alt_name alt
         , text "[" <+> (hsep $ punctuate comma $ map expr l) <+> text "]" ]
      FromNode e -> expr e
      FromList e -> fun "head" [fun "unASTList" [expr e]]
      NodeResult e -> expr e
      ListResult e -> fun "ASTList" [text "[" <+> expr e <+> text "]"]
-}

fun :: String -> [Doc] -> Doc
fun name args = vcat [
        text "(" <+> text name
       ,nest 4 $ vcat $ map parens args
       ,text ")"
       ]

makeSableAst :: AstDefinition -> Doc
makeSableAst astDefinition = vcat [
   text "-- generated Module ! DO NOT EDIT"
  ,text "{-# Language DeriveDataTypeable #-}"
  ,text "module SableAst where"
  ,text "import SableTokens"
  ,text "import Data.Data"
  ,makeHaskellDataType $ productions astDefinition
  ]
  where
    makeHaskellDataType :: [Raw.Prod] -> Doc
    makeHaskellDataType = vcat . map makeProd

    makeProd prod =  vcat [
       text "--"
      ,text "data" <+> (text $ tail $ prod_ename prod)
      ,nest 4 $ vcat $ zipWith makeAlt (prod_alt prod) ("=" : repeat "|")
      ,nest 4 $ text "deriving (Typeable,Data,Show)"
      ]
    makeAlt alt seperator
      = text seperator <+> (text $ tail $ alt_ename alt) <+> (hsep $ map makeElem $ alt_elem alt)
    makeElem elem = case (elem_modifier elem, elem_is_list elem) of
       (Just "*", True ) -> text "[" <+> body <+> text "]"
       (Just "?", False) -> parens (text "Maybe" <+> body)
       (Nothing , False) -> text "!" <> body
       x -> error $ "makeElem: unexpected combination of modifier and islist : " ++ show x
     where body = text $ tail $ elem_etype elem

makeDynamicTransformation :: AstDefinition -> Doc
makeDynamicTransformation astDefinition = vcat [
   text "-- reduce actions that transform the CST to a AST data type"
  ,text "-- this works with data dynamic"
  ,text "data DAst"
  ,text "  = DLeaf PToken"
  ,text "  | DNode !Dynamic"
  ,text "  | DList [DAst]"
  ,text "  deriving (Show)"

  ,text "fromDList :: DAst -> [DAst]"
  ,text "fromDList (DList l) = l"
  ,text "fromDList e = error \"fromDList : not DList\""

  ,text "fromDNode :: Typeable t => DAst -> t"
  ,text "fromDNode (DNode l) = fromDyn l (error \"fromDNode\")"
  ,text "fromDNode (DLeaf l) = fromToken l"
  ,text "fromDNode e = error \"fromDNode : not DLeaf or DNode\""

  ,text "toDNode :: Typeable t => t -> DAst"
  ,text "toDNode = DNode . toDyn"
  ,text "reduceTable = listArray (ReductionID 0,ReductionID $ (length reduceActions) -1) reduceActions"
  ,text "cst2ast :: CST -> DAst"
  ,text "cst2ast (CstLeaf t) = DLeaf t"
  ,text "cst2ast (CstNode reduction list)"
  ,text "  = (reduceTable ! reduction) $ map cst2ast list"
  ,text "reduceActions :: [[DAst] -> DAst]"
  ,text "reduceActions = ["
  ,nest 4 $ vcat $ punctuate comma $ map mkDynRule $ Array.elems $ reductionTable astDefinition
  ,nest 4 $ text "]"
  ]


mkDynRule :: Ast.Action -> Doc
mkDynRule Action {..} = vcat [
   text "-- rule :" <+> (int $ rule_index actionRule) <+> (text $ rule_ename actionRule)
  ,text "\\[" <> (hcat $ punctuate comma popArgs) <> text "] -> "
  ,nest 4 $ expr actionExpression
  ]
  where
    popArgs = map (text . action_result . unActionArgs)
               $ filter isPopAction $ rule_actions actionRule

    expr :: ActionExpression -> Doc
    expr term = case term of
      Var s -> text s
      EmptyList -> text "DList []"
      SingletonList e -> fun "DList" [text "[" <+> expr e <+> text "]"]
      AppendNode l n -> fun "DList" [fun "(++)" [fun "fromDList" [expr l] , text "[" <+> expr n <+> text "]"]]
      AppendList l1 l2 -> fun "DList" [fun "(++)" [fun "fromDList" [expr l1], fun "fromDList" [expr l2]]]
      NewNode prod alt l -> fun "toDNode" [ fun (tail $ alt_ename alt) $ zipWith mkChild l (alt_elem alt)]
      FromNode e -> expr e
      FromList e -> fun "head" [fun "fromDList" [expr e]]
      NodeResult e -> expr e
      ListResult e -> fun "DList" [text "[" <+> expr e <+> text "]"]
--      ResultNothing -> text "Nothing"
      where
        mkChild :: ActionExpression -> Raw.Elem -> Doc
        mkChild e elem = case (e, elem_is_list elem, elem_modifier elem) of
          (_ , True, Just "*") -> fun "map" [fun "fromDNode" [], fun "fromDList" [expr e]]
          (ResultNothing,False, Just "?") -> text "Nothing"
          (_, False, Just "?") -> fun "Just" [fun "fromDNode" [expr e]]
          (_, False, Nothing ) -> fun "fromDNode" [expr e]
          combination -> error $ "GenerateHaskell expr" ++ show combination


makeLexerTables :: LexerDefinition -> Doc
makeLexerTables lexerDefinition = vcat [
   text "tokenIDMap :: Map.Map Int Int"
  ,text "tokenIDMap = Map.fromList ["
  ,nest 4 $ hcat $ punctuate comma $ flip mapMaybe (Array.assocs $ lexerTokens lexerDefinition)
             $ \(LexTokenID tokenID,token) -> do
                 parserID <- token_parser_index token
                 return $ text $ show (tokenID,parserID)
  ,nest 4 $ text "]"
  ,text "lexerModes = listArray" <+> modeBounds <+> hsList modeNames
  ,vcat $ map makeModeDef $ Array.assocs $ lexerModes lexerDefinition
  ,text "modeTransitions = listArray" <+> transitionBounds <+> (hsList $ map makeModeID $
      Array.elems $ modeTransitions lexerDefinition)
  ]
  where
    modeBounds = parens (makeModeID minMode <+> comma <+> makeModeID maxMode)
    (minMode,maxMode) = Array.bounds $ lexerModes lexerDefinition
    hsList x = text "[" <+> (hsep $ punctuate comma x) <+> text "]"
    modeNames = map (\(ModeID x) -> text "mode_"<> int x) $ Array.indices $ lexerModes lexerDefinition 

    makeModeDef :: (ModeID, (String, Lexer.Mode)) -> Doc
    makeModeDef (ModeID modeID,(modeName, Lexer.Mode mode)) = vcat [
      text "mode_" <> int modeID <+> text "= (,)" <+> (text $ show modeName) <+> text "$ Mode $ listArray"
        <+> stateBounds <+> text "["
        ,nest 4 $ vcat $ punctuate comma $ map makeState $ Array.elems mode
        ,nest 4 $ text "]"
        ]
      where
        (LexStateID minState, LexStateID maxState) = Array.bounds mode
        stateBounds = text "( LexStateID" <+> int minState <+> text ", LexStateID" <+> int maxState <+> text ")"

    makeStateID (LexStateID stateID) = hFun "LexStateID" [int stateID]
    makeModeID (ModeID modeID) = hFun "ModeID" [int modeID]

    makeState :: Lexer.State -> Doc
    makeState state = vcat [
       text "(State"
      ,nest 4 $ makeIntervalTree $ stateTransitions state
      ,nest 4 $ case stateAcceptedToken state of
         Nothing -> text "Nothing)"
         Just (LexTokenID tok) -> text "(Just (LexTokenID" <+> int tok <+> text ")))"
      ]
    makeIntervalTree IntervalLeaf = text "IntervalLeaf"
    makeIntervalTree (IntervalNode lowTree lowChar target highChar highTree) = hFun "IntervalNode" [
       makeIntervalTree lowTree
      ,makeChar lowChar
      ,case target of
        Epsilon (stateID) -> hFun "Epsilon" [makeStateID stateID]
        NotEpsilon (stateID) -> hFun "NotEpsilon" [makeStateID stateID]
      ,makeChar highChar
      ,makeIntervalTree highTree
      ]
      where
        makeChar x = hFun "chr" [int $ Char.ord x]

    transitionBounds = parens (transIndex minTransition <+> comma <+> transIndex maxTransition)
      where
        (minTransition,maxTransition) = Array.bounds $ modeTransitions lexerDefinition
        transIndex (LexTokenID tok, mode) = parens (
          fun "LexTokenID" [int tok] <+> comma <+> makeModeID mode)

hFun :: String -> [Doc] -> Doc
hFun name args = parens (text name <+> hsep args)


makeParserTables :: ParserDefinition -> Doc
makeParserTables parserDefinition = vcat [
   text "actionTable = listArray" <+> actionTableBounds <+> text "["
  ,nest 4 $ vcat $ punctuate comma $ map makeTransitionList $ Array.elems $ actionTable parserDefinition
  ,nest 4 $ text "]"
  ,text "gotoTable = listArray" <+> gotoTableBounds <+> text "["
  ,nest 4 $ vcat $ punctuate comma $ map makeGotoMap $ Array.elems $ gotoTable parserDefinition
  ,nest 4 $ text "]"
  ,text "errorTable = listArray" <+> errorTableBounds <+> text "["
  ,nest 4 $ vcat $ punctuate comma $ map (text . show) $ Array.elems $ errorTable parserDefinition
  ,nest 4 $ text "]"
  ]
  where
    actionTableBounds = parens (text "ParserStateID" <+> int minStateID
                            <+> comma <+> text "ParserStateID" <+> int maxStateID)
      where
         (ParserStateID minStateID, ParserStateID maxStateID) = Array.bounds $ actionTable parserDefinition
    gotoTableBounds = parens (text "GotoIndex" <+> int minGotoID <+> comma <+> text "GotoIndex" <+> int maxGotoID)
      where
         (GotoIndex minGotoID, GotoIndex maxGotoID) = Array.bounds $ gotoTable parserDefinition

    errorTableBounds = parens (text "ErrorID" <+> int minErrorID <+> comma <+> text "ErrorID" <+> int maxErrorID)
      where
         (ErrorID minErrorID, ErrorID maxErrorID) = Array.bounds $ errorTable parserDefinition

    makeTransitionList :: TransitionList -> Doc
    makeTransitionList (TransitionList {..})
      = fun "TransitionList" [makeAction defaultTransition
         , text "Map.fromList [" <+> (hsep $ punctuate comma $ map makeTrans $ Map.assocs transitionMap) <+> text "]"]

    makeAction :: Parser.Action -> Doc
    makeAction action = case action of
      (Shift (ParserStateID stateID)) -> hFun "Shift" [hFun "ParserStateID" [int stateID]]
      (Reduce (Reduction {..})) -> hFun "Reduce" [ fun "Reduction" [
          hFun "ReductionID" [int $ unReductionID reductionID]
         ,int popCount
         ,hFun "GotoIndex" [int $ unGotoIndex gotoIndex]
         ]]
      (Error (ErrorID errorID)) -> hFun "Error" [hFun "ErrorID" [int errorID]]
      Accept -> text "Accept"

    makeTrans :: (ParserTokenID, Parser.Action) -> Doc
    makeTrans (ParserTokenID tokenID, action)
      = parens (text "ParserTokenID" <+> int tokenID <+> comma <+> makeAction action)


    makeGotoMap :: GotoMap -> Doc
    makeGotoMap (GotoMap {..}) = fun "GotoMap" [
        fun "ParserStateID" [int $ Parser.fromParserStateID defaultGoto]
       ,fun "Map.fromList" [hsep [
           text "["
          ,hsep $ punctuate comma $ map stPair $ Map.assocs gotoMap
          ,text "]" ]]
      ]
      where stPair (ParserStateID a, ParserStateID b)
               = parens (text "ParserStateID" <+> int a <+> comma <+> text "ParserStateID" <+> int b)

{-
alternative translation without Dynamic.
this does not work, because Sable does not give us enough information in the XML file
(todo: patch sable or do a complete sable-reimplementation in Haskell?
-}
makeStackTransformation :: AstDefinition -> Doc
makeStackTransformation astDefinition = vcat [
   text "-- reduce actions that transform the stack for the LR-Automaton"
  ,makeStackType astDefinition
  ,text "reduceActions :: [NodeStack -> NodeStack]"
  ,text "reduceActions = ["
  ,nest 4 $ vcat $ punctuate comma $ map mkStackRule $ Array.elems $ reductionTable astDefinition
  ,nest 4 $ text "]"
  ]
  where
    makeStackType :: AstDefinition -> Doc
    makeStackType astDefinition = vcat [
       text "-- NodeStack is a heterogenous linkes list"
      ,text "data NodeStack"
      ,nest 4 $ text "= EmptyNodeStack"
      ,nest 4 $ vcat $ map makeAlt $ productions astDefinition
      ,nest 4 $ text "deriving (Show)"
      ]
    makeAlt :: Raw.Prod -> Doc
    makeAlt prod = vcat [
       hsep [text "|", text "SN_" <> typeName, text "!" <> typeName, text "!NodeStack"]
      ,hsep [text "|", text "SL_" <> typeName, text "[", typeName, text "]",text "!NodeStack"]
      ]
      where typeName = text $ tail $ prod_ename prod


mkStackRule :: Ast.Action -> Doc
mkStackRule Action {..} = vcat [
   text "-- rule :" <+> (int $ rule_index actionRule) <+> (text $ rule_ename actionRule)
  ,text "\\[" <> (hcat $ punctuate comma popArgs) <> text "] -> "
  ,nest 4 $ expr actionExpression
  ]
  where
    popArgs = map (text . action_result . unActionArgs)
               $ filter isPopAction $ rule_actions actionRule

    expr :: ActionExpression -> Doc
    expr term = case term of
      Var s -> text s
      EmptyList -> text "[]"
      SingletonList e -> text "[" <+> expr e <+> text "]"
      AppendNode l n -> fun "(++)" [expr l , text "[" <+> expr n <+> text "]"]
      AppendList l1 l2 -> fun "(++)" [expr l1, expr l2]
      NewNode prod alt l -> fun (tail $ alt_ename alt) $ zipWith mkChild l (alt_elem alt)
      FromNode e -> expr e
      FromList e -> fun "head" [expr e]
      NodeResult e -> expr e
      ListResult e -> text "[" <+> expr e <+> text "]"
--      ResultNothing -> text "Nothing"
      where
        mkChild :: ActionExpression -> Raw.Elem -> Doc
        mkChild e elem = case (e, elem_is_list elem, elem_modifier elem) of
          (_ , True, Just "*") -> expr e
          (ResultNothing,False, Just "?") -> text "Nothing"
          (_, False, Just "?") -> fun "Just" [expr e]
          (_, False, Nothing ) -> expr e
          combination -> error $ "GenerateHaskell expr" ++ show combination