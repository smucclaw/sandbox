----------------------------------------------------------------------------
-- |
-- Module      :  SableCC.ParserTypes
-- Copyright   :  (c) Fontaine 2011
-- License     :  BSD3
--
-- Maintainer  :  fontaine@cs.uni-duesseldorf.de
-- Stability   :  experimental
-- Portability :  GHC-only
--
-- All types used by the Haskell implementation of the parser and lexer.
-- This also defines the types of the tables that are exported by
-- the Haskell modules that the tool generates.
--
-----------------------------------------------------------------------------

{-# LANGUAGE GeneralizedNewtypeDeriving, RecordWildCards #-}
module SableCC.ParserTypes
where

import Data.Array as Array
import Data.List as List
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Maybe


-------------------
-- Lexer types
-------------------
type Modes = Array ModeID (ModeName, Mode)
type ModeName = String
newtype ModeID = ModeID {unModeID :: Int}
  deriving (Eq, Ord, Enum, Ix, Show)

data Mode = Mode {modeStates :: Array LexStateID State}
newtype LexStateID = LexStateID Int
  deriving (Eq, Ord, Enum, Ix, Show)

data State = State {
   stateTransitions :: IntervalTree
  ,stateAcceptedToken :: Maybe LexTokenID
  }

data TransitionTarget
  = Epsilon LexStateID
  | NotEpsilon LexStateID
  deriving (Eq, Ord, Show)

newtype LexTokenID = LexTokenID Int
  deriving (Eq, Ord, Enum, Ix, Show)

data LexerState = LexerState {
   lexerMode :: ModeID
  ,lexerBuffer :: String
  ,srcPos :: ()
  ,commentNestingCounter :: !Int
  }

initLexerState :: String -> LexerState
initLexerState src = LexerState {..}
  where
    lexerMode = ModeID 0
    lexerBuffer = src
    srcPos = ()
    commentNestingCounter = 0

type SToken = (LexTokenID, String)

data IntervalTree
  = IntervalNode IntervalTree Char TransitionTarget Char IntervalTree
  | IntervalLeaf
  deriving (Show)

lookupInterval :: Char -> IntervalTree -> Maybe TransitionTarget
lookupInterval char IntervalLeaf = Nothing
lookupInterval char (IntervalNode lowTree lowChar state highChar highTree)
  = if char < lowChar then lookupInterval char lowTree
      else if char > highChar then lookupInterval char highTree
        else Just state


-------------------------
-- Parser Types
-------------------------
newtype ParserStateID = ParserStateID {fromParserStateID :: Int}
  deriving (Eq, Ord, Enum, Ix, Show)

type ErrorMsg = String
type GotoTable = Array GotoIndex GotoMap
data GotoMap = GotoMap {
   defaultGoto :: ParserStateID
  ,gotoMap :: Map ParserStateID ParserStateID
  }
newtype GotoIndex = GotoIndex {unGotoIndex :: Int}
  deriving (Eq, Ord, Enum, Ix, Show)

type ActionTable = Array ParserStateID TransitionList
data TransitionList = TransitionList {
   defaultTransition :: Action
  ,transitionMap :: Map ParserTokenID Action
  }

data Action
  = Shift ParserStateID
  | Reduce Reduction
  | Accept
  | Error ErrorID
  deriving (Show)

data Reduction = Reduction {
   reductionID :: ReductionID
  ,popCount     :: Int
  ,gotoIndex    :: GotoIndex
  } deriving (Show)

newtype ReductionID = ReductionID {unReductionID :: Int}
  deriving (Eq, Ord, Enum, Ix, Show)

newtype ErrorID = ErrorID {unErrorID :: Int}
  deriving (Eq, Ord, Enum, Ix, Show)

type PToken = (ParserTokenID,String)
newtype ParserTokenID = ParserTokenID Int
  deriving (Eq, Ord, Enum, Ix, Show)

data CST
  = CstLeaf PToken
  | CstNode ReductionID [CST]
  deriving (Show)
