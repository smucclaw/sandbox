{-# OPTIONS_GHC -fglasgow-exts #-}
{-# LANGUAGE GADTs #-}

module Main where

import Law
import Semantics
import Logics
import qualified Spreadsheet as S
import Control.Monad (forM, forM_)
import PGF

--
ifDebug io = return ()
--ifDebug io = io

law_pgf = "Law.pgf"
eng = mkCId "LawRawEng"
Just lineCat = readType "LabLine"

main = do
  pgf <- readPGF law_pgf
  ss <- getContents >>= return . lines
  ts <- forM ss $ \s -> do
    let ps = parse pgf eng lineCat s
    case ps of
      [] -> putStrLn ("## NO PARSE: " ++ s) >> return []
      tree:_ -> return [tree]

  ifDebug $ writeFile "lawtrees.dot" $ unlines [graphvizAbstractTree pgf (True, False) t | t <- concat ts]

  let env = Env {lin = linearize pgf eng}
  let paras = paragraphs (map fg (concat ts))
  forM_ paras $ \para -> do
      ifDebug $ putStrLn $ unlines ["#- " ++ lin env (gf line) | line <- para]
      ifDebug $ putStrLn $ unlines ["## " ++ showExpr [] (gf line) | line <- para]
      let formula = iLabLines env para
      ifDebug $ putStrLn $ "#+ " ++ show formula
      let box = formula2box formula
      putStrLn $ S.renderBox box
      let fprop = formula2prop formula
      ifDebug $ case fprop of
          Right pc -> do
            putStrLn $ "#/ REAL LOGIC: " ++ prPropCat pc
            case pc of
              PProp p -> putStrLn $ "#/ TPTP LOGIC: " ++ tptpProp p
              _ -> return ()
          Left s -> putStrLn $ "#/ LOGIC ERROR: " ++ s
 

{- TODO: data structure for parse results

data ParseResult = ParseResult {
  lineNumbers :: [Int],
  block :: [String],  -- text on each line
  trees :: [Expr],    -- tree per line
  formula :: Formula,
  logic :: Either String PProp,
  tptp :: Maybe String
  }

getParseResults :: PGF -> Language -> Type -> [String] -> [ParseResult]
getParseResults pgf lang typ ss = [
  ParseResult {
    } 
  ]
 where
   parses = map (parse pgf lang typ) ss
   combinations = sequence parses
   blockss = [paragraphs (map fg comb) | comb <- combinations]
-}
