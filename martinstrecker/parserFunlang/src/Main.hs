module Main where

import Syntax
import Eval (reduceExpr)
import Typing
import Parser (parseExpr, parseTokens)

import Control.Monad.Trans
import System.Console.Haskeline

process_tp :: SEnvironment -> String -> IO ()
process_tp env input = do
  let tokens = parseTokens input
  putStrLn ("Tokens: " ++ show tokens)
  let ast = parseExpr input
  putStrLn ("Syntax: " ++ show ast)
  case ast of
    Left err -> do
      putStrLn "Parse Error:"
      print err
    Right ast -> putStrLn ("Typed expr: " ++ (show (tp_expr env ast)))
    

process_red :: String -> IO ()
process_red input = do
  let ast = parseExpr input
  putStrLn ("Syntax: " ++ show ast)
  case ast of
    Left err -> do
      putStrLn "Parse Error:"
      print err
    Right ast -> do
      let tpd_expr = (tp_expr [] ast)
      putStrLn ("Typed expr: " ++ (show tpd_expr) ++ "\n" ++
                "Reduction: " ++ (show (reduceExpr tpd_expr)))

      
main :: IO ()
main = runInputT defaultSettings loop
  where
  loop = do
    minput <- getInputLine "Funlang> "
    case minput of
      Nothing -> outputStrLn "Goodbye."
--      Just input -> (liftIO $ (process_tp []) input) >> loop
      Just input -> (liftIO $ process_red input) >> loop
