{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}

module Rule34 where

-- import Encoding
-- import LogicGates
import Prettyprinter
import Prettyprinter.Util
import Data.Maybe (maybeToList, fromJust)
import Data.Tree
import qualified Data.Map as Map
import qualified Data.Text as Text

import Defeasible

data MyRule = MyRule { rlabel    :: Label
                     , defeasors :: [Defeasor ParaNum]
                     , party     :: Party
                     , deontic   :: Deontic
                     , condition :: ConditionTree Predicate
                     }
              deriving (Eq, Show)

rule_alwaysmay = MyRule { rlabel    = mkLabel (Just "Test1", Just "test rule always true, may", PSnormal)
                        , defeasors = []
                        , party     = lp
                        , deontic   = May
                        , condition = mkLeaf "0.1" "alwaysTrue"
                        }

rule_alwaysmustnot = MyRule { rlabel    = mkLabel(Just "Test2", Just "test rule always true, mustnot", PSnormal)
                            , defeasors = []
                            , party     = lp
                            , deontic   = MustNot
                            , condition = mkLeaf "0.2" "alwaysTrue"
                            }

rule_nevermatch = MyRule { rlabel = mkLabel(Just "Test3", Just "test rule never match", PSnormal)
                         , defeasors = []
                         , party     = lp
                         , deontic   = MustNot
                         , condition = mkLeaf "0.3" "alwaysFalse"
                         }

data Label = MkLabel { paraNum  :: Maybe ParaNum
                     , predTerm :: Maybe String
                     , pStyle   :: ParaStyle
                     }
           deriving (Eq, Show)
data ParaStyle = PSnormal | PSheader | PShidden
  deriving (Eq, Show)
mkLabel :: (Maybe ParaNum, Maybe String, ParaStyle) -> Label
mkLabel (x, y, z) = MkLabel x y z

type ParaNum = String
type PredicateTerm = String
data Predicate = Pred PredicateTerm
               | Goto ParaNum
  deriving (Eq, Show)

type ConditionTree a = Tree (Condition a)
data Condition a = MkCondition { clabel :: Label
                               , cPre   :: Maybe String
                               , inner  :: Inner a
                               , cPost  :: Maybe String }
  deriving (Eq, Show)

data Inner a = Any
             | Or
             | All
             | Union | UnionComma
             | Compl -- allows chaining of conditions as a sugary version of "union", where we use complements to express in-place quantifiers -- see 8.8 of the GF book.
             | Leaf a
             deriving (Eq, Show)

type Party = String
lp :: Party
lp = "Legal Practitioner"

data Deontic = MustNot | May
  deriving (Eq, Show)


-- we pretend we have queried the user and received certain answers.
answers :: Map.Map PredicateTerm (Maybe Bool)
answers = Map.fromList [("alwaysTrue",        Just True)
                       ,("alwaysFalse",       Just False)
                       ,("detractsFrom",      Just False)
                       ,("isIncompatibleWith",Just False)
                       ,("derogatesFrom",     Just True)
                       ]


class (Show x) => NLG x where
  toEnglish :: x -> Doc ann
  toEnglish = viaShow
  toEnglishList :: [x] -> Doc ann
  toEnglishList [] = mempty
  toEnglishList xs = vsep (toEnglish <$> xs)
  dashFor :: x -> Doc ann
  dashFor x = "default dashfor " <> viaShow x

instance NLG MyRule where
  toEnglish (MyRule l defeasors p d condtree) =
    dashFor l <> toEnglish l <> line
    <> toEnglishList defeasors
    <> toEnglish condtree
  toEnglishList rs = vsep (toEnglish <$> rs)

instance (NLG b, Show b) => NLG (ConditionTree b) where
  toEnglish (Node (MkCondition l pre Any        post) children) = toEnglish l <> enlist semi Nothing      children (pre <> Just "any of the following") post <> "."
  toEnglish (Node (MkCondition l pre Or         post) children) = toEnglish l <> enlist semi (Just "or")  children pre post
  toEnglish (Node (MkCondition l pre All        post) children) = toEnglish l <> enlist semi Nothing      children (pre <> Just "all of the following") post
  toEnglish (Node (MkCondition l pre Union      post) children) = toEnglish l <> enlist semi (Just "and") children pre post
  toEnglish (Node (MkCondition l pre UnionComma post) children) = toEnglish l <> enlist comma (Just "and") children pre post
  toEnglish (Node (MkCondition l pre Compl      post) children) = toEnglish l <> enlist emptyDoc Nothing   children pre post
  toEnglish (Node (MkCondition l pre (Leaf  b)  post) [])       = toEnglish l <> toEnglish pre <> toEnglish b <> toEnglish post
  toEnglish (Node (MkCondition l pre (Leaf  b)  post) children) = error ("leaf node " ++ (show b) ++ " should have no children! " ++ show children)

