----------------------------------------------------------------------------
-- |
-- Module      :  SableCC.ParserDefinition
-- Copyright   :  (c) Fontaine 2011
-- License     :  BSD3
--
-- Maintainer  :  fontaine@cs.uni-duesseldorf.de
-- Stability   :  experimental
-- Portability :  GHC-only
--
-- Highlevel definition of SableCC parser tables.
--
-----------------------------------------------------------------------------
{-# LANGUAGE GeneralizedNewtypeDeriving, RecordWildCards #-}
module SableCC.ParserDefinition
(
  makeParserDefinition
 ,ParserDefinition (..)
 ,trimTokens -- where to put this ?
)
where

import qualified SableCC.XML.ParserDefinitionRaw as Raw
import SableCC.XML.ParserDefinitionRaw hiding (Action)
import SableCC.ParserTypes

import Data.Array as Array
import Data.List as List
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Maybe

data ParserDefinition = ParserDefinition {
   actionTable :: ActionTable
  ,gotoTable :: GotoTable
  ,errorTable :: Array ErrorID String
  ,initialStack :: [(ParserStateID, CST)]
  }

-- | Translate the low-level parser definition to a higher-level format
makeParserDefinition :: Raw.Parser -> ParserDefinition
makeParserDefinition rawParser = ParserDefinition {..}
  where
    actionTable = makeActionTable rawParser
    gotoTable   = makeGotoTable rawParser
    errorTable = mkArray ErrorID $ parser_error_messages
                   $ parser_parser_data rawParser
    initialStack = [(ParserStateID 0, error "dummy CST of initial parserStack")]

mkArray :: Ix i => (Int -> i) -> [e] -> Array i e
mkArray iType elems = listArray (iType 0, iType $ length elems -1 ) elems

makeGotoTable :: Raw.Parser -> GotoTable
makeGotoTable parser
  = mkArray GotoIndex $ map mkList $ parser_goto_table $ parser_parser_data parser
  where
    mkList ((-1,defaultVal):rest) = GotoMap {
       defaultGoto = ParserStateID defaultVal
      ,gotoMap = Map.fromList $ map (\(a,b) -> (ParserStateID a,ParserStateID b)) rest
      }
    mkList _ = error "mkList unexpected format in goto-list"

makeActionTable :: Raw.Parser -> ActionTable
makeActionTable rawParser
  = mkArray ParserStateID $ map mkTransitionList $ parser_action_table $ parser_parser_data rawParser
  where
    mkTransitionList :: [Raw.ParserAction] -> TransitionList
    mkTransitionList [] = error "empty transitionList"
    mkTransitionList (h:rest) = TransitionList {
       defaultTransition = snd $ mkTransition h
      ,transitionMap = Map.fromList $ map mkTransition rest
      }

    mkTransition :: Raw.ParserAction -> (ParserTokenID, Action)
    mkTransition Raw.ParserAction {..}
       = (,) (ParserTokenID action_from) $ case action_action of
          0 -> Shift $ ParserStateID action_to
          1 -> Reduce $ reductionTable ! action_to
          2 -> Accept
          3 -> Error $ ErrorID (errorIndirect ! action_to)

    reductionTable :: Array Int Reduction
    reductionTable = mkArray id $ map mkReduction $ parser_rules rawParser

    errorIndirect = mkArray id $ parser_errors $ parser_parser_data rawParser

    mkReduction :: Raw.Rule -> Reduction
    mkReduction rule = Reduction {
       reductionID = ReductionID $ rule_index rule
      ,popCount    = length $ filter isPopAction $ rule_actions rule
      ,gotoIndex   = GotoIndex $ rule_leftside rule
      }

trimTokens :: Raw.Parser -> [SToken] -> [PToken]
trimTokens rawParser tokens
  = mapMaybe translateToken tokens ++ [parserEof]
  where
    parserEof = (ParserTokenID $ parser_parser_eof_index rawParser,"")
    lexerTokens = mkArray LexTokenID $ parser_tokens rawParser
    translateToken (tokenID,str) = case token_parser_index (lexerTokens ! tokenID) of
      Nothing -> Nothing
      Just i -> Just (ParserTokenID i, str)

