module Main where

--import Law
--import Semantics
--import Logics
--import qualified Spreadsheet as S
import Control.Monad (forM, forM_)
import PGF

law_pgf = "Law.pgf"
raweng = mkCId "LawRawEng"
eng = mkCId "LawEng"
Just lineCat = readType "LabLine"

main = do
  pgf <- readPGF law_pgf
  ss <- getContents >>= return . lines
  forM ss $ \s -> do
    let ps = parse pgf raweng lineCat s
    putStrLn s
    forM ps $ \t -> do
      let lraw = linearize pgf raweng t
      let leng = linearize pgf eng t
      if lraw /= leng
        then do
          putStrLn $ showExpr [] t
          putStrLn $ "RAWENG: " ++ lraw
          putStrLn $ "ENG: " ++ leng
        else
          return ()
    putStrLn ""

