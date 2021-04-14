module Rule34 where

-- import Encoding
-- import LogicGates
import Data.Tree
import qualified Data.Map as Map

data MyRule = MyRule { label :: String
                     , defeasors :: [Defeasor]
                     , party :: Party
                     , deontic :: Deontic
                --   , action :: Action
                     , condition :: Tree (Condition Predicate)
                     , pre       :: Maybe String
                     , post      :: Maybe String
                     }
              deriving (Eq, Show)

class MyShow x where
  myshow :: x -> String

type Party = String
lp :: Party
lp = "Legal Practitioner"

data Deontic = MustNot | May
  deriving (Eq, Show)

data Defeasor = Notwithstanding [MyRule]
              | SubjectTo       [MyRule]
              | Despite         [MyRule]
              deriving (Show, Eq)

-- we pretend we have queried the user and received certain answers.
answers :: Map.Map String (Maybe Bool)
answers = Map.fromList [("always true",       Just True)
                   ,("always false",      Just False)
                   ,("detractsFrom",      Just False)
                   ,("isIncompatibleWith",Just False)
                   ,("derogatesFrom",     Just True)
                   ]

ruleToEnglish :: MyRule -> String
ruleToEnglish r = "My Rule in English"

inEnglish :: String -> String
inEnglish "detractsFrom" = "detracts from"
inEnglish "isIncompatibleWith" = "is incompatible with"
inEnglish "derogatesFrom" = "derogates from"

data Condition a = Any
                 | Or
                 | All
                 | Union
                 | Leaf a
                 deriving (Eq, Show)

data Predicate = Pred String
  deriving (Eq, Show)

mkLeaf x = Node (Leaf $ Pred x) []

rule_alwaysmay = MyRule { label     = "test rule always true"
                        , defeasors = []
                        , party     = lp
                        , deontic   = May
                        , condition = Node (Leaf (Pred "always true")) []
                        , pre       = Nothing
                        , post      = Nothing
                        }
  
rule_alwaysmustnot = MyRule { label     = "test rule always true"
                            , defeasors = []
                            , party     = lp
                            , deontic   = MustNot
                            , condition = mkLeaf "always true"
                            , pre       = Nothing
                            , post      = Nothing
                            }

rule_nevermatch = MyRule { label     = "test rule never match"
                         , defeasors = []
                         , party     = lp
                         , deontic   = MustNot
                         , condition = mkLeaf "always false"
                         , pre       = Nothing
                         , post      = Nothing
                         }

rule34_1_a = MyRule { label     = "34.1.a undignified"
                    , defeasors = []
                    , party     = lp
                    , deontic   = MustNot 
                    , condition = Node Or [mkLeaf "detractsFrom"
                                          ,mkLeaf "isIncompatibleWith"
                                          ,mkLeaf "derogatesFrom"
                                          ]
                    , pre       = Nothing
                    , post      = Just "from the dignity of the legal profession"
                    }

-- toCircuitDiagram :: [MyRule] -> NodeList

