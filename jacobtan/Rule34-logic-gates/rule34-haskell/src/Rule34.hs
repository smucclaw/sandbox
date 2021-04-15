{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Rule34 where

-- import Encoding
-- import LogicGates
import Prettyprinter
import Data.Tree
import qualified Data.Map as Map

{-
How do we model nested conditions?
Consider the problem:

  You may order any of the following flavours of ice cream:
     a. Chocolate
     b. Strawberry
     c. Vanilla
     d. Any flavour listed on any of the following pages of the menu:
        (i)   page 12
        (ii)  page 13
        (iii) page 16

And that's fine. What about conditional conditions?
     e. On weekdays, any flavour listed on page 14.
     f. On weekends, any flavour listed on page 15.

What if the nested conditions aren't just nested, but chained?

     You may buy any
                   - automobile
                   - light truck, or
                   - motorcycle
     that is coloured
                    - red
                    - green, or
                    - yellow
     that was manufactured between 2010 and 2016

We can model these "chained" conditions as
    AND [ vehicleType ANY [ automobile, light truck, motorcycle ] ]
        , colour      ANY [ red, green, yellow ]
        , manufDate    IN [ 2010 .. 2016 ]
        ]

Translated back to a more legalistic form with the "and"s and "or"s put back

   You may buy any vehicle that satisfies all the following conditions:
      1. the vehicle type is any of the following:
         a. automobile,
         b. light truck, or
         c. motorcycle;
      2. the colour is
         a. red,
         b. green, or
         c. yellow; and
      3. the manufacturing year is in the range 2010 to 2016.

The placement of the connectors between the second-last and last elements
of the list is just something we've all gotten used to, but when you think
about it, it's as arbitrary as the fact that the hour after 12am is 1pm.

If you were designing the time system from scratch, surely you would have
  am: 1 .. 12
  pm: 1 .. 12

But instead we have
  12am, 1am .. 11am
  12pm, 1pm .. 11pm

Weird offsets are everywhere.

-}

data MyRule = MyRule { defeasors :: [Defeasor]
                     , party :: Party
                     , deontic :: Deontic
                --   , action :: Action
                     , condition :: ConditionTree Predicate
                     }
              deriving (Eq, Show)

data Labeled a b = Labeled { label :: a, inner :: b }
  deriving (Eq, Show)

rule_alwaysmay = Labeled (Just "test rule always true")
                 MyRule { defeasors = []
                        , party     = lp
                        , deontic   = May
                        , condition = mkLeaf "always true"
                        }
  
rule_alwaysmustnot = Labeled (Just "test rule always true")
                     MyRule { defeasors = []
                            , party     = lp
                            , deontic   = MustNot
                            , condition = mkLeaf "always true"
                            }

rule_nevermatch = Labeled (Just "test rule never match")
                  MyRule { defeasors = []
                         , party     = lp
                         , deontic   = MustNot
                         , condition = mkLeaf "always false"
                         }

type RuleLabel = String

data Predicate = Pred String
               | Goto RuleLabel
  deriving (Eq, Show)

type ConditionTree a = Tree (Labeled (Maybe String) (Condition a))

data Condition a = MkCondition (Maybe String) (Inner a) (Maybe String)
  deriving (Eq, Show)

