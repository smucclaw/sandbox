{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE MultiParamTypeClasses #-}

{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
module SDDD where

-- import Syntax (Program, ClassName)
-- import System.Environment ( getArgs, getEnv )
-- import System.IO ( stderr, hPutStr, hPutStrLn )
-- import System.IO.Error (catchIOError)
-- import Control.Exception (catch, SomeException (SomeException))


main :: IO ()
main = do
  let sMath = mkSMath
  print sMath
  print $ sEval @_ @Double sMath

-- let us say:
-- the magic number is 7.
-- rule 1: persons whose names start with "a" and are above the age of the magic number
--         are allowed to buy chocolate ice cream on Thursdays.
-- rule 2: persons whose names start with "b" above the age of the magic number times 3
--         are allowed to buy vanilla ice cream on any day.

-- to say this, we need the following semantics:
-- variable assignments: binding "magic number" to 7
-- mathematical arithmetic: multiply 7 by 3
-- entities/records: persons have names
-- enums: ice creams can be chocolate or vanilla
-- 

data MathExpr = MathOp2 MathExpr MathOp2 MathExpr
              | MathLitInt Int
              | MathLitFloat Double
              deriving (Show, Read, Eq)

instance b ~ Double => SEvalable MathExpr b where
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

class SEvalable a b where
  sEval :: (Show b) => a -> b

