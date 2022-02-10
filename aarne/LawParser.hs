module Main where

import qualified Spreadsheet
import PGF
import Data.List


law_pgf = "Law.pgf"
eng = mkCId "LawRawEng"
--law_pgf = "TopAbs.pgf"
--eng = mkCId "Top"

Just lineCat = readType "LabLine"

analyse pgf s =
  let ps = parse pgf eng lineCat s
      msg = case ps of
        [t] -> ["OK: " ++ s, showExpr [] t]
        []  -> ["NO PARSE: " ++ s]
        _ -> ("AMBIGUOUS: " ++ show (length ps) ++ " " ++ s) :
             markCommonPrefixes (map (showExpr []) ps)
  in msg

markCommonPrefixes :: [String] -> [String]
markCommonPrefixes ss = map (mark (locate 0 sss)) sss
  where
    sss = sort ss
    mark n s = let (x, y) = splitAt n s in x ++ "{-*-}" ++ y
    locate n xs =
      if equals xs
      then locate (n+1) (map tail xs)
      else n
    equals xs = all ((==head (head xs)) . head) (tail xs)


main = do
  pgf <- readPGF law_pgf
  ss <- getContents >>= return . lines
  mapM_ (putStrLn . unlines . analyse pgf) ss
