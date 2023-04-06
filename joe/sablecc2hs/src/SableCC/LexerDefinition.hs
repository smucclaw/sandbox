----------------------------------------------------------------------------
-- |
-- Module      :  SableCC.LexerDefinition
-- Copyright   :  (c) Fontaine 2011
-- License     :  BSD3
--
-- Maintainer  :  fontaine@cs.uni-duesseldorf.de
-- Stability   :  experimental
-- Portability :  GHC-only
--
-- Highlevel definition of SableCC lexer tables.
--
-----------------------------------------------------------------------------

{-# LANGUAGE GeneralizedNewtypeDeriving,RecordWildCards #-}
module SableCC.LexerDefinition
(
  LexerDefinition (..)
  ,makeLexerDefinition
)
where

import SableCC.ParserTypes
import SableCC.XML.ParserDefinitionRaw as Raw
import SableCC.XML.XML2Parser
import Data.Array as Array

import Data.List as List

data LexerDefinition = LexerDefinition {
   lexerModes :: Modes
  ,lexerTokens :: Array LexTokenID Token
  ,modeTransitions :: Array (LexTokenID,ModeID) ModeID
  }

-- | Translate the low-lever parser definition to a higher-level lexer definition.
makeLexerDefinition :: Raw.Parser -> LexerDefinition
makeLexerDefinition Parser {..} = LexerDefinition {..}
  where
    Lexer_Data {..} = parser_lexer_data
    numberOfTokens = length parser_tokens
    numberOfModes  = length $ lexer_modeNames
    mkArray :: Ix i => (Int -> i) -> [e] -> Array i e
    mkArray iType elems = listArray (iType 0, iType $ length elems -1 ) elems

    lexerModes = mkArray ModeID $ makeModes parser_lexer_data

    makeModes Lexer_Data {..} = zipWith3 makeMode lexer_modeNames lexer_accept_table lexer_goto_table
    makeMode :: (LexerModeName,Int) -> [Int] -> [[Lexer_Goto]] -> (ModeName, Mode)
    makeMode (name,_) acceptedStates gotoList
      = (name, Mode $ mkArray LexStateID $ zipWith makeState acceptedStates gotoList)

    makeState :: Int -> [Lexer_Goto] -> State
    makeState token transitions
       = State {
          stateAcceptedToken = if token == -1 then Nothing else Just $ LexTokenID token
         ,stateTransitions = mkIntervalTree $ map mkLexerGoto transitions
         }
       where
         mkLexerGoto :: Lexer_Goto -> (Char, TransitionTarget, Char)
         mkLexerGoto Lexer_Goto{..} = (toEnum lexer_goto_low, mkTransitionTarget lexer_goto_state, toEnum lexer_goto_high)


    mkTransitionTarget :: Int -> TransitionTarget
    mkTransitionTarget x | x >=0  = NotEpsilon $ LexStateID x
    mkTransitionTarget (-1)       = error "illegal TransitionTarget in mkTransitionTarget"
    mkTransitionTarget x | x < -1 = Epsilon $ LexStateID $ -2 -x

    lexerTokens = mkArray LexTokenID parser_tokens

    modeTransitions = transitionsIdentety // (concat $ zipWith collectModeTransitions [LexTokenID 0 ..] parser_tokens)
      where
        transitionsIdentety = array ((LexTokenID 0,ModeID 0),(LexTokenID (numberOfTokens -1), ModeID (numberOfModes-1)))
            [((LexTokenID t,ModeID m),ModeID m) | t <- [0 .. numberOfTokens-1], m <- [0 .. numberOfModes-1]]
        collectModeTransitions :: LexTokenID -> Token -> [((LexTokenID,ModeID),ModeID)]
        collectModeTransitions tokenID token
          = map (\(fromName,toName) -> ((tokenID, resolveModeName fromName),resolveModeName toName))
                (token_transitions token)
        resolveModeName :: String -> ModeID
        resolveModeName name = case List.lookup name lexer_modeNames of
          Nothing -> error $ "unknown lexermode : " ++ name
          Just i -> ModeID i

mkIntervalTree :: [(Char, TransitionTarget, Char)] -> IntervalTree
mkIntervalTree [] = IntervalLeaf
mkIntervalTree iList = mkNode 1 len
  where
    len = length iList
    table = listArray (1,len) iList
    mkNode low high | high < low = IntervalLeaf
    mkNode low high | low == high
        = IntervalNode IntervalLeaf lowChar state highChar IntervalLeaf
      where (lowChar,state,highChar) = table ! low
    mkNode low high
        = IntervalNode
            (mkNode low $ middle -1)
            lowChar state highChar
            (mkNode (middle +1) high)
      where
        (lowChar,state,highChar) = table ! middle
        middle = (low + high) `div` 2
