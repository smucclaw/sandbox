module Spreadsheet where

import Data.List

data Box = Box {
   header :: String,
   cells :: [(String, Box)]
  }
  deriving Show

leftsides = map fst . cells
leftside b = if null (cells b) then "" else  head (leftsides b)

box = Box {header = "", cells = []}

headerBox h = box {header = h}

leftsideBox ls bs = box {cells = (ls, head bs) : [("", b) | b <- tail bs]}
infixLeftsideBox ls bs = box {cells = ("", head bs) : [(ls, b) | b <- tail bs]}

doubleLeftsideBox ls1 bs1 ls2 bs2 = box {
  cells = [(ls1, head bs1)] ++ [("", b) | b <- tail bs1] ++
          [(ls2, head bs2)] ++ [("", b) | b <- tail bs2]
  }

mkBox h l boxes = (leftsideBox l boxes){header = h}

addHeader h box =
  if null (header box)
    then box {header = h}
    else box {header = h, cells = ("", headerBox (header box)) : cells box}


-- rendering as TSV

cellsBox :: Box -> [[String]]
cellsBox box =
  (if null h then id else ([h]:)) $
    if null bs then [] else
      if all null (map fst bs)
        then [     c | (_,  b) <- bs, let cb = cellsBox b, c <- cb]
        else [mark i c | (ls, b) <- bs, let cb = cellsBox b, (i, c) <- zip [0..] cb,
                         let mark i c = if i==0 then ls:c else "":c
                        ]
  where
    h = header box
    ls = leftside box
    bs = cells box

boxSize :: Box -> (Int, Int)
boxSize box = (maximum (map length cs), length cs) 
  where
    cs = cellsBox box

separator = "\t"

renderBox :: Box -> String
renderBox = unlines . map (concat . intersperse separator) . cellsBox


-- logical structures

andBox bs = infixLeftsideBox "AND" bs
orBox bs = infixLeftsideBox "OR" bs
notBox b = leftsideBox "NOT" [b]
ifBox bs cs = doubleLeftsideBox "IF" bs "THEN" cs
ofBox bs cs = doubleLeftsideBox "THE" bs "OF" cs
atomBox s = headerBox s

forallBox bs cs = doubleLeftsideBox "FOR ALL" bs "HOLDS" cs
forsomeBox bs cs = doubleLeftsideBox "FOR SOME" bs "HOLDS" cs


-- examples for testing

ex1 = andBox [headerBox [c] | c <- ['A'..'E']]

ex2 = addHeader "conditions:"
        (andBox ([headerBox [c] | c <- ['A'..'E']] ++
         [addHeader "alternatives:" (orBox ([headerBox [c] | c <- ['F'..'H']]))]))

ex4 = ifBox [andBox [atomBox "A", atomBox "B"]] [orBox [atomBox "C", atomBox "D"]]

ex5 = addHeader "universal rule:" $ forallBox [addHeader "domain" (atomBox "N")] [ifBox [addHeader "such that" (orBox [atomBox "A", atomBox "B"])] [addHeader "result" (atomBox "C")]]





test ex = do
  putStrLn $ show $ boxSize ex
  putStrLn $ renderBox ex

main = do
  test ex1
  test ex2
  test ex4
  test ex5

  
