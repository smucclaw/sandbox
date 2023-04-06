----------------------------------------------------------------------------
-- |
-- Module      :  SableCC.XML.XML2Parser
-- Copyright   :  (c) Fontaine 2011
-- License     :  BSD3
--
-- Maintainer  :  fontaine@cs.uni-duesseldorf.de
-- Stability   :  experimental
-- Portability :  GHC-only
--
-- Todo: This is all repetitive boilerplate
-- Replace this with a more powerfull XML-combinator libary.
-----------------------------------------------------------------------------

{-# LANGUAGE RecordWildCards, TemplateHaskell #-}
module SableCC.XML.XML2Parser
(
  readParser
)
where

import SableCC.XML.ParserDefinitionRaw as Raw

import Text.XML.Light
import Text.XML.Light.Input
import Text.XML.Light.Proc
import Debug.Trace.LocationTH
import Data.Maybe

-- | Read a SableCC generated XML file
-- and compute a low-level Haskell representation of the XML content.
readParser :: FilePath -> IO Parser
readParser fname = do
  src <- readFile fname
  return $ toParser
    $ fromMaybe (error ("cannot parse XML at " ++ $__LOCATION__)) $ parseXMLDoc src

toParser :: Element -> Parser
toParser doc = Parser {..}
  where
    parser_tokens = toTokens $ getChild $__LOCATION__ "tokens" doc
    parser_parser_eof_index
      = read $ getAttr $__LOCATION__ "parser_index"
               $ getChild $__LOCATION__ "eof" $ getChild $__LOCATION__ "tokens" doc
    parser_prods
      = map toProd $ findChildren (unqual "prod")$ getChild $__LOCATION__ "prods" doc

    parser_lexer_data = toLexer $ getChild $__LOCATION__ "lexer_data" doc
    parser_parser_data = toParserData $ getChild $__LOCATION__ "parser_data" doc
    parser_rules = map toRule $ findChildren (unqual "rule") $ getChild $__LOCATION__ "rules" doc

getChild :: String -> String -> Element -> Element
getChild loc name xml = case findChild (unqual name) xml of
  Just e -> e
  Nothing -> error $ "cannot find child " ++ name ++ " in XML at " ++ loc

getAttr :: String -> String -> Element -> String
getAttr loc name xml = case findAttr (unqual name) xml of
  Just e -> e
  Nothing -> error $ "cannot find attribute " ++ name ++ " in XML at " ++ loc


getBoolAttr :: String -> Element -> Bool
getBoolAttr name doc
  = case (findAttr (unqual name) doc) of
      Just "true" -> True
      _ -> False

toTokens :: Element -> [Token]
toTokens = map toToken . findChildren (unqual "token")
  where
    toToken :: Element -> Token
    toToken e = Token {
       token_name = getAttr $__LOCATION__ "name" e
      ,token_ename = getAttr $__LOCATION__ "ename" e
      ,token_parser_index = fmap read $ findAttr (unqual "parser_index") e
      ,token_parser_text = findAttr (unqual "text") e
      ,token_transitions = map toTransition $ findChildren (unqual "transition") e
      }
    toTransition e = (getAttr $__LOCATION__ "from" e, getAttr $__LOCATION__ "to" e)


toLexer :: Element -> Lexer_Data
toLexer e = Lexer_Data {..}
  where
   lexer_modeNames
     = map (\x -> (getAttr $__LOCATION__ "name" x, read $ getAttr $__LOCATION__ "id" x))
           (findChildren (unqual "state") e)
   lexer_accept_table
     = map getIList $ findChildren (unqual "state")
             $ getChild $__LOCATION__ "accept_table" e
   getIList = map (read . strContent) . findChildren (unqual "i")
   lexer_goto_table = map toRowList $ findChildren (unqual "state") $
       getChild $__LOCATION__ "goto_table" e
   toRowList = map toGotoList . findChildren (unqual "row")
   toGotoList = map toGoto . findChildren (unqual "goto")
   toGoto x = Lexer_Goto {
     lexer_goto_state = read $ getAttr $__LOCATION__ "state" x
    ,lexer_goto_high = read $ getAttr $__LOCATION__ "high" x
    ,lexer_goto_low  = read $ getAttr $__LOCATION__ "low" x
    }




toParserData :: Element -> Parser_Data
toParserData doc = Parser_Data {..}
  where
    parser_error_messages = map strContent $ findChildren (unqual "msg")
                                  $ getChild $__LOCATION__ "error_messages" doc
    parser_errors = map (read . strContent) $ findChildren (unqual "i")
                                  $ getChild $__LOCATION__ "errors" doc
    parser_goto_table = map mkGotoList $ findChildren (unqual "row") $ getChild $__LOCATION__ "goto_table" doc

    mkGotoList = map (\x -> (read $ getAttr $__LOCATION__ "from" x,read $ getAttr $__LOCATION__ "to" x))
                   . findChildren (unqual "goto")
    parser_action_table = map (map toParserAction . findChildren (unqual "action"))
                              $ findChildren (unqual "row") $ getChild $__LOCATION__ "action_table" doc

    toParserAction x = ParserAction {
          action_to     = read $ getAttr $__LOCATION__ "to" x
         ,action_action = read $ getAttr $__LOCATION__ "action" x
         ,action_from   = read $ getAttr $__LOCATION__ "from" x
         }

toRule :: Element -> Rule
toRule doc = Rule {..}
  where
   rule_index = read $ getAttr $__LOCATION__ "index" doc
   rule_ename = getAttr $__LOCATION__ "ename" doc
   rule_leftside = read $ getAttr $__LOCATION__ "leftside" doc
   rule_actions = map toAction $ findChildren (unqual "action") doc


toAction :: Element -> Action
toAction doc = case getAttr $__LOCATION__ "cmd" doc of
  "POP" -> Pop args
  "MAKELIST" -> MakeList args
  "FETCHLIST" -> FetchList args
  "ADDLIST" -> AddList args
  "ADDNODE"   -> AddNode args
  "MAKENODE" -> MakeNode args
  "RETURNNODE" -> ReturnNode args
  "FETCHNODE" -> FetchNode args
  "RETURNLIST" -> ReturnList args
  attr -> error $ $__LOCATION__ ++ " cannot parse Action :" ++ attr
  where
    args = ActionArgs {..}
    action_result = optionalAttr $__LOCATION__ "result"
    action_index  = read $ optionalAttr "0" "index"
    action_etype  = optionalAttr $__LOCATION__ "etype"
    action_arg_from   = optionalAttr $__LOCATION__ "from"
    action_null   = case optionalAttr "false" "null" of
                        "true" -> True
                        "false" -> False
    action_node   = optionalAttr $__LOCATION__ "node"
    action_list   = optionalAttr $__LOCATION__ "list"
    action_tolist = optionalAttr $__LOCATION__ "tolist"
    action_fromlist = optionalAttr $__LOCATION__ "fromlist"
    action_args = map mkArg $ findChildren (unqual "arg") doc
    optionalAttr :: String -> String -> String
    optionalAttr def name = fromMaybe def $ findAttr (unqual name) doc

    mkArg :: Element -> ActionArgElem
    mkArg x = case (getBoolAttr "null" x, getBoolAttr "is_list" x) of
                (True , False) -> ActionArgNull
                (False, True ) -> ActionArgList $ strContent x
                (False, False) -> ActionArg $ strContent x
                _ -> error $__LOCATION__


toProd :: Element -> Prod
toProd doc = Prod {..}
  where
    prod_name   = getAttr $__LOCATION__ "name" doc
    prod_ename  = getAttr $__LOCATION__ "ename" doc
    prod_alt    = map toAlt $ findChildren (unqual "alt") doc

    toAlt :: Element -> Alt
    toAlt doc = Alt {..}
      where
        alt_name  = getAttr $__LOCATION__ "name" doc
        alt_ename = getAttr $__LOCATION__ "ename" doc
        alt_elem  = map toElem $ findChildren (unqual "elem") doc

    toElem :: Element -> Elem
    toElem doc = Raw.Elem {..}
      where
        elem_modifier = findAttr (unqual "modifier") doc
        elem_name     = getAttr $__LOCATION__ "name" doc
        elem_ename    = getAttr $__LOCATION__ "ename" doc
        elem_type     = getAttr $__LOCATION__ "type" doc
        elem_etype    = getAttr $__LOCATION__ "etype" doc
        elem_is_list  = getBoolAttr "is_list" doc
        elem_is_token = getBoolAttr "is_token" doc

