{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}

module Rule34 where

-- import Encoding
-- import LogicGates
import Prettyprinter
import Data.Tree
import qualified Data.Map as Map

type RuleLabel = String

data MyRule = MyRule { label :: RuleLabel
                     , defeasors :: [Defeasor]
                     , party :: Party
                     , deontic :: Deontic
                --   , action :: Action
                     , condition :: Tree (Condition Predicate)
                     }
              deriving (Eq, Show)

class MyShow x where
  myshow :: x -> String

type Party = String
lp :: Party
lp = "Legal Practitioner"

data Deontic = MustNot | May
  deriving (Eq, Show)

data Defeasor = Notwithstanding [RuleLabel]
              | SubjectTo       [RuleLabel]
              | Despite         [RuleLabel]
              deriving (Show, Eq)

-- we pretend we have queried the user and received certain answers.
answers :: Map.Map String (Maybe Bool)
answers = Map.fromList [("always true",       Just True)
                       ,("always false",      Just False)
                       ,("detractsFrom",      Just False)
                       ,("isIncompatibleWith",Just False)
                       ,("derogatesFrom",     Just True)
                       ]

class NLG x where
  toEnglish :: x -> Doc ann
  toEnglishList :: [x] -> Doc ann
  toEnglishList [] = mempty

instance NLG MyRule where
  toEnglish (MyRule l defeasors p d c) =
    pretty l <> ":" <> line <> indent 4 (
    toEnglishList defeasors
    <> toEnglish c)
  toEnglishList rs = vsep (toEnglish <$> rs)

instance NLG Defeasor where
  toEnglish (Notwithstanding rls) = "notwithstanding" <+> toEnglishList rls
  toEnglish (SubjectTo       rls) = "subject to"      <+> toEnglishList rls
  toEnglish (Despite         rls) = "despite"         <+> toEnglishList rls
  toEnglishList ds = hsep $ punctuate comma (toEnglish <$> ds)

instance (NLG x) => NLG (Maybe x) where
  toEnglish Nothing = mempty
  toEnglish (Just x) = toEnglish x

instance NLG String where
  toEnglish "detractsFrom" = "detracts from"
  toEnglish "isIncompatibleWith" = "is incompatible with"
  toEnglish "derogatesFrom" = "derogates from"
  toEnglish "primaryOccupation(LP)" = "the legal practitioner's primary occupation of practising as a lawyer"
  toEnglish "availability(LP)" = "the legal practitioner's availability to those who may seek the legal practitioner's services as a lawyer"
  toEnglish "representationOfClients(LP)" = "the representation of the legal practitioner's clients"
  toEnglish "unfairlyAttractive" = "likely to unfairly attract business in the practice of law"
  toEnglish "feeSharing(LP)" = "the sharing of the legal practitioner's fees with"
  toEnglish "commission" = "the payment of a commission to"
  toEnglish x = pretty x

class Defeasible x where
  subjectTo       :: x -> x -> x
  notwithstanding :: x -> x -> x
  notwithstanding = flip subjectTo
  despite         :: x -> x -> x
  despite = notwithstanding
  normalize_1     :: [x] -> [x]
  normalize_1 = id

-- defeasibility -- evaluation
instance Defeasible Bool where
  x `subjectTo` y = not y && x

-- defeasibility -- normalization and graph transformation
instance Defeasible MyRule where
  x `subjectTo` y = x { defeasors = SubjectTo [label y] : defeasors x }

  -- in every rule x which is notwithstanding y,
  -- rewrite to say that y is subject to x
  normalize_1 = id

  -- there is an order of evaluation in the defeasors, so maybe we
  -- can't actually merge all SubjectTo etc together.

data Condition a = MkCondition (Maybe String) (Inner a) (Maybe String)
  deriving (Eq, Show)

data Inner a = Any
             | Or
             | All
             | Union
             | Leaf a
             | Inner [Tree (Condition a)]
             deriving (Eq, Show)

data Predicate = Pred String
               | Goto RuleLabel
  deriving (Eq, Show)

instance NLG Predicate where
  toEnglish (Pred p) = toEnglish p
  toEnglish (Goto r) = toEnglish (ruleBase Map.! r)

