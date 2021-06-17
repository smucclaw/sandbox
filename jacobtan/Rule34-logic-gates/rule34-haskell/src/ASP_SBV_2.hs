{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TemplateHaskell #-}

{-# LANGUAGE ScopedTypeVariables #-}

module ASP_SBV_2 where

import Data.SBV

data Person = Dilbert

mkSymbolicEnumeration ''Person

-- asp :: SymbolicT IO SBool
asp :: Symbolic SBool -- synonymous to above

asp = do

  -- -- declare atoms
  -- a <- sBool "a"
  -- b <- sBool "b"
  -- c <- sBool "c"
  
  -- constrain $ sNot b .=> a
  -- constrain $ c .=> b
  -- constrain $ b .=> c

  ------

  -- dilbert example, ASP Primer p15

  let man x = x .== sDilbert

  x :: SPerson <- forall "x"
  -- x :: SPerson <- exists "x"
  -- let x = free_ :: Symbolic (SBV Person)

  marDilbert :: SBool <- exists "mar(Dilbert)"
  let mar x = symbolicMerge True (x .== sDilbert) marDilbert sFalse
  husDilbert :: SBool <- exists "hus(Dilbert)"
  let hus x = symbolicMerge True (x .== sDilbert) husDilbert sFalse
  sinDilbert :: SBool <- exists "sin(Dilbert)"
  let sin x = symbolicMerge True (x .== sDilbert) sinDilbert sFalse

  constrain $ mar x .&& man x .=> hus x
  constrain $ sNot (hus x) .&& man x .=> sin x

  return sTrue


rule34_SMT_sandbox :: IO ()
rule34_SMT_sandbox = sat asp >>= print

main :: IO ()
main = rule34_SMT_sandbox

-- | If without constraints, long wait and many solutions.
mainAllSat :: IO ()
mainAllSat = allSat asp >>= print

mainAllSatVerbose :: IO ()
mainAllSatVerbose = allSatWith z3{verbose = True} asp >>= print

mainAllSatOutput :: IO ()
mainAllSatOutput = allSatWith z3{transcript = Just "ASP_SBV_2_z3-generated.smtlib"} asp >>= print
