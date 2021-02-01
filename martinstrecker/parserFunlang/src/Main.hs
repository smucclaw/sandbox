module Main where

import Syntax
-- import Eval (runEval)
import Typing
import Parser (parseExpr, parseTokens)

import Control.Monad.Trans
import System.Console.Haskeline

process :: Environment -> String -> IO ()
process env input = do
  let tokens = parseTokens input
  putStrLn ("Tokens: " ++ show tokens)
  let ast = parseExpr input
  putStrLn ("Syntax: " ++ show ast)
  case ast of
    Left err -> do
      putStrLn "Parse Error:"
      print err
    Right ast -> putStrLn ("Typed expr: " ++ (show (tp_expr env ast)))
    
main :: IO ()
main = runInputT defaultSettings loop
  where
  loop = do
    minput <- getInputLine "Funlang> "
    case minput of
      Nothing -> outputStrLn "Goodbye."
      Just input -> (liftIO $ (process []) input) >> loop
