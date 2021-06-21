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



  marDilbert :: SBool <- exists "mar(Dilbert)"
  husDilbert :: SBool <- exists "hus(Dilbert)"
  sinDilbert :: SBool <- exists "sin(Dilbert)"
  x :: SPerson <- forall "x"

  -- x :: SPerson <- exists "x"
  -- let x = free_ :: Symbolic (SBV Person)

  let mar x = symbolicMerge True (x .== sDilbert) marDilbert sFalse
  let hus x = symbolicMerge True (x .== sDilbert) husDilbert sFalse
  let sin x = symbolicMerge True (x .== sDilbert) sinDilbert sFalse

  let man p = p .== sDilbert
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