enlist :: (NLG a) => Doc ann -> Maybe String -> [ConditionTree a] -> Maybe String -> Maybe String -> Doc ann
-- todo: omit the last separator in the list
enlist separator conjunction middle front back =
  let frontPart = maybe [] (\f -> [toEnglish f <> ":-"]) front
      indentMiddle = if length frontPart /= 0 then 0 else 0
      listLength = length middle
  in
  vsep (frontPart
        ++ (indent indentMiddle <$> (addConjunction listLength separator conjunction ( dashPrefix <$> middle )))
        ++ (toEnglish <$> maybeToList back))
  where
    dashPrefix :: (NLG a) => ConditionTree a -> Doc ann
    dashPrefix x = (dashFor $ clabel $ rootLabel x) <> toEnglish x

addConjunction :: Int -> Doc ann -> Maybe String -> [Doc ann] -> [Doc ann]
addConjunction len separator (Just c) [y, z]
  | len >= 3  = [y <> separator <+> pretty c, z]
  | otherwise = [y              <+> pretty c, z]
addConjunction _ separator _ [z]    = [z]
addConjunction _ separator _ []     = []
addConjunction l separator (Just c) (x:xs) = x <> separator : addConjunction l separator (Just c) xs
addConjunction l separator Nothing  (x:xs) = x <> separator : addConjunction l separator Nothing xs

instance NLG Label where
  toEnglish (MkLabel (Just l) _       PSheader) = toEnglish l <> line
  toEnglish (MkLabel  _       _       PShidden) = emptyDoc
  toEnglish (MkLabel  _      (Just l) _       ) = toEnglish l
  toEnglish (MkLabel  _       Nothing _       ) = emptyDoc
  dashFor   (MkLabel  _       _       PShidden) = emptyDoc
  dashFor   (MkLabel (Just l) _       PSheader) = dots2stars l <> " "
  dashFor   (MkLabel (Just l) _       PSnormal) = "- "
  dashFor   (MkLabel Nothing Nothing  PSnormal) = "- "
  dashFor   (MkLabel Nothing (Just _) PSheader) = "- "
  dashFor   _                                   = emptyDoc
  -- todo: add a State monad to allow counting up, so "- " becomes "(i) ", "(ii) ", "(iii) " etc.

dots2stars :: (NLG a) => a -> Doc ann
dots2stars x = pretty $ replicate (length (filter (=='.') (show $ toEnglish x))) '*'

instance (Show pn, NLG pn) => NLG (Defeasor pn) where
  toEnglish (Notwithstanding rls) = "notwithstanding" <+> toEnglishList rls
  toEnglish (SubjectTo       rls) = "subject to"      <+> toEnglishList rls
  toEnglish (Despite         rls) = "despite"         <+> toEnglishList rls
  toEnglishList ds = hsep $ punctuate comma (toEnglish <$> ds)

-- is there some sort of generic deriving available for this?
instance (NLG x) => NLG (Maybe x) where
  toEnglish Nothing = emptyDoc
  toEnglish (Just x) = toEnglish x

instance NLG Predicate where
  toEnglish (Pred p) = toEnglish p
  toEnglish (Goto r) = toEnglish (ruleBase Map.! r)

-- instance NLG (ParaNum, PredicateTerm) where
--     | dashFor (show x) == "\"\"" = emptyDoc
--     | otherwise          = line <> dots2stars x <> " "

instance NLG PredicateTerm where
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
  toEnglish "theAct" = "the Act"
  toEnglish "theseRules" = "these Rules"
  toEnglish "otherSubsidiary" = "any other subsidiary legislation made under the Act"
  toEnglish "practiceDirections" = "practice directions"
  toEnglish "guidanceNotes" = "guidance notes"
  toEnglish "rulings" = "rulings"
  toEnglish "theCouncil" = "the Council"
  toEnglish "theSociety" = "the Society"
  toEnglish x = pretty x

mkLI     y = mkNode $ MkCondition (mkLabel (Nothing, Nothing, PSnormal)) Nothing (Leaf $ Pred y) Nothing
mkLeaf x y = mkNode $ MkCondition (mkLabel (Just x,  Nothing, PSheader)) Nothing (Leaf $ Pred y) Nothing
mkPred x y = mkNode $ MkCondition (mkLabel (Just x,  Just y,  PSnormal)) Nothing (Leaf $ Pred x) Nothing

