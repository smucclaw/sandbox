module Main where

-- import Parser (parseProgram)
import Parser(runCalc)
import System.Environment

main:: IO ()
main = interact (show.runCalc)

