{-# OPTIONS_GHC -fglasgow-exts #-}
{-# LANGUAGE GADTs #-}

module Main where

import Law
import Semantics
import Logics
import Interpretation
import qualified Spreadsheet as S
import Control.Monad (forM, forM_)
import PGF
import System.Environment (getArgs)

--
ifDebug io = return ()
--ifDebug io = io

--
doXLSX = True
--doXLSX = False


law_pgf = "Law.pgf"
eng = mkCId "LawRawEng"
Just lineCat = readType "LabLine"

usage = unlines [
  "usage: VisualizeLaw opt*",
  "reads standard input",
  "Options, to show any of the formats (combinations are allowed):",
  "  help     this message",
  "  trees    syntax trees in GF notation",
  "  dot      syntax trees in graphviz .dot",
  "  lin      linearizations",
  "  assembly assembly logic",
  "  logic    many-sorted predicate logic",
  "  tptp     logic in TPTP format",
  "  tsv      spreadsheet as TSV file",
  "  excel    spreadsheet with colour tags for .xlsx",
  "The default is just tsv.",
  "With excel option, pipe into 'python3 color_spreadsheet.py'"
  ]

main = do
  xx <- getArgs
  let ifOpts os act = if any (flip elem xx) os then act else return ()
  let ifOpt o = ifOpts [o]
  if elem "help" xx
    then do
      putStrLn usage
      return ()
    else do
      pgf <- readPGF law_pgf
      ss <- getContents >>= return . lines
      ts <- forM ss $ \s -> do
        let ps = parse pgf eng lineCat s
        case ps of
          [] -> putStrLn ("## NO PARSE: " ++ s) >> return []
          tree:_ -> return [tree]

      ifOpt "dot" $ do
        writeFile "lawtrees.dot" $ unlines [graphvizAbstractTree pgf (True, False) t | t <- concat ts]
        putStrLn "wrote lawtrees.dot"

      let env = Env {lin = linearize pgf eng}
      let paras = paragraphs (map fg (concat ts))
      forM_ paras $ \para -> do
        ifOpt "lin" $ putStrLn $ unlines ["#- " ++ lin env (gf line) | line <- para]
        ifOpt "trees" $ putStrLn $ unlines ["## " ++ showExpr [] (gf line) | line <- para]
        let formula = iLabLines env para
        ifOpt "assembly" $ putStrLn $ "#+ " ++ show formula
        let box = formula2box formula
        if null xx || elem "tsv" xx || elem "excel" xx
          then putStrLn $ S.renderBox (elem "excel" xx) box
          else return ()
        let fprop = formula2prop formula
        case fprop of
          Right pc -> do
            ifOpt "logic" $ putStrLn $ "#/ REAL LOGIC: " ++ prPropCat pc
            ifOpt "tptp" $ case pc of
              PProp p -> putStrLn $ "#/ TPTP LOGIC: " ++ tptpProp p
              _ -> return ()
          Left s -> ifOpts ["logic", "tptp"] $ putStrLn $ "#/ LOGIC ERROR: " ++ s

