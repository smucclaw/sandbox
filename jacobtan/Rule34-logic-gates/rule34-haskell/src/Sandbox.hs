{-# LANGUAGE PackageImports #-}
{-# LANGUAGE FlexibleInstances #-}
module Sandbox where

import qualified "diagrams-sandbox" AnyAll as AA (Label, Item(Leaf,Any,All))
import Data.Tree (Tree(Node))
import Rule34
    ( NLG,
      Label(MkLabel),
      Inner(Compl, Any, Or, Union, UnionComma, All, Leaf),
      Condition(MkCondition),
      ConditionTree,
      MyRule(MyRule),
      Predicate(Pred,Goto)
    )
import Data.Maybe

-- let's convert things to Jo Hsi's AnyAll types for visualization purposes
as_anyall = AA.All "all of the following" [AA.Leaf "Alice", AA.Leaf "Bob", AA.Leaf "Carol"]

class (Show x) => AA x where
  toAA :: x -> AA.Item
  toAA = AA.Leaf . show

instance AA MyRule where
  toAA (MyRule l defeasors p d condtree) = toAA condtree
  -- in future, add support for defeasors

instance AA (ConditionTree Predicate) where
  toAA (Node (MkCondition l pre Any        post) children) = AA.Any (ls l <> ps pre <> " any of the following") $ toAA <$> (filter relevant_aa children)
  toAA (Node (MkCondition l pre Or         post) children) = AA.Any (ls l <> ps pre <> " any of the following") $ toAA <$> (filter relevant_aa children)
  toAA (Node (MkCondition l pre Union      post) children) = AA.Any (ls l <> ps pre <> " any of the following") $ toAA <$> (filter relevant_aa children)
  toAA (Node (MkCondition l pre UnionComma post) children) = AA.Any (ls l <> ps pre <> " any of the following") $ toAA <$> (filter relevant_aa children)
  toAA (Node (MkCondition l pre All        post) children) = AA.All (ls l <> ps pre <> " all of the following") $ toAA <$> (filter relevant_aa children)
  toAA (Node (MkCondition l pre Compl      post) children) = error "not relevant, should never get here"
  toAA (Node (MkCondition l pre (Leaf  b)  post) [])       = AA.Leaf (ls l <> ps pre <> toAAs b <> ps post)
  toAA (Node (MkCondition l pre (Leaf  b)  post) children) = error ("leaf node " ++ (show b) ++ " should have no children! " ++ show children)

toAAs (Pred pterm) = pterm
toAAs (Goto pnum)  = "See paragraph " ++ pnum

instance AA Predicate where
  toAA = AA.Leaf . toAAs

ls :: Label -> String
ls (MkLabel paraNum predTerm pStyle) = maybe "" id predTerm

ps :: Maybe String -> String
ps (Just x) = x
ps (Nothing) = ""


relevant_aa :: ConditionTree a -> Bool
relevant_aa (Node (MkCondition l pre Compl      post) children) = False
relevant_aa _                                                   = True

