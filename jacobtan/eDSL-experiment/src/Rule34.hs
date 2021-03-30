{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE FlexibleInstances #-}
module Rule34 where

data QueryAcceptable (a :: Acceptability)

data Acceptability = MustNot | May deriving Show

data P1 = P1MustNot | P1NA

data P2 = P2May | P2NA

data P3 = P3May | P3NA

data P4 = P4May | P4NA

-- data P1bAnyP1 = P1bAnyP1May | P1bAnyP1NA
data P5 = P5May | P5NA

data P6 = P6MustNot | P6NA

data P7 = P7May | P7NA

class CAcceptability (p1 :: P1) (p2 :: P2) (p3 :: P3) (p4 :: P4) (p5 :: P5) (p6 :: P6) (p7 :: P7) (r :: Acceptability)
  where
    queryAcceptable :: QueryAcceptable r
    queryAcceptable = undefined 

-- para 1
instance r ~ MustNot => CAcceptability P1MustNot p2 p3 p4 P5NA p6 P7NA r
-- para 2
instance r ~ May => CAcceptability P1NA P2May p3 p4 p5 p6 P7NA r
-- para 3
instance r ~ May => CAcceptability P1NA p2 P3May p4 p5 p6 P7NA r
-- para 4
instance r ~ May => CAcceptability P1NA p2 p3 P4May p5 p6 P7NA r
-- para 5
instance r ~ May => CAcceptability p1 p2 p3 p4 P5May p6 P7NA r
-- para 6
instance r ~ MustNot => CAcceptability p1 P2NA P3NA P4NA P5NA P6MustNot P7NA r
-- para 7
instance r ~ May => CAcceptability p1 p2 p3 p4 p5 p6 P7May r
  
-- mayIAccept1 = queryAcceptable @P1MustNot @_ @_ @_ @_ @_ @_
-- mayIAccept1na = queryAcceptable @P1NA @_ @_ @_ @_ @_ @_

-- mayIAccept2 = queryAcceptable @_ @P2May @_ @_ @_ @_ @_
-- mayIAccept2' = queryAcceptable @P1NA @P2May @_ @_ @_ @_ @_
-- mayIAccept2na = queryAcceptable @_ @P2NA @_ @_ @_ @_ @_

-- mayIAccept5 = queryAcceptable @_ @_ @_ @_ @P5May @_ @P7NA

mayIAccept7 = queryAcceptable @_ @_ @_ @_ @_ @_ @P7May


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