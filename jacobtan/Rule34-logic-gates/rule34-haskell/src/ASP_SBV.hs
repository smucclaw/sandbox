module ASP_SBV where

import Data.SBV

-- asp :: SymbolicT IO SBool
asp :: Symbolic SBool -- synonymous to above

asp = do

  -- declare terms
  p <- sBool "p"
  q <- sBool "q"
  s <- sBool "s"
  f <- sBool "f"

  constrain $ sNot q .=> s
  constrain $ sNot s .=> q
  constrain $ q .&& sNot s .=> p
  constrain $ s .&& sNot f .=> f
  -- constrain $ q .=> sNot s

  return sTrue


rule34_SMT_sandbox :: IO ()
rule34_SMT_sandbox = sat asp >>= print

main :: IO ()
main = rule34_SMT_sandbox

-- | If without constraints, long wait and many solutions.
mainAllSat :: IO ()
mainAllSat = allSat asp >>= print

mainAllSatWith :: IO ()
-- mainAllSatWith = allSatWith z3{transcript = Just "ASP_SBV_z3-generated.smtlib"} asp >>= print
mainAllSatWith = allSatWith z3{verbose = True} asp >>= print

{-
*Rule34_SBV PPrint> mainAllSat 

[ stable model {p, q} is covered by the following 3 SAT solutions ]

Solution #1:
  p =  True :: Bool
  q =  True :: Bool
  s = False :: Bool
  f = False :: Bool
Solution #4:
  p = True :: Bool
  q = True :: Bool
  s = True :: Bool
  f = True :: Bool
Solution #5:
  p =  True :: Bool
  q =  True :: Bool
  s = False :: Bool
  f =  True :: Bool

[ {s = True, f = False}, is not possible due to ( f <- s, not f ) ]

Solution #2:
  p = False :: Bool
  q = False :: Bool
  s =  True :: Bool
  f =  True :: Bool
Solution #3:
  p = False :: Bool
  q =  True :: Bool
  s =  True :: Bool
  f =  True :: Bool
Solution #6:
  p =  True :: Bool
  q = False :: Bool
  s =  True :: Bool
  f =  True :: Bool
Found 6 different solutions.
-}