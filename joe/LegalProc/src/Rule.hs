{-# LANGUAGE
  DuplicateRecordFields, LambdaCase,
  OverloadedRecordDot, OverloadedRecordUpdate
#-}

module Rule where

import Data.Kind
import GHC.Generics (Generic)

import Data.Hashable (Hashable)
import Data.HashMap.Strict qualified as HM
import Data.HashSet qualified as HS
import Flow

import Utils

data Rule :: Type where
  Rule ::
    { name :: String,
      -- B predicate for determining which actors a rule instance can be
      -- attached to.
      posibleActors :: String,
      initialActors :: String,
      deontic :: Deontic,
      event :: Event,
      onDone :: Effects,
      onTimeout :: Effects
    } ->
    Rule
  deriving (Eq, Generic, Ord, Read, Show)

-- data CspB :: Type where
--   CspB ::
--     { csp :: String,
--       b :: String
--     } ->
--     CspB
--   deriving (Eq, Generic, Ord, Read, Show)

-- rule2CspB :: Rule -> CspB
-- rule2CspB rule@(Rule {event}) = CspB {csp, b}
--   where
--     csp = mconcat [
--         header, rule.ruleName, event.eventName, show event.initialTimerVal, ")"
--       ]
--     header = case (rule.deontic, rule.event.timerType) of
--       (isCompensable -> True, PreEmptive) -> "CPreRule("
--       (Ob NonCompensable, PreEmptive) -> "NCPreOb("
--       _ -> error "Not supported yet."
--     b = error "TODO"

type Actor = String

data Compensability :: Type where
  Compensable :: Compensability
  NonCompensable :: Compensability
  deriving (Eq, Generic, Ord, Read, Show)

data Deontic :: Type where
  Ob :: Compensability -> Deontic
  Prohib :: Compensability -> Deontic
  Perm :: Deontic
  deriving (Eq, Generic, Ord, Read, Show)

isCompensable :: Deontic -> Bool
isCompensable deon = deon `elem` xs
  where
    xs = [Ob, Prohib, const Perm] <*> [Compensable]

data Event :: Type where
  Event ::
    { name :: String,
      isPreemptive :: Bool,
      initialTimerVal :: Int
    } ->
    Event
  deriving (Eq, Generic, Ord, Read, Show)

data Effects :: Type where
  Effects ::
    { triggers :: String,
      discharges :: String
    } ->
    Effects
  deriving (Eq, Generic, Ord, Read, Show)

instance Hashable Compensability
instance Hashable Deontic
instance Hashable Event
instance Hashable Rule
instance Hashable Effects