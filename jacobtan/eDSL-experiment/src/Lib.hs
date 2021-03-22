{-# LANGUAGE GADTs #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TypeFamilies #-}

module Lib
  ( someFunc
  ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

data LitKind = NonLit | Lit
data NAF'Kind = NAFed | NotNAFed

class CExpr (a :: LitKind)
instance CExpr NonLit
instance CExpr Lit

class CExpr a => CLit a
instance CLit Lit

type family MostNAF m n where
  MostNAF NotNAFed NotNAFed = NotNAFed
  MostNAF _ _ = NAFed

data SCASP (l :: LitKind) (n :: NAF'Kind) where
  -- literals
  P1 :: SCASP Lit NotNAFed
  P2 :: SCASP Lit NotNAFed
  -- And produces a non-literal.
  --   If one of the arguments is NAFed,
  --   the entire expression is considered as NAFed.
  And :: SCASP a m -> SCASP b n -> SCASP NonLit (MostNAF m n)
  -- NAF requires literal input.
  --   NAF only accepts a NotNAFed argument.
  --   State of being NAFed is represented in the type.
  NAF :: CLit a => SCASP a NotNAFed -> SCASP a NAFed
  -- Not does not alter "literal-ness"
  --   Neg only accepts a NotNAFed argument.
  Neg :: SCASP a NotNAFed -> SCASP a m

example :: SCASP 'NonLit 'NotNAFed
example = P1 `And` P2

{- 
In accordance with the restrictions in sCasp, the naf "not derivable" may only appear before literals, i.e. positive or negative elementary predicates. Accordingly, he following expression does not parse:
    assert not derivable (P(1, 2) && P(2, 3))
-}
typeError = NAF (P1 `And` P2)

{-
Of course, the classical "not" (corresponding to - in sCasp) can be used without restrictions, as in
    assert not (P(1, 2) && P(2, 3))
-}
legal = (NAF P1) `And` P2

legal2 = Neg (P1 `And` P2)

legal3 = Neg (Neg P1)

legal4 = NAF (Neg P1)

notLegal = Neg (NAF P1)

notLegal2 = NAF (NAF P1)

legal5 = NAF (P1 `And` P2)

notLegal3 = NAF (P1 `And` (NAF P2))
