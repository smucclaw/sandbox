{-# OPTIONS_GHC -fglasgow-exts #-}
{-# LANGUAGE GADTs #-}

module VisualizeLaw where

import Law
import Semantics
import qualified Spreadsheet as S

import PGF

law_pgf = "Law.pgf"
eng = mkCId "LawEng"
Just lineCat = readType "Line"

main = do
  pgf <- readPGF law_pgf
  s <- getContents
  let ps = parse pgf eng lineCat s
  case ps of
    [] -> putStrLn "no parse"
    tree:_ -> do
      let env = Env {lin = linearize pgf eng . gf}
      let formula = iLine env (fg tree)
      let box = formula2box formula
      putStrLn $ S.renderBox box