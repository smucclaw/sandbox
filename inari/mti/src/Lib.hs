{-# LANGUAGE OverloadedStrings, RankNTypes, GADTs #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
module Lib
    ( someFunc
    ) where

import PGF (PGF, readPGF, Expr, graphvizAbstractTree)
import Diff
import Control.Applicative ( Alternative((<|>), empty) )
import Control.Monad (void)
import Data.Void ( Void )
import Text.Megaparsec ( try, some, Parsec, parse, eof, satisfy, notFollowedBy, lookAhead, someTill )
--import Text.Megaparsec ( parseTest )
import Text.Megaparsec.Char ( alphaNumChar, char, space1, string )
import qualified Text.Megaparsec.Char.Lexer as L
--import Debug.Trace (trace)
import Text.Wrap (defaultWrapSettings, wrapTextToLines)
import Data.Text (pack, unpack, unlines)
import System.Environment (getArgs)

someFunc :: IO ()
someFunc = do
    gr <- readPGF "grammars/Diff.pgf"
    f:_args <- getArgs
    testList <- readFile f
    -- parseTest (some pItemList <* eof) testList -- to show the potential error msg

    let res = parse (some pItemList <* eof) "" testList
    let trees = case res of
                    Left _e -> error "failed :'("
                    Right t -> t
    let gfTree = gf $ semanticTrees $ GConjS $ GListS $ toGFTree <$> normaliseInclude trees

    let dotFile = wrapStringToLines $ toViz gr gfTree
    let dotName = init (init f) <> "dot"
    writeFile dotName dotFile


-----------------------------------------------------------------------------
-- Custom data types

data Item = ITEM String
          | MEANS String String
          | DNINCLUDE String
          | MEANS_EXCEPT ItemList ItemList
          | MEANS_WITH_RESPECT_TO String String
           deriving (Show,Eq)
data ItemList = IL {top :: Item, args :: [ItemList]}  deriving (Show,Eq)

item2list :: Item -> ItemList
item2list x = IL x []

normaliseInclude :: [ItemList] -> [ItemList]
normaliseInclude (x:y:xs) = case (top x, top y) of
    (ITEM _a, DNINCLUDE _c) -> item2list (MEANS_EXCEPT x y) : normaliseInclude xs
    (MEANS _a _b, DNINCLUDE _c) -> item2list (MEANS_EXCEPT x y) : normaliseInclude xs
    _ -> x : normaliseInclude (y:xs)
normaliseInclude xs = xs

toGFTree :: ItemList -> GS
toGFTree il = case il of
    IL t [] -> i2S t
    IL t as ->  GConjS $ GListS [i2S t, argsS as]
  where
    argsS = GConjS . GListS . map toGFTree

    i2S (ITEM a) = GmkS (GString a)
    i2S (MEANS_EXCEPT a b) = GMEANS_EXCEPT_ (toGFTree a) (toGFTree b)
    i2S (MEANS a b) = GMEANS (GString a) (GString b)
    i2S (MEANS_WITH_RESPECT_TO a b) = GMEANS_WITH_RESPECT_TO_ (GString a) (GString b)
    i2S (DNINCLUDE a) = GBUT_DOES_NOT_INCLUDE (GString a)

semanticTrees :: forall a . Tree a -> Tree a
semanticTrees x = case x of
  GMEANS_EXCEPT_ (GConjS (GListS (GMEANS s t : rest))) (GConjS xs)
    -> GMEANS_EXCEPT  (GListS (GINCLUDES s t : rest )) xs
  GConjS (GListS (GMEANS_WITH_RESPECT_TO_ consumed good : GConjS xs : _))
    -> GMEANS_WITH_RESPECT_TO consumed good xs
  GConjS (GListS (GMEANS x (GString ":") : GConjS xs : _))
    -> GMEANS_FOR x xs
  _ -> composOp semanticTrees x

toViz :: PGF -> Expr -> String
toViz gr = graphvizAbstractTree gr (True,False)

wrapStringToLines :: String -> String
wrapStringToLines s = unpack $ Data.Text.unlines $ wrapTextToLines defaultWrapSettings 40 $ pack s

-----------------------------------------------------------------------------
-- The parser

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
pItem = try pDNINCLUDE <|> try pMEANS_WITH_RESPECT_TO <|> try pMEANS <|> pITEM
  where
    pITEM :: Parser Item
    pITEM = ITEM <$> lexeme (some anyChar)

pMEANS_WITH_RESPECT_TO :: Parser Item
pMEANS_WITH_RESPECT_TO = do
    x <- someTill anyChar (lookAhead pMeans)
    _ <- pMeans
    _ <- pKeyword ", with respect to"
    what <- lexeme (some anyChar)
    pure $ MEANS_WITH_RESPECT_TO x what

pMEANS :: Parser Item
pMEANS = do
    definition <- someTill anyChar (lookAhead pMeans)
    _ <- pMeans
    meaning <- lexeme (some anyChar)
    pure $ MEANS definition meaning


pDNINCLUDE :: Parser Item
pDNINCLUDE = do
    _ <- pKeyword "but does not include"
    DNINCLUDE <$> lexeme (some anyChar)


pKeyword :: String -> Parser String
pKeyword keyword = lexeme (string keyword <* notFollowedBy alphaNumChar)

pMeans :: Parser String
pMeans = pKeyword "means" <|> pKeyword "includes"

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
