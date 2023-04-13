{-# LANGUAGE OverloadedStrings #-}
module Lib
    ( someFunc
    ) where

import PGF (PGF, readPGF, Expr, graphvizAbstractTree)
import Diff
import Control.Applicative ( Alternative((<|>), empty) )
import Control.Monad (void)
import Data.Void ( Void )
import Text.Megaparsec ( try, some, Parsec, parse, parseTest, eof, satisfy, notFollowedBy, lookAhead, manyTill )
import Text.Megaparsec.Char ( alphaNumChar, char, space1, string )
import qualified Text.Megaparsec.Char.Lexer as L

someFunc :: IO ()
someFunc = do
    gr <- readPGF "grammars/Diff.pgf"
    testList <- readFile "test.md"
    parseTest (some pItemList <* eof) testList -- to show the potential error msg

    let res = parse (some pItemList <* eof) "" testList
    let trees = case res of
                    Left _e -> error "failed :'("
                    Right t -> t
    let gfTree = gf $ G__ $ GListS $ toGFTree <$> trees

    let dotFile = toViz gr gfTree
    writeFile "grammars/viz.dot"  dotFile

-----------
toGFTree :: ItemList -> GS
toGFTree il = case il of
    IL t [] -> toS t
    IL t as ->  G__ $ GListS [toS t, argsS as]
  where
    argsS = G__ . GListS . map toGFTree

    toS (ITEM a) = G_ (GString a)
    toS (MEANS a b) = GMEANS (GString a) (GString b)

toViz :: PGF -> Expr -> String
toViz gr = graphvizAbstractTree gr (True,False)

-----------

type Parser = Parsec Void String

lineComment :: Parser ()
lineComment = L.skipLineComment "#"

anyChar :: Parser Char
anyChar = satisfy (`notElem` ['\n', '#'])

scn :: Parser ()
scn = L.space space1 lineComment empty

sc :: Parser ()
sc = L.space (void $ some (char ' ' <|> char '\t')) lineComment empty

lexeme :: Parser a -> Parser a
lexeme = L.lexeme sc

pItem :: Parser Item
pItem = try pMEANS <|> pITEM
  where
    pITEM :: Parser Item
    pITEM = ITEM <$> lexeme (some anyChar)

pMEANS :: Parser Item
pMEANS = do
    definition <- manyTill anyChar (lookAhead $ pKeyword "means")
    _ <- pKeyword "means"
    meaning <- lexeme (some anyChar)
    pure $ MEANS definition meaning


pKeyword :: String -> Parser String
pKeyword keyword = lexeme (string keyword <* notFollowedBy alphaNumChar)

-----------------------------------------------------------------------------
-- Custom data types

data Item = ITEM String | MEANS String String  deriving (Show,Eq)
data ItemList = IL {top :: Item, args :: [ItemList]}  deriving (Show,Eq)

item2list :: Item -> ItemList
item2list x = IL x []

-----------------------------------------------------------------------------
-- The parser

--  Parser (String, [String])
pComplexItem :: Parser ItemList
pComplexItem = L.indentBlock scn p
  where
    p = do
      header <- pItem
      return (L.IndentMany Nothing (pure . IL header . map item2list) pItem)

pItemList :: Parser ItemList
pItemList = L.nonIndented scn (L.indentBlock scn p)
  where
    p = do
      header <- pItem
      return (L.IndentMany Nothing (return . IL header) pComplexItem)
