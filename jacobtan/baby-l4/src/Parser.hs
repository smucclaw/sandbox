{-# LANGUAGE OverloadedStrings #-}

module Parser
    ( someFunc
    ) where

import Text.Megaparsec
import Text.Megaparsec.Char hiding (space, hspace)
import qualified Text.Megaparsec.Char.Lexer as L
import Data.Void (Void)
import Data.Text
import Data.Functor ((<&>))
import Control.Monad (void)

someFunc :: IO ()
someFunc = putStrLn "someFunc"

type Parser = Parsec Void Text

hspace :: Parser ()
hspace = L.space hspace1 (L.skipLineComment "--") (L.skipBlockCommentNested "{-" "-}")

lexeme :: Parser a -> Parser a
lexeme = L.lexeme hspace

symbol :: Text -> Parser String
symbol = fmap unpack . L.symbol hspace

indentLevel :: Parser Pos
indentLevel = L.indentLevel

incorrectIndent :: Ordering -> Pos -> Pos -> Parser a
incorrectIndent = L.incorrectIndent

indentGuard :: Ordering -> Pos -> Parser Pos
indentGuard = L.indentGuard hspace

nonIndented :: Parser a -> Parser a
nonIndented = L.nonIndented hspace

endLine :: Parser ()
endLine = void $ some (try $ hspace <* eol)

newtype TypeS = TypeS String deriving Show
newtype AttrS = AttrS String deriving Show
newtype AttrTypeS = AttrTypeS String deriving Show
newtype ObjS = ObjS String deriving Show

-- | E.g. Type Business (12345) :
data TypeDef = TypeDef TypeS (Maybe Integer) [TypeAttr] deriving Show
-- | E.g.     is_operating (23456) : boolean
data TypeAttr = TypeAttr AttrS (Maybe Integer) AttrTypeS deriving Show

-- | E.g. megaCorp : Business
data ObjDef = ObjDef ObjS TypeS deriving Show

-- Inari's example: data Ind ; data Prop
data Ind = IStr String | IInt Integer
  deriving Show

-- | E.g. megaCorp.is_operating = true
data Prop =
  BinOp String Ind Ind 
  | Equal Ind Ind 
  deriving Show

data L4_statement = L4Type TypeDef | L4Obj ObjDef | L4Prop Prop | L4Query Prop
  deriving Show

wordNetP :: Parser (Maybe Integer)
wordNetP = lexeme $ optional $ "(" *> L.decimal <* ")"

nameChar :: Parser Char
nameChar = alphaNumChar <|> char '_'

nameP :: Parser String
nameP = lexeme $ (:) <$> (lowerChar <|> char '_') <*> many nameChar

properNameP :: Parser String
properNameP = lexeme $ (:) <$> upperChar <*> many nameChar

typeDefP :: Parser TypeDef
typeDefP = nonIndented $
  TypeDef <$ symbol "Type" <*> (TypeS <$> properNameP)
    <*> wordNetP <* symbol ":" <* endLine
    <*> typeAttrP
    
typeAttrP :: Parser [TypeAttr]
typeAttrP = do
  pos <- indentGuard GT pos1
  many $ do
    indentGuard EQ pos
    TypeAttr <$> (AttrS <$> nameP) <*> wordNetP <* symbol ":"
      <*> (AttrTypeS <$> nameP) <* endLine

objDefP :: Parser ObjDef
objDefP = nonIndented $
  ObjDef <$> (ObjS <$> nameP) <* symbol ":" <*> (TypeS <$> properNameP) <* endLine
  
propP :: Parser Prop
propP = do
  x <- nameP <&> IStr
  symbol "."
  binOpS <- nameP
  symbol "="
  y <- nameP <&> IStr
  endLine
  return $ BinOp binOpS x y
  
queryP :: Parser Prop
queryP = symbol "?" *> propP

l4parser = many (
  L4Type <$> typeDefP
  <|> try (L4Obj <$> objDefP)
  <|> try (L4Prop <$> propP)
  )

main :: IO ()
main = do
  input <- readFile "babyl4.txt" <&> pack
  parseTest (l4parser *> eof) input


