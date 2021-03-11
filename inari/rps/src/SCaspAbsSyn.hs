{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
module SCaspAbsSyn where

import Control.Applicative hiding (many, some)
import Control.Monad
import Data.Void
import Text.Megaparsec hiding (State)
import Text.Megaparsec.Char
import qualified Data.Text as T
import qualified Text.Megaparsec.Char.Lexer as L

data Kind = KModel | KExp | KArg | KVar | KAtom

type Exp = Tree KExp
type Var = Tree KVar
type Model = Tree KModel
type Atom = Tree KAtom
type Arg = Tree KArg

data Tree :: Kind -> * where
  MExps :: [Exp] -> Tree KModel

  EApp :: Atom -> [Arg] -> Tree KExp

  AAtom :: Atom -> Tree KArg
  AVar  :: Var -> Tree KArg

  A :: String -> Tree KAtom
  V :: String -> Tree KVar

deriving instance Show (Tree k)

{- Without GADTs:
data MyExp =
  MEApp MyExp MyExp |
  MEVar MyVar
newtype MyVar = MyVar String
data Model = MExps [MyExp]
-}

----------------------------------------------------------------
-- Parser

type Parser = Parsec Void String


parseModel :: String -> Either String Model
parseModel = parseWError pModel ""

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

-- >>> parseTest pExp "here" "hello_world "
-- Couldn't match expected type ‘[Char] -> f0’
--             with actual type ‘IO ()’


-- >>> parseModel testModel
-- Right (MExps [EApp (A "winner") [AVar (V "A"),AVar (V "B")],EApp (A "game") [AVar (V "B")],EApp (A "participant_in") [AVar (V "A"),AVar (V "B")],EApp (A "player") [AVar (V "A")],EApp (A "player_throw") [AVar (V "A"),AAtom (A "rock")],EApp (A "player") [AVar (V "C")],EApp (A "participant_in") [AVar (V "C"),AVar (V "B")],EApp (A "player_throw") [AVar (V "C"),AAtom (A "scissors")],EApp (A "beats") [AAtom (A "rock"),AAtom (A "scissors")]])
