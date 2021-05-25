{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE TypeFamilies #-}

module AnyAll where

import Diagrams.Backend.SVG.CmdLine
import Diagrams.Prelude hiding (Any, All)

type Label = String
data Item =
    Leaf Label
  | Any Label [Item]
  | All Label [Item]
  deriving Show

data Header = Draw | NoDraw deriving Show

connectAll = connectOutside' (with & arrowHead .~ noHead)
connectAny par chi =
  withName par $ \parsub ->
  withName chi $ \chisub ->
  let parloc = location parsub
      chiloc = location chisub
      dy = (parloc ^. _y) - (chiloc ^. _y)
      lEdge = parloc & _y -~ dy & _x +~ 0.1
      rEdge = chiloc & _x -~ 0.1
    in atop (lEdge ~~ rEdge)

-- group names for connecting labels on subdiagrams
pairs :: [a] -> [(a, a)]
pairs [] = []
pairs [_] = []
pairs (x1:x2:xs) = (x1,x2) : pairs (x2:xs)

drawLeaf :: Label -> Diagram B
drawLeaf label =
  hsep 0.1
  [ square 0.2 # pad 1.5 # named label
  , alignedText 0 0.5 label # fontSizeL 0.1 # font "menlo"]

drawLeaves :: Header -> Item -> (Diagram B, Label)
drawLeaves _ (Leaf label) = (node, label)
  where node = drawLeaf label
drawLeaves header (All label items) =
  (foldr (uncurry connectAll) diagram (pairs childLabels), label)
  where
    diagram =
      case header of
        Draw -> beside (r2 (1,-1))
                       (drawLeaf label)
                       (vcat dl)
        NoDraw -> vcat dl
    (dl, childLabels) =  unzip (map (drawLeaves Draw) items)
drawLeaves header (Any label items) =
  (foldr (connectAny label) diagram childLabels, label)
  where
    diagram =
      case header of
        Draw -> beside (r2 (1,-1))
                       (drawLeaf label)
                       (vcat dl)
        NoDraw -> vcat dl
    (dl, childLabels) = unzip (map (drawLeaves Draw) items)

itemOne :: Item
itemOne = Leaf "Item 1;"

itemTwo :: Item
itemTwo = Leaf "Item 2;"

itemThree :: Item
itemThree =
  Any "Item 3 which may be satisfied by any of:"
       [ Leaf "Item 3.a;"
       , Leaf "Item 3.b; or"
       , Leaf "Item 3.c;"]

itemFour :: Item
itemFour = Leaf "Item 4; and"

itemFive :: Item
itemFive =
  All "Item 5 which requires all of:"
      [ Leaf "Item 5.a;"
      , Leaf "Item 5.b; and"
      , Leaf "Item 5.c."]

anyAll :: Item
anyAll = All "Any All" [itemOne, itemTwo, itemThree, itemFour, itemFive]

main :: IO ()
main = mainWith $ fst $ drawLeaves NoDraw anyAll
