module GraphTypes where

-- | Taken from L4.Syntax
data Val
    = BoolV Bool
    | IntV Integer
    | FloatV Float
    | StringV String
    -- TODO: instead of RecordV, introduce RecordE in type Expr
    -- | RecordV ClassName [(FieldName, Val)]
    | ErrV
  deriving (Eq, Ord, Show)

type ESArg = Val
type ESBinding = Val

-- | Logical Predicates
data ESPred = ESPred String [ESArg] ESRule      
              -- ^ Recursive
    deriving (Eq, Show)

-- | Rules
data ESRule = ESRule String [ESBinding] [ESPred]
    deriving (Eq, Show)



outcome :: ESPred
outcome = 
    ESPred "Investment" [StringV "Adam", StringV "Stocks"] (
        ESRule "AccAdIncAd" [StringV "Adam"] [
            ESPred "Savings_account" [StringV "Adam", StringV "Adequate"] (
                ESRule "SavingsAd" [StringV "Adam", IntV 22000, IntV 2] [
                    ESPred "Amount_saved" [StringV "Adam", IntV 22000] (
                        ESRule "Amount_savedAdam" [] [])
                  , ESPred "Dependents" [StringV "Adam", IntV 2] (
                      ESRule "DependentsAdam" [] [])])
          , ESPred "Income" [StringV "Adam", StringV "Adequate"] (
                ESRule "IncomeAd" [StringV "Adam", StringV "Adequate"] [
                    ESPred "Earnings" [StringV "Adam", IntV 25000, IntV 2] (
                        ESRule "EarningsAdam" [] [])
                  , ESPred "Dependents" [StringV "Adam", IntV 2] (
                        ESRule "DependentsAdam" [] [])])])