enlist :: (NLG a) => String -> Maybe String -> [a] -> Maybe String -> Maybe String -> Doc ann
-- todo: omit the last separator in the list
enlist separator conjunction middle front back = vsep (toEnglish front <> ":-"
                                                   : (addConjunction conjunction ( ((\x -> "-" <+> x) . toEnglish <$> middle))) ++ [toEnglish back])
  where
    addConjunction :: Maybe String -> [Doc ann] -> [Doc ann]
    addConjunction (Just c) [y, z] = [y <> pretty separator <+> pretty c, z]
    addConjunction (Just c) [z]    = [z]
    addConjunction (Just c) []     = []
    addConjunction (Just c) (x:xs) = x <> pretty separator : addConjunction (Just c) xs
    addConjunction Nothing xs = xs

instance (NLG a, Show a) => NLG (Tree (Condition a)) where
  toEnglish (Node (MkCondition pre Any   post) children) = enlist ";" Nothing      children (pre <> Just "any of the following") post
  toEnglish (Node (MkCondition pre Or    post) children) = enlist ";" (Just "or")  children pre post
  toEnglish (Node (MkCondition pre All   post) children) = enlist ";" Nothing      children (pre <> Just "all of the following") post
  toEnglish (Node (MkCondition pre Union post) children) = enlist ";" (Just "and") children pre post
  toEnglish (Node (MkCondition pre (Leaf a) post) [])    = toEnglish pre <> toEnglish a <> toEnglish post
  toEnglish (Node (MkCondition pre (Inner condtrees) post) []) = toEnglish pre <+> toEnglishList condtrees <+> toEnglish post
  toEnglish (Node (MkCondition pre (Leaf  a) post) children) = error ("leaf node " ++ (show a) ++ " should have no children! " ++ show children)
  toEnglish (Node (MkCondition pre (Inner a) post) children) = error ("inner node " ++ (show a) ++ " should have no children! " ++ show children)

mkLeaf x = Node (MkCondition Nothing (Leaf $ Pred x) Nothing) []

rule_alwaysmay = MyRule { label     = "test rule always true"
                        , defeasors = []
                        , party     = lp
                        , deontic   = May
                        , condition = mkLeaf "always true"
                        }
  
rule_alwaysmustnot = MyRule { label     = "test rule always true"
                            , defeasors = []
                            , party     = lp
                            , deontic   = MustNot
                            , condition = mkLeaf "always true"
                            }

rule_nevermatch = MyRule { label     = "test rule never match"
                         , defeasors = []
                         , party     = lp
                         , deontic   = MustNot
                         , condition = mkLeaf "always false"
                         }

rule34_1 = MyRule { label = "34.1"
         , defeasors = []
         , party = lp
         , deontic = MustNot
         , condition = Node (MkCondition
                             (Just "a legal practitioner must not accept any executive appointment associated with ")
                              Any
                              Nothing)
                       [Node (MkCondition Nothing (Leaf (Goto "34.1.a")) Nothing) []
                       ,Node (MkCondition Nothing (Leaf (Goto "34.1.b")) Nothing) []
                       ,Node (MkCondition Nothing (Leaf (Goto "34.1.c")) Nothing) []
                       ,Node (MkCondition Nothing (Leaf (Goto "34.1.d")) Nothing) []
                       ]
         }

ruleBase = Map.fromList $ (\r -> (label r, r)) <$>
  [ rule34_1
  , MyRule { label     = "34.1.a"
           , defeasors = []
           , party     = lp
           , deontic   = MustNot 
           , condition = Node (MkCondition
                               (Just "any business which")
                               Or
                               (Just "the dignity of the legal profession") )
                         [mkLeaf "detractsFrom"
                         ,mkLeaf "isIncompatibleWith"
                         ,mkLeaf "derogatesFrom"
                         ]
           }
  , MyRule { label     = "34.1.b"
           , defeasors = []
           , party     = lp
           , deontic   = MustNot 
           , condition = Node (MkCondition
                               (Just "any business which materially interferes with")
                                Or Nothing)
                         [mkLeaf "primaryOccupation(LP)"
                         ,mkLeaf "availability(LP)"
                         ,mkLeaf "representationOfClients(LP)"
                         ]
           }
  , MyRule { label     = "34.1.c"
           , defeasors = []
           , party     = lp
           , deontic   = MustNot 
           , condition = Node (MkCondition (Just "any business which is ")
                               (Leaf $ Pred "unfairlyAttractive")
                               Nothing) []
           }
  , MyRule { label     = "34.1.d"
           , defeasors = []
           , party     = lp
           , deontic   = MustNot 
           , condition = Node (MkCondition
                               (Just "any business which involves")
                               Or
                               (Just "any unauthorised person for legal work performed by the legal practitioner"))
                               [mkLeaf "feeSharing(LP)"
                               ,mkLeaf "commission"]
           }
  ]
