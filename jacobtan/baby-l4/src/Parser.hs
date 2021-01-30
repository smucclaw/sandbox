{-# LANGUAGE OverloadedStrings #-}

module Parser
    ( someFunc
    ) where

import Text.Megaparsec
import Text.Megaparsec.Char hiding (space)
import qualified Text.Megaparsec.Char.Lexer as L
import Data.Void (Void)
import Data.Text (Text)

someFunc :: IO ()
someFunc = putStrLn "someFunc"

type Parser = Parsec Void Text

space :: Parser ()
space = L.space space1 (L.skipLineComment "--") (L.skipBlockCommentNested "{-" "-}")

lexeme :: Parser a -> Parser a
lexeme = L.lexeme space

symbol :: Text -> Parser Text
symbol = L.symbol space

indentLevel :: Parser Pos
indentLevel = L.indentLevel

incorrectIndent :: Ordering -> Pos -> Pos -> Parser a
incorrectIndent = L.incorrectIndent

indentGuard :: Ordering -> Pos -> Parser Pos
indentGuard = L.indentGuard space

nonIndented :: Parser a -> Parser a
nonIndented = L.nonIndented space

newtype TypeName = TypeName Text
newtype AttrName = AttrName Text
newtype AttrType = AttrType Text

-- | E.g. Type Business (12345) :
data TypeDef = TypeDef TypeName (Maybe Integer) [TypeAttr]
-- | E.g.     is_operating (23456) : boolean
data TypeAttr = TypeAttr AttrName (Maybe Integer) AttrType

data Ind = IStr String | IInt Integer
  deriving Show

data Prop =
   BinOp String Ind Ind 
 | Equal Ind Ind 
  deriving Show
