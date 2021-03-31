{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE FlexibleInstances #-}
-- {-# LANGUAGE ExplicitForAll #-}
-- {-# LANGUAGE ScopedTypeVariables #-}

module Rule34 where

import GHC.TypeLits (Nat)
data QueryAcceptable (a :: Acceptability) (i :: Nat)

data Acceptability = MustNot | May deriving Show

data P1 = P1MustNot | P1NA

data P2 = P2May | P2NA

data P3 = P3May | P3NA

data P4 = P4May | P4NA

-- data P1bAnyP1 = P1bAnyP1May | P1bAnyP1NA
data P5 = P5May | P5NA

data P6 = P6MustNot | P6NA

data P7 = P7May | P7NA

class CAcceptability (p1 :: P1) (p2 :: P2) (p3 :: P3) (p4 :: P4) (p5 :: P5) (p6 :: P6) (p7 :: P7) (r :: Acceptability) (i :: Nat)
  where
    queryAcceptable :: QueryAcceptable r i
    queryAcceptable = undefined 
    query :: Pxs (p1 :: P1) (p2 :: P2) (p3 :: P3) (p4 :: P4) (p5 :: P5) (p6 :: P6) (p7 :: P7)
      -> QueryAcceptable r i
    query _ = undefined

-- para 1
instance (i ~ 1, r ~ MustNot) => CAcceptability P1MustNot p2 p3 p4 P5NA p6 P7NA r i
-- para 2
instance (i ~ 2, r ~ May) => CAcceptability P1NA P2May p3 p4 p5 p6 p7 r i
-- para 3
instance (i ~ 3, r ~ May) => CAcceptability P1NA p2 P3May p4 p5 p6 p7 r i
-- para 4
instance (i ~ 4, r ~ May) => CAcceptability P1NA p2 p3 P4May p5 p6 p7  r i
-- para 5
instance (i ~ 5, r ~ May) => CAcceptability p1 p2 p3 p4 P5May p6 p7 r i
-- para 6
instance (i ~ 6, r ~ MustNot) => CAcceptability P1NA P2NA P3NA P4NA P5NA P6MustNot P7NA r i
-- para 7
instance (i ~ 7, r ~ May) => CAcceptability p1 p2 p3 p4 p5 p6 P7May r i
  
-- mayIAccept1 = queryAcceptable @P1MustNot @_ @_ @_ @_ @_ @_
-- mayIAccept1na = queryAcceptable @P1NA @_ @_ @_ @_ @_ @_

-- mayIAccept2 = queryAcceptable @_ @P2May @_ @_ @_ @_ @_
-- mayIAccept2' = queryAcceptable @P1NA @P2May @_ @_ @_ @_ @_
-- mayIAccept2na = queryAcceptable @_ @P2NA @_ @_ @_ @_ @_

-- mayIAccept5 = queryAcceptable @_ @_ @_ @_ @P5May @_ @P7NA

-- mayIAccept7 = queryAcceptable @_ @_ @_ @_ @_ @_ @P7May

-- | Custom queries
data Pxs (p1 :: P1) (p2 :: P2) (p3 :: P3) (p4 :: P4) (p5 :: P5) (p6 :: P6) (p7 :: P7)
  where
    -- para 1
    AssociatedWithBadBusiness :: Pxs P1MustNot p2 p3 p4 p5 p6 p7
    Not'AssociatedWithBadBusiness :: Pxs P1NA p2 p3 p4 p5 p6 p7
    -- para 2
    SingaporeLawPractice :: Pxs p1 P2May P3NA P4NA P5NA p6 P7NA
    -- para 3
    BusinessEntity'LawRelated :: Pxs p1 P2NA P3May P4NA P5NA p6 P7NA
    -- para 4
    BusinessEntity'NotLawRelated'NotLocum :: Pxs p1 P2NA P3NA P4May P5NA p6 P7NA
    -- para 5
    BusinessEntity'NotLawRelated'Locum :: Pxs p1 P2NA P3NA P4NA P5May p6 P7NA
    Not'BusinessEntity'NotLawRelated'Locum :: Pxs p1 p2 p3 p4 P5NA p6 P7NA
    -- para 6
    Not'2to5 :: Pxs p1 P2NA P3NA P4NA P5NA p6 p7
    -- para 7
    ThirdSchedule :: Pxs p1 P2NA P3NA P4NA P5NA p6 P7May
    NotThirdSchedule :: Pxs p1 p2 p3 p4 p5 p6 P7NA

(<+>) :: Pxs (p1 :: P1) (p2 :: P2) (p3 :: P3) (p4 :: P4) (p5 :: P5) (p6 :: P6) (p7 :: P7)
  -> Pxs (p1 :: P1) (p2 :: P2) (p3 :: P3) (p4 :: P4) (p5 :: P5) (p6 :: P6) (p7 :: P7)
  -> Pxs (p1 :: P1) (p2 :: P2) (p3 :: P3) (p4 :: P4) (p5 :: P5) (p6 :: P6) (p7 :: P7)
(<+>) _ _ = undefined

foo1 = query $ AssociatedWithBadBusiness <+> Not'BusinessEntity'NotLawRelated'Locum <+> NotThirdSchedule
foo2 = query $ Not'AssociatedWithBadBusiness <+> SingaporeLawPractice
foo3 = query $ Not'AssociatedWithBadBusiness <+> BusinessEntity'LawRelated
foo4 = query $ Not'AssociatedWithBadBusiness <+> BusinessEntity'NotLawRelated'NotLocum
foo5 = query BusinessEntity'NotLawRelated'Locum
foo7 = query ThirdSchedule

-- | experiment (duplicates functionality of `query` in the typeclass)
-- | requires -XScopedTypeVariables and -XExplicitForAll
-- query2 :: forall p1 p2 p3 p4 p5 p6 p7 r i . 
--   CAcceptability (p1 :: P1) (p2 :: P2) (p3 :: P3) (p4 :: P4) (p5 :: P5) (p6 :: P6) (p7 :: P7) (r :: Acceptability) (i :: Nat) =>
--   Pxs (p1 :: P1) (p2 :: P2) (p3 :: P3) (p4 :: P4) (p5 :: P5) (p6 :: P6) (p7 :: P7)
--   -> QueryAcceptable (r :: Acceptability) (i :: Nat)
-- query2 _ = queryAcceptable @p1 @p2 @p3 @p4 @p5 @p6 @p7
-- baz = query2 $ Not'AssociatedWithBadBusiness <+> SingaporeLawPractice <+> NotThirdSchedule

-- random stuff

type family Acc (a :: Bool) :: Acceptability where
  Acc False = MustNot
  Acc True = May

class Reify (a :: Acceptability) where
  rei :: Acceptability
instance Reify MustNot where
  rei = MustNot
instance Reify May where
  rei = May

x = rei @(Acc False)

main = do
  print x