module Main where

import qualified MyLib (parseOPM)
import qualified Data.Text.IO as TIO
import System.IO (hSetEncoding, stdin, utf8)
import Text.Pretty.Simple (pPrint)

main :: IO ()
main = do
  hSetEncoding stdin utf8
  input <- TIO.getContents
  let result = MyLib.parseOPM input
  case result of
    Left err -> putStrLn $ "Error: " ++ show err
    Right clauses -> do
      putStrLn "Parsed clauses:\n"
      pPrint clauses
