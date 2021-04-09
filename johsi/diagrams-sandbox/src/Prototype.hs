{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE TypeFamilies #-}

module Prototype where

import Diagrams.Backend.SVG.CmdLine
import Diagrams.Prelude
-- import Debug.Trace

data Tree a =
    Leaf a
  | Branch a [Tree a]
  deriving Show

tree3 :: Tree Int
tree3 = Branch 1 [ Leaf 2, Leaf 3 ]

tree8 :: Tree Int
tree8 = Branch 1
  [ Leaf 2
  , Branch 3
      [ Leaf 4
      , Branch 5
       [ Branch 6
          [ Leaf 7
          , Leaf 8 ]]]]

drawNode :: String -> Diagram B
drawNode str = text str # fontSizeL 0.1 <> circle 0.2 # pad 1.5 # named str

drawTree :: (Show a, IsName a) => Tree a -> (Diagram B, String)
drawTree (Leaf n) = (node, name)
  where
    node = drawNode name
    name = show n
drawTree (Branch n ts) =
  (foldr (connectOutside name) diagram childNames, name)
  where
    diagram = dn === hsep 0 dt # centerX
    name = show n
    dn = drawNode name
    (dt, childNames) = unzip $ map drawTree ts

main :: IO ()
main = mainWith $ fst $ drawTree tree8