data Inner a = Any
             | Or
             | All
             | Union
             | Leaf a
             | Inner [Tree (Labeled (Maybe String) (Condition a))]
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
  toEnglish (MyRule defeasors p d c) =
    indent 4 (
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
  toEnglish "inSchedule1" = "set out in the First Schedule"
  toEnglish "inSchedule2" = "set out in the Second Schedule"
  toEnglish "inSchedule3" = "set out in the Third Schedule"
  toEnglish "inSchedule4" = "set out in the Fourth Schedule"
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
instance Defeasible (Labeled RuleLabel MyRule) where
  (Labeled xl xi) `subjectTo` (Labeled yl yi) = Labeled xl (xi { defeasors = (SubjectTo [yl]) : defeasors xi })

  -- in every rule x which is notwithstanding y,
  -- rewrite to say that y is subject to x
  normalize_1 = id

  -- there is an order of evaluation in the defeasors, so maybe we
  -- can't actually merge all SubjectTo etc together.

instance {-# OVERLAPPING #-} (NLG a, NLG b) => NLG (Labeled (Maybe a) b) where
  toEnglish (Labeled (Just l) i) = toEnglish $ Labeled l i
  toEnglish (Labeled Nothing  i) = toEnglish i

instance {-# OVERLAPPABLE #-} (NLG a, NLG b) => NLG (Labeled a b) where
  toEnglish (Labeled l i)        = toEnglish l <> ":" <+> toEnglish i

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

instance (NLG a, NLG b, Show a, Show b) => NLG (Tree (Labeled a (Condition b))) where
  toEnglish (Node (Labeled a (MkCondition pre Any               post)) children) = toEnglish a <> enlist ";" Nothing      children (pre <> Just "any of the following") post
  toEnglish (Node (Labeled a (MkCondition pre Or                post)) children) = toEnglish a <> enlist ";" (Just "or")  children pre post
  toEnglish (Node (Labeled a (MkCondition pre All               post)) children) = toEnglish a <> enlist ";" Nothing      children (pre <> Just "all of the following") post
  toEnglish (Node (Labeled a (MkCondition pre Union             post)) children) = toEnglish a <> enlist ";" (Just "and") children pre post
  toEnglish (Node (Labeled a (MkCondition pre (Leaf  b)         post)) [])       = toEnglish a <> toEnglish pre <> toEnglish b <> toEnglish post
  toEnglish (Node (Labeled a (MkCondition pre (Inner condtrees) post)) [])       = toEnglish a <> toEnglish pre <+> toEnglishList condtrees <+> toEnglish post
  toEnglish (Node (Labeled a (MkCondition pre (Leaf  b)         post)) children) = error ("leaf node " ++ (show b) ++ " should have no children! " ++ show children)
  toEnglish (Node (Labeled a (MkCondition pre (Inner b)         post)) children) = error ("inner node " ++ (show b) ++ " should have no children! " ++ show children)

mkLeaf x = Node (Labeled Nothing $ MkCondition Nothing (Leaf $ Pred x) Nothing) []

rule34_1 = Labeled (Just "rule 34.1")
  MyRule { defeasors = []
         , party = lp
         , deontic = MustNot
         , condition = Node (Labeled (Just "34.1")
                             (MkCondition
                              (Just "a legal practitioner must not accept any executive appointment associated with ")
                              Any Nothing))
                       [ Node (Labeled (Just "34.1.a")
                               (MkCondition
                                (Just "any business which") Or (Just "the dignity of the legal profession") ))
                         [mkLeaf "detractsFrom"
                         ,mkLeaf "isIncompatibleWith"
                         ,mkLeaf "derogatesFrom"
                         ]
                       , Node (Labeled (Just "34.1.b")
                               (MkCondition (Just "any business which materially interferes with") Or Nothing))
                         [mkLeaf "primaryOccupation(LP)"
                         ,mkLeaf "availability(LP)"
                         ,mkLeaf "representationOfClients(LP)"
                         ]
                       , Node (Labeled (Just "34.1.c")
                               (MkCondition (Just "any business which is ")
                                (Leaf $ Pred "unfairlyAttractive")
                               Nothing)) []
                       , Node (Labeled (Just "34.1.d")
                               (MkCondition (Just "any business which involves")
                               Or (Just "any unauthorised person for legal work performed by the legal practitioner")))
                               [mkLeaf "feeSharing(LP)"
                               ,mkLeaf "commission"]
                       , Node (Labeled (Just "34.1.e")
                               (MkCondition (Just "any business which is ")
                                (Leaf $ Pred "inSchedule1")
                               Nothing)) []
                       ]
         }

ruleBase = Map.fromList $ (\(Labeled (Just l) r) -> (l, r)) <$>
  [ rule34_1
  ]