mkNode x = Node x []

{- the user-facing syntax for this is ultimately relational. In Prolog it would look like:

34_1_d("34.1.d", mustNot, B, LP, P) :-
  business(B), legalPractitioner(LP), person(P,unauthorised),
  involves(B, Naughtiness, for, work(legal, performedBy(LP))),
  ( Naughtiness = feeSharing(P)
  ; Naughtiness = commissionPaymentTo(P)
  ).

-}


rule34_1 :: MyRule
rule34_1 =
  MyRule { rlabel = mkLabel (Just "34.1", Nothing, PSheader)
         , defeasors = []
         , party = lp
         , deontic = MustNot
         , condition = Node (MkCondition
                              (mkLabel (Just "34.1", Just "Toplevel 34.1", PShidden))
                              (Just "a legal practitioner must not accept any executive appointment associated with ")
                              Any Nothing)
                       [ Node (MkCondition
                               (mkLabel (Just "34.1.a", Just "IncompatibleDignity", PSheader))
                               (Just "any business which") Or (Just "the dignity of the legal profession") )
                         [mkLI "detractsFrom"
                         ,mkLI "isIncompatibleWith"
                         ,mkLI "derogatesFrom"
                         ]
                       , Node (MkCondition
                               (mkLabel (Just "34.1.b", Just "MateriallyInterferes", PSheader))
                               (Just "any business which materially interferes with") Or Nothing)
                         [mkLI "primaryOccupation(LP)"
                         ,mkLI "availability(LP)"
                         ,mkLI "representationOfClients(LP)"
                         ]
                       , Node (MkCondition
                               (mkLabel (Just "34.1.c", Just "UnfairAttractBusiness", PSheader))
                               (Just "any business which is ")
                               (Leaf $ Pred "unfairlyAttractive")
                               Nothing) []
                       , Node (MkCondition
                               (mkLabel (Just "34.1.d", Just "ShareLPRFees", PSheader))
                               (Just "any business which involves")
                               Or (Just "any unauthorised person for legal work performed by the legal practitioner"))
                               [mkLI "feeSharing(LP)"
                               ,mkLI "commission"]
                       , Node (MkCondition
                               (mkLabel (Just "34.1.e", Just "BusinessFirstSchedule", PSheader))
                               (Just "any business ")
                                (Leaf $ Pred "inSchedule1")
                               Nothing) []
                       , Node (MkCondition
                                (mkLabel (Just "34.1.f", Just "ProhibitedBusiness", PSheader))
                                (Just "any business which is prohibited by")
                                Or Nothing)
                         [mkLeaf "34.1.f.i" "theAct"
                         ,Node (MkCondition
                                (mkLabel (Just "34.1.f.ii", Nothing, PSheader))
                                 Nothing Or Nothing)
                          [mkLI "theseRules"
                          ,mkLI "otherSubsidiary"]
                         ,Node (MkCondition
                                (mkLabel (Just "34.1.f.iii", Nothing, PSheader))
                                (Just "any") Union (Just "issued under section 71(6) of the Act"))
                           [mkLI "practiceDirections"
                           ,mkLI "guidanceNotes"
                           ,mkLI "rulings"]
                         ,Node (MkCondition
                                (mkLabel (Just "34.1.f.iv", Nothing, PSheader))
                                Nothing Compl Nothing)
                           [Node (MkCondition
                                  (mkLabel (Nothing, Nothing, PSheader))
                                  (Just "any") UnionComma Nothing)
                                  [mkLI "practiceDirections"
                                  ,mkLI "guidanceNotes"
                                  ,mkLI "rulings"]
                           ,Node (MkCondition
                                  (mkLabel (Nothing, Nothing, PSheader))
                                  (Just "(relating to") UnionComma (Just ")"))
                            [mkLI "professional practice"
                            ,mkLI "etiquette"
                            ,mkLI "conduct"
                            ,mkLI "discipline"]
                           ,Node (MkCondition
                                  (mkLabel (Nothing, Nothing, PSheader))
                                  (Just "issued by") Or Nothing)
                           [mkLI "theCouncil"
                           ,mkLI "theSociety"]
                           ]
                         ]
                       ]
         }

-- todo: rule34_2 etc

ruleBase = Map.fromList $ (\r -> (fromJust . paraNum . rlabel $ r, r)) <$>
  [ rule34_1
  ]

as_org = putDocW 120 (org_prefix <> line <>
                      toEnglish rule34_1 <> line)

org_prefix = "#+TITLE: Rule 34 as Org\n#+OPTIONS: num:nil toc:nil" <> line



