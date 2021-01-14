{-# LANGUAGE OverloadedStrings #-}

module DOTparser where

import Control.Monad (void)
import Data.Char (ord)
import Text.Megaparsec
import Data.Void (Void)
import Text.Megaparsec.Char

type Parser = Parsec Void String
type Node = Int

nodeEx :: String
nodeEx = "A -> B -> C"

goToNode :: Parser ()
goToNode = void space <|> void (string "->")

genNode :: Parser Node
genNode =
  ord <$> letterChar <* goToNode

main :: IO ()
main = do
  parseTest (some genNode >> eof) nodeEx
  -- parseTest ("a" :: Parser String) nodeEx
