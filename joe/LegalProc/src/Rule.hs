-- {-# LANGUAGE ConstraintKinds #-}
-- {-# LANGUAGE DataKinds #-}
-- {-# LANGUAGE DeriveGeneric #-}
-- {-# LANGUAGE FlexibleContexts #-}
-- {-# LANGUAGE FlexibleInstances #-}
-- {-# LANGUAGE GADTs #-}
-- {-# LANGUAGE ImportQualifiedPost #-}
-- {-# LANGUAGE MultiParamTypeClasses #-}
-- {-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedRecordDot, OverloadedRecordUpdate #-}
-- {-# LANGUAGE RecordWildCards #-}
-- {-# LANGUAGE ScopedTypeVariables #-}
-- {-# LANGUAGE StandaloneDeriving #-}
-- {-# LANGUAGE KindSignatures #-}
-- {-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE ViewPatterns #-}

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
    { ruleName :: String,
      -- B predicate for determining which actors a rule instance can be
      -- attached to.
      posibleActors :: String,
      deontic :: Deontic,
      event :: Event
    } ->
    Rule
  deriving (Eq, Generic, Ord, Read, Show)

data CspB :: Type where
  CspB ::
    { csp :: String,
      b :: String
    } ->
    CspB
  deriving (Eq, Generic, Ord, Read, Show)

rule2CspB :: Rule -> CspB
rule2CspB rule@(Rule {event}) = CspB {csp, b}
  where
    csp = mconcat [
        header, rule.ruleName, event.eventName, show event.initialTimerVal, ")"
      ]
    header = case (rule.deontic, rule.event.timerType) of
      (isCompensable -> True, PreEmptive) -> "CPreRule("
      (Ob NonCompensable, PreEmptive) -> "NCPreOb("
      _ -> error "Not supported yet."
    b = error "TODO"

{- Format for B events:
  request_principal(is_done, actor) =
    PRE
      event_guard_defeasible
    THEN
      active_rules := active_rules \ {(RequestPrincipal, actor)} ||
      IF is_done = TRUE THEN
        rules_to_trigger := rules_to_trigger \/ (
          {SendPrincipal} <| rule_actors
        )
      ELSE
        skip
      END
    END;
-}

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
isCompensable = (`elem` xs)
  where
    xs = [Ob, Prohib, const Perm] <*> [Compensable]

data Event :: Type where
  Event ::
    { eventName :: String,
      actor :: Actor,
      timerType :: TimerType,
      initialTimerVal :: Int,
      onDone :: TriggersInterrupts,
      onTimeout :: TriggersInterrupts
    } ->
    Event
  deriving (Eq, Generic, Ord, Read, Show)

data TriggersInterrupts :: Type where
  TriggersInterrupts ::
    { triggers :: HS.HashSet String,
      interrupts :: HS.HashSet String
    } ->
    TriggersInterrupts
  deriving (Eq, Generic, Ord, Read, Show)

data TimerType :: Type where
  PreEmptive :: TimerType
  NonPreEmptive :: TimerType
  deriving (Eq, Generic, Ord, Read, Show)

instance Hashable Compensability
instance Hashable CspB
instance Hashable Deontic
instance Hashable Event
instance Hashable Rule
instance Hashable TimerType
instance Hashable TriggersInterrupts