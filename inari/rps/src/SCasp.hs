{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
module SCasp where

import Control.Applicative hiding (many, some)
import Data.Void ( Void )
import Text.Megaparsec hiding (State)
import Text.Megaparsec.Char
import qualified Text.Megaparsec.Char.Lexer as L

----------------------------------------------------------------
-- Abstract syntax

-- Type that is used as an index in the GADT
data SKind = KModel | KExp | KArg | KVar | KAtom

-- The actual GADT
data Tree :: SKind -> * where
  MExps :: [Tree KExp] -> Tree KModel

  EApp :: Tree KAtom -> [Tree KArg] -> Tree KExp

  AAtom :: Tree KAtom -> Tree KArg
  AVar  :: Tree KVar -> Tree KArg

  A :: String -> Tree KAtom
  V :: String -> Tree KVar

deriving instance Show (Tree k)

-- Shorthands for the GADT
type Exp = Tree KExp
type Var = Tree KVar
type Model = Tree KModel
type Atom = Tree KAtom
type Arg = Tree KArg

----------------------------------------------------------------
-- Parser
-- It could be any parser, this happens to be with Megaparsec.
-- The point is the use of GADTs and type families in the abstract syntax.

type Parser = Parsec Void String

parseModel :: String -> Either String Model
parseModel = parseWError pModel ""

parseModel' :: String -> IO ()
parseModel' = parseTest pModel

parseWError :: (Stream s, ShowErrorComponent e) => Parsec e s b -> String -> s -> Either String b
parseWError p src = either (Left . errorBundlePretty) Right . parse p src

spaceConsumer :: Parser ()
spaceConsumer = space
-- spaceConsumer = L.space
--   space1
--   (L.skipLineComment "//")
--   (L.skipBlockComment "/*" "*/")


symbol :: String -> Parser String
symbol = L.symbol spaceConsumer

lexeme :: Parser String -> Parser String
lexeme = L.lexeme spaceConsumer

braces :: Parser a -> Parser a
braces = between (symbol "{") (symbol "}")

parens :: Parser a -> Parser a
parens = between (symbol "(") (symbol ")")

commaSeparated :: Parser a -> Parser [a]
commaSeparated p = p `sepBy` symbol "," 

pModel :: Parser Model
pModel = MExps <$> braces (commaSeparated pExp)

pExp :: Parser Exp
pExp = EApp <$> pAtom <*> parens (commaSeparated pArg)

pVar :: Parser Var
pVar = V <$> lexeme (some upperChar)

pAtom :: Parser Atom
pAtom = fmap A $ lexeme $ some (lowerChar <|> char '_')

pArg :: Parser Arg
pArg = AAtom <$> pAtom
   <|> AVar <$> pVar

testModel = "{ winner(A,B),  game(B ),  participant_in(A,B),  player(A),  player_throw(A,rock),  player(C),  participant_in(C,B),  player_throw(C,scissors),  beats(rock,scissors) }"