{-# OPTIONS_GHC -fglasgow-exts #-}
{-# LANGUAGE GADTs #-}

module VisualizeLaw where

import Law
import Semantics
import qualified Spreadsheet as S

import PGF

law_pgf = "Law.pgf"
eng = mkCId "LawEng"
Just lineCat = readType "LabLine"

main = do
  pgf <- readPGF law_pgf
  ss <- getContents >>= return . lines
  ts <- flip mapM ss $ \s -> do
    let ps = parse pgf eng lineCat s
    case ps of
      [] -> putStrLn ("## NO PARSE: " ++ s) >> return []
      tree:_ -> putStrLn ("## " ++ showExpr [] tree) >> return [tree]

  let env = Env {lin = linearize pgf eng}
  let paras = paragraphs (map fg (concat ts))
  flip mapM_ paras $ \para -> do
      let formula = iLabLines env para
      let box = formula2box formula
      putStrLn $ S.renderBox box