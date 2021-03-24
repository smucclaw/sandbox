{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE DeriveFoldable #-}
{-# LANGUAGE DeriveFunctor #-}

module SDDDtemp where

import Data.HashMap.Lazy (HashMap)
import Data.Function ((&))

main :: IO ()
main = do
  let sMath = mkSMath
  print sMath
  print $ sEval sMath
  
-- let us say:
-- the magic number is 7.
-- rule 1: persons whose names start with "a" and are above the age of the magic number
--         are allowed to buy chocolate ice cream on Thursdays.
-- rule 2: persons whose names start with "b" above the age of the magic number times 3
--         are allowed to buy vanilla ice cream on any day.

-- data Rule = MkRule QualifyingEntity DeonticExpr ActionExpr WhenWorld
--             deriving (Show, Read, Eq)

-- data QualifyingEntity = MkQE Entity EntQualifier
--             deriving (Show, Read, Eq)

-- er, how to make this a Showable?
-- This is a classic question -- how to make a function Showable -- and the answer is … code is data … hence Greenspun's Tenth

-- type EntQualifier = World -> Entity -> Bool

-- data Entity = EPerson person
--             | EIceCream IceCream
--             deriving (Show, Read, Eq)

-- data DeonticExpr = DMust | DMay | DShant
--             deriving (Show, Read, Eq)

-- data ActionExpr = MkAE ActionLabel ActionQualifier
--             deriving (Show, Read, Eq)

-- type ActionLabel = String

-- type ActionQualifier = World -> ActionDetails -> Bool

-- type ActionDetails = HashMap String String -- or something like Aeson

-- type WhenWorld = World -> TemporalQualifier -> Bool



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
intVars :: HashMap String Int = [("magic number", 7)]

data Person = Person { personName :: String, personDob :: Date }

age :: Date -> Date -> Int
age dob@(Date y0 m0 d0) today@(Date y1 m1 d1) =
  (-) <$> today <*> dob
  & \(Date dy dm dd) -> if
      | dm > 0 -> dy
      | dm == 0 -> if dd >= 0 then dy else dy - 1
      | otherwise -> dy - 1

data GenericDate a = Date a a a -- YYYY MM DD
  deriving (Show, Foldable, Functor)
instance Applicative GenericDate where
  pure x = Date x x x
  Date y0 m0 d0 <*> Date y1 m1 d1 = Date (y0 y1) (m0 m1) (d0 d1)
type Date = GenericDate Int

data IceCream = ChocolateIceCream | VanillaIceCream

data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun

data MathExpr = MathOp2 MathExpr MathOp2 MathExpr
              | MathLitInt Int
              | MathLitFloat Double
              deriving (Show, Read, Eq)

--2 use Double for parameter b in the typeclass
instance Double ~ b => SEvalable MathExpr b where
  sEval (MathOp2 x MPlus   y) = sEval x + sEval y
  sEval (MathOp2 x MMinus  y) = sEval x - sEval y
  sEval (MathOp2 x MTimes  y) = sEval x * sEval y
  sEval (MathOp2 x MDivide y) = sEval x / sEval y
  sEval (MathLitInt x)        = fromIntegral x
  sEval (MathLitFloat x)      = x

data MathOp2 = MPlus
             | MMinus
             | MTimes
             | MDivide
             deriving (Show, Read, Eq)

mkSMath = MathOp2 (MathLitInt 2) MPlus (MathLitInt 3)

--1 add parameter b to the typeclass (and {-# LANGUAGE MultiParamTypeClasses #-})
class SEvalable a b where
  sEval :: (Show b) => a -> b

