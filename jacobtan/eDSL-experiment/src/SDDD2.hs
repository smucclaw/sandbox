{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE DeriveFunctor #-}

module SDDD2 where

import Data.HashMap.Lazy (HashMap, (!))
import Data.Time (fromGregorian)
import Data.Time.Calendar.WeekDate (toWeekDate)
import Data.Function ((&))

main :: IO ()
main = do
  print $ and @[] tests
  print tests
  
-- let us say:
-- the magic number is 7.
-- rule 1: persons whose names start with "a" and are above the age of the magic number
--         are allowed to buy chocolate ice cream on Thursdays.
-- rule 2: persons whose names start with "b" and are below the age of the magic number times 3
--         are allowed to buy vanilla ice cream on any day.

data Rule = MkRule EntQualifier DeonticExpr ActionExpr WhenWorld

rule1 :: Rule
rule1 = MkRule
        (\world (EPerson p) -> name_starts_with 'a' p &&
                               age (personDob p) (worldDate world) > intVars world ! "magic number")
        DMay
        (MkAE "buy" (\actionDetails -> actionDetails ! "IceCream" == "ChocolateIceCream"))
        (\world -> dateToDay (worldDate world) == Thu)

rule2 :: Rule
rule2 = MkRule
        (\world (EPerson p) -> name_starts_with 'b' p &&
                               age (personDob p) (worldDate world) < (intVars world ! "magic number") * 3)
        DMay
        (MkAE "buy" (\actionDetails -> actionDetails ! "IceCream" == "VanillaIceCream"))
        (const True)

rule_sugar :: Char -> ( (Int -> Int -> Bool)
                      , (Int->Int)
                      , (String, String)
                      , (DayOfWeek -> Bool)
                      ) -> Rule
rule_sugar ch (myord, mymul, (actionkey, flavour), daytest) =
        MkRule
        (\world (EPerson p) -> name_starts_with ch p &&
                               age (personDob p) (worldDate world) `myord` (mymul (intVars world ! "magic number")))
        DMay
        (MkAE "buy" (\actionDetails -> actionDetails ! actionkey == flavour))
        (\world -> daytest $ dateToDay (worldDate world))

ruleA :: Rule
ruleA = rule_sugar 'a' ((>), id, ("IceCream", "ChocolateIceCream"), (== Thu))
ruleB :: Rule
ruleB = rule_sugar 'b' ((<), (* 3), ("IceCream", "VanillaIceCream"), (const True))

rules = [rule1, rule2] :: [Rule] -- please don't tell me we need another @[]

-- er, how to make this a Showable?
-- This is a classic question -- how to make a function Showable -- and the answer is … code is data … hence Greenspun's Tenth
type EntQualifier = World -> Entity -> Bool

data Entity = EPerson Person
            -- | EIceCream IceCream -- comment out for now, to avoid warning

data DeonticExpr = DMust | DMay | DShant
  deriving (Show, Eq)

data ActionExpr = MkAE ActionLabel ActionQualifier

type ActionLabel = String

type ActionQualifier = ActionDetails -> Bool

type ActionDetails = HashMap String String -- or something like Aeson

type WhenWorld = World -> Bool

type IntVars = HashMap String Int

data World = World { intVars     :: IntVars
                   , worldDate   :: Date
                   }

name_starts_with :: Char -> Person -> Bool
name_starts_with ch person = head (personName person) == ch

tests = [ test_1_1, test_1_2, test_1_3, test_1_4
        , test_2_1, test_2_2, test_2_3 ]

test_1_1 :: Bool
test_1_1 = evalRule
              rule1
              (World { intVars   = [("magic number", 7)], worldDate = Date 2021 3 25 })
              (EPerson (Person "alice" (Date 1970 1 1)))
              [("IceCream", "ChocolateIceCream")]
           == Just DMay

test_1_2 :: Bool -- wrong name
test_1_2 = evalRule
              rule1
              (World { intVars   = [("magic number", 7)], worldDate = Date 2021 3 25 })
              (EPerson (Person "bob" (Date 1970 1 1)))
              [("IceCream", "ChocolateIceCream")]
           == Nothing

test_1_3 :: Bool -- wrong date
test_1_3 = evalRule
              rule1
              (World { intVars   = [("magic number", 7)], worldDate = Date 2021 3 26 })
              (EPerson (Person "alice" (Date 1970 1 1)))
              [("IceCream", "ChocolateIceCream")]
           == Nothing

test_1_4 :: Bool -- wrong flavour
test_1_4 = evalRule
              rule1
              (World { intVars   = [("magic number", 7)], worldDate = Date 2021 3 26 })
              (EPerson (Person "alice" (Date 1970 1 1)))
              [("IceCream", "VanillaIceCream")]
           == Nothing

-- rule 2: persons whose names start with "b" and are below the age of the magic number times 3
--         are allowed to buy vanilla ice cream on any day.

test_2_1 :: Bool -- wrong name
test_2_1 = evalRule
              rule2
              (World { intVars   = [("magic number", 7)], worldDate = Date 2021 3 25 })
              (EPerson (Person "alice" (Date 2020 1 1)))
              [("IceCream", "VanillaIceCream")]
           == Nothing

test_2_2 :: Bool -- right name, any day
test_2_2 = evalRule
              rule2
              (World { intVars   = [("magic number", 7)], worldDate = Date 2021 3 26 })
              (EPerson (Person "bob" (Date 2020 1 1)))
              [("IceCream", "VanillaIceCream")]
           == Just DMay

test_2_3 :: Bool -- wrong date
test_2_3 = evalRule
              rule2
              (World { intVars   = [("magic number", 7)], worldDate = Date 2021 3 26 })
              (EPerson (Person "alice" (Date 2020 1 1)))
              [("IceCream", "VanillaIceCream")]
           == Nothing

evalRule :: Rule -> World -> EntityScenario -> ActionDetails -> Maybe DeonticExpr
evalRule (MkRule eq de (MkAE aelabel aeq) ww) world entity actionDetails =
     if eq world entity && ww world && aeq actionDetails
     then Just de
     else Nothing

type EntityScenario = Entity

-- to say this, we need the following semantics:
-- variable assignments: binding "magic number" to 7
-- mathematical arithmetic: multiply 7 by 3
-- entities/records: persons have names … and ages
-- enums/sum types: ice creams can be chocolate or vanilla
-- deontics: an entity may or may not do something when a predicate is met
-- predicates: given a world, return a boolean
-- temporals: dates - weekdays -- etc
-- temporals: calculate the age based on record date-of-birth

-- -XOverloadedLists !
intVars' :: IntVars = [("magic number", 7)]

data Person = Person { personName :: String, personDob :: Date }

age :: Date -> Date -> Int
age dob@(Date y0 m0 d0) today@(Date y1 m1 d1) =
  (-) <$> today <*> dob
  & \(Date dy dm dd) -> if
      | dm > 0 -> dy
      | dm == 0 -> if dd >= 0 then dy else dy - 1
      | otherwise -> dy - 1

data GenericDate a = Date a a a -- YYYY MM DD
  deriving (Show, Functor)
instance Applicative GenericDate where
  pure x = Date x x x
  Date y0 m0 d0 <*> Date y1 m1 d1 = Date (y0 y1) (m0 m1) (d0 d1)
type Date = GenericDate Int

data IceCream = ChocolateIceCream | VanillaIceCream

data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving Eq

dateToDay :: Date -> DayOfWeek
dateToDay (Date y m d) = case let (_,_,day) = toWeekDate $ fromGregorian (fromIntegral y) m d in day of
                         1 -> Mon
                         2 -> Tue
                         3 -> Wed
                         4 -> Thu
                         5 -> Fri
                         6 -> Sat
                         _ -> Sun

