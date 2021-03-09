module Main where

import Parser (parseProgram)
import Typing (tpExp)
import System.Environment

-- main:: IO ()
-- main = interact (show.runCalc)


process :: FilePath -> String -> IO ()
process filepath input = do
  let ast = parseProgram filepath input
  case ast of
    Right ast -> do
      print (tpExp [] ast)
    Left err -> do
      putStrLn "Parser Error:"
      print err

main :: IO ()
main = do
  args <- getArgs
  case args of
    []      -> putStrLn "Usage: core-language <input file>"
    [fname] -> do
      contents <- readFile fname
      process fname contents
