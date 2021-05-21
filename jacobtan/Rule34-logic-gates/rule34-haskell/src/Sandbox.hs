{-# LANGUAGE PackageImports #-}
module Sandbox where

import "svg-builder-sandbox" Lib ( someFunc )

x :: IO ()
x = someFunc


import qualified "diagrams-sandbox" AnyAll (Label, Item(Leaf,Any,All)) as AA

-- let's convert things to Jo Hsi's AnyAll types for visualization purposes
as_anyall = AA.All "of the following" [AA.Leaf "Alice", AA.Leaf "Bob", AA.Leaf "Carol"]

class (Show x) => AA.AA x where
  toAA :: x -> Item
  toAA = AA.Leaf . show

instance AA MyRule where
  toAA (MyRule l defeasors p d condtree) = toAA condtree
  -- in future, add support for defeasors

instance (NLG b, Show b) => AA (ConditionTree b) where
  toAA (Node (MkCondition l pre Any        post) children) = AA.Any $ toAA <$> (filter relevant_aa children)
  toAA (Node (MkCondition l pre Or         post) children) = AA.Any $ toAA <$> (filter relevant_aa children)
  toAA (Node (MkCondition l pre Union      post) children) = AA.Any $ toAA <$> (filter relevant_aa children)
  toAA (Node (MkCondition l pre UnionComma post) children) = AA.Any $ toAA <$> (filter relevant_aa children)
  toAA (Node (MkCondition l pre All        post) children) = AA.All $ toAA <$> (filter relevant_aa children)
  toAA (Node (MkCondition l pre Compl      post) children) = error "not relevant, should never get here"
  toAA (Node (MkCondition l pre (Leaf  b)  post) [])       = AA.Leaf b
  toAA (Node (MkCondition l pre (Leaf  b)  post) children) = error ("leaf node " ++ (show b) ++ " should have no children! " ++ show children)

relevant_aa :: ConditionTree a -> Boolean
relevant_aa (Node (MkCondition l pre Compl      post) children) = False
relevant_aa _                                                   = True

