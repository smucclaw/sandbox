----------------------------------------------------------------------------
-- |
-- Module      :  SableCC.XML.ParserDefinitionRaw
-- Copyright   :  (c) Fontaine 2011
-- License     :  BSD3
--
-- Maintainer  :  fontaine@cs.uni-duesseldorf.de
-- Stability   :  experimental
-- Portability :  GHC-only
--
-- This module defines Haskell data structures for
-- the parser-tables generated by SableCC.
-- This representation is close to the XML output of SableCC.
--
-- Todo: This is all repetitive boilerplate
-- Replace this with a more powerfull XML-combinator libary.
-----------------------------------------------------------------------------

module SableCC.XML.ParserDefinitionRaw
where

data Parser = Parser {
   parser_tokens :: [Token]
  ,parser_parser_eof_index :: Int
  ,parser_prods :: [Prod]
  ,parser_lexer_data :: Lexer_Data
  ,parser_parser_data :: Parser_Data
  ,parser_rules :: [Rule]
  }
  deriving (Show)

type LexerModeName = String
type LexerModeID   = Int

data Token = Token {
   token_name :: !String
  ,token_ename :: !String
  ,token_parser_index :: Maybe Int
  ,token_parser_text  :: Maybe String
  ,token_transitions :: [(String,String)]
  }
  deriving (Show)

data Lexer_Data = Lexer_Data {
   lexer_modeNames :: [(LexerModeName,Int)]
  ,lexer_accept_table :: [[Int]]
  ,lexer_goto_table :: [[[Lexer_Goto]]]
  }
  deriving (Show)

data Lexer_Goto = Lexer_Goto {
   lexer_goto_state :: !Int
  ,lexer_goto_high :: !Int
  ,lexer_goto_low :: !Int
  }
  deriving (Show)


data Parser_Data = Parser_Data {
   parser_action_table :: [[ParserAction]]
  ,parser_goto_table :: [[(Int,Int)]]
  ,parser_errors :: [Int]
  ,parser_error_messages :: [String]
  }
  deriving (Show)

data ParserAction = ParserAction {
   action_to :: Int
  ,action_action :: Int
  ,action_from :: Int
  }
  deriving (Show)

data Rule = Rule {
   rule_index :: Int
  ,rule_ename :: String
  ,rule_leftside :: Int
  ,rule_actions :: [Action]
  }
  deriving (Show)

data Action
  = Pop {unActionArgs :: ActionArgs}
  | MakeList {unActionArgs :: ActionArgs}
  | FetchList {unActionArgs :: ActionArgs}
  | FetchNode {unActionArgs :: ActionArgs}
  | AddList {unActionArgs :: ActionArgs}
  | AddNode {unActionArgs :: ActionArgs}
  | MakeNode {unActionArgs :: ActionArgs}
  | ReturnNode {unActionArgs :: ActionArgs}
  | ReturnList {unActionArgs :: ActionArgs}
  deriving (Show, Eq)

isPopAction :: Action -> Bool
isPopAction (Pop {}) = True
isPopAction _ = False

data ActionArgs = ActionArgs {
   action_result :: String
  ,action_index :: Int
  ,action_etype :: String
  ,action_arg_from :: String
  ,action_null :: Bool
  ,action_node :: String
  ,action_list :: String
  ,action_tolist :: String
  ,action_fromlist :: String
  ,action_args :: [ActionArgElem]
  } deriving (Show, Eq)

data ActionArgElem
  = ActionArgNull
  | ActionArgList String
  | ActionArg String
  deriving (Show, Eq)

data Prod = Prod {
   prod_name :: String
  ,prod_ename :: String
  ,prod_alt   :: [Alt]
  } deriving (Show, Eq)

data Alt = Alt {
   alt_name :: String
  ,alt_ename :: String
  ,alt_elem :: [Elem]
  } deriving (Show, Eq)

data Elem = Elem {
   elem_modifier :: Maybe String
  ,elem_name :: String
  ,elem_ename :: String
  ,elem_type  :: String
  ,elem_etype :: String
  ,elem_is_list    :: Bool
  ,elem_is_token    :: Bool
  } deriving (Show, Eq)