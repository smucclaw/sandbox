{-# LANGUAGE OverloadedStrings #-}

module DOTparser where

import Control.Monad (void)
import Data.Char (ord)
import Data.Void (Void)
import Text.Megaparsec
import Text.Megaparsec.Char
import Text.Megaparsec.Char.Lexer (lexeme)

type Parser = Parsec Void String
type Node = Int

nodeEx :: String
nodeEx = "A -> B -> C"

goToNode :: Parser ()
goToNode = void space <|> void (string "->")

genNode :: Parser Node
genNode =
  ord <$> letterChar <* goToNode

lex' :: Parser a -> Parser a
lex' = lexeme space

main :: IO ()
main = do
  putStrLn "__Example 1"
  parseTest (some genNode) nodeEx
  putStrLn ""

  putStrLn "__Example 2"
  parseTest (some genNode >> eof) nodeEx
  putStrLn ""
  
  putStrLn "__Example 3 (works)"
  parseTest ((ord <$> letterChar) `sepBy` " -> " <* eof :: Parser [Int]) nodeEx
  putStrLn ""

  putStrLn "__Example 4 (nicer)"
  parseTest (lex' (ord <$> letterChar) `sepBy` lex' "->" <* eof :: Parser [Int]) nodeEx
  putStrLn ""

  -- parseTest ("a" :: Parser String) nodeEx
