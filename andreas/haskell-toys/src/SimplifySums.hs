-- Simplifies expressions that involves sums of polynomials

{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE GADTs #-}
module SimplifySums where

import Bound
import Data.Functor.Classes
import Data.Deriving (deriveEq1, deriveOrd1, deriveRead1, deriveShow1)
import Control.Monad (ap)
import Data.Void (Void)

data Range = Range Integer Integer
  deriving (Show, Eq)

instance Num Range where
  Range l1 r1 + Range l2 r2 = Range (l1 + l2) (r1 + r2)
  Range l1 r1 * Range l2 r2 = Range (l1 * l2) (r1 * r2)
  abs (Range l r) = Range (max 0 l) r
  signum n = error "Signum is not defined for ranges"
  fromInteger n = Range n n
  negate (Range l r) = Range (-r) (-l)

rToList (Range l r) = [l..r]

rLen (Range l r) = max 0 $ r - l + 1
rSum rng@(Range l r) = (rLen rng * (l + r)) `div` 2
rSum' (Range l r) = sum [l..r]

sumOfN n = n * (n + 1) `div` 2
sumOfSquares n = n * (n + 1) * (2*n + 1) `div` 6
sumOfCubes n = n^2 * (n + 1)^2 `div` 4

rSquare (Range l r) = sumOfSquares r - sumOfSquares (l - 1)
rSquare' (Range l r) = sumOfSquares (fromInteger r) - sumOfSquares (fromInteger (l - 1))
rCube (Range l r) = sumOfCubes r - sumOfCubes (l - 1)
rCube' (Range l r) = sumOfCubes (fromInteger r) - sumOfCubes (fromInteger (l - 1))

-- >>> and [(rSum a == rSum' a) | l <- [-5..5], r <- [-5..10], let a = Range l r]
-- True

overlapRange (Range l1 r1) (Range l2 r2) = Range (max l1 l2) (min r1 r2)


data PolySum a
  = SumRange Range (Scope () PolySum a)
  | V a
  | PolySum a :+: PolySum a
  | PolySum a :*: PolySum a
--   | PolySum a :^: Int
  | I Integer
    deriving (Functor, Foldable, Traversable)

deriveEq1   ''PolySum
-- deriveOrd1  ''PolySum
-- deriveRead1 ''PolySum
deriveShow1 ''PolySum

instance Eq a   => Eq   (PolySum a) where (==) = eq1
-- instance Ord a  => Ord  (PolySum a) where compare = compare1
instance Show a => Show (PolySum a) where showsPrec = showsPrec1
-- instance Read a => Read (PolySum a) where readsPrec = readsPrec1

instance Applicative PolySum where pure = V; (<*>) = ap
instance Monad PolySum where
  (>>=) (SumRange r inner) f = SumRange r (inner >>>= f)
  (>>=) (V a) f = f a
  (>>=) (a :+: b) f = (a >>= f) :+: (b >>= f)
  (>>=) (a :*: b) f = (a >>= f) :*: (b >>= f)
  (>>=) (I i) f = I i
  return = V

instance Num (PolySum a) where
--   (+) = (:+:)
--   (*) = (:*:)
  I a + I b = I (a + b)
  I 0 + b   = b
  a   + I 0 = a
  a + b = a :+: b

  I a * I b = I $ a * b
  I 0 * _   = I 0
  _   * I 0 = I 0
  a * b = a :*: b
  abs _ = error "PolySum: abs not defined"
  signum = error "PolySum: signum not defined"
  fromInteger = I
  negate = ((-1) *)

data NormalPoly a
  = NEnd
  | a :+*: NormalPoly a -- ^ a + x*b
--   | NPolySum a :+: NPolySum a
--   | NPolySum a :*: NPolySum a
--   | NI Integer

normalizePoly :: Num a => PolySum (Var () a) -> [a]
normalizePoly (SumRange r inner) = error "not done yet"
normalizePoly (V (B _)) = [0, 1]
normalizePoly (V (F a)) = [a]
normalizePoly (a :+: b) = normalizePoly a +& normalizePoly b
normalizePoly (a :*: b) = multPoly (normalizePoly a) (normalizePoly b)
-- normalizePoly (a :^: i) = _
normalizePoly (I i) = [fromInteger i]

-- normalizeNums :: PolySum a -> PolySum a
-- normalizeNums (a :+: b) = _ :+: _
-- normalizeNums (a :*: b) = _ :*: _
-- normalizeNums (I i) = I _
-- normalizeNums e = e

reifyPoly :: [a] -> PolySum (Var () a)
reifyPoly [] = I 0
reifyPoly (x : xs) = V (F x) + V (B ()) * reifyPoly xs

(+&) :: Num a => [a] -> [a] -> [a]
-- (+&) = zipWith (+)
[] +& bs = bs
(a:as) +& (b:bs) = (a + b) : (as +& bs)
as +& [] = as

multPoly :: Num a => [a] -> [a] -> [a]
multPoly [] bs = []
multPoly (a:as) bs = map (a *) bs +& multPoly as (0:bs)

ex :: Scope () PolySum String
ex = abstract1 "x" $ x + 4 * x + x * 3 * x + x * x
  where x = V"x"

-- >>> multPoly [0,2] [0,3]
-- [0,0,6]

-- >>> ex
-- >>> normalizePoly $ unscope ex
-- >>> reifyPoly . normalizePoly $ unscope ex
-- Scope (((V (B ()) :+: (I 4 :*: V (B ()))) :+: ((V (B ()) :*: I 3) :*: V (B ()))) :+: (V (B ()) :*: V (B ())))
-- [I 0,I 5,I 4]
-- V (F (I 0)) :+: (V (B ()) :*: (V (F (I 5)) :+: (V (B ()) :*: V (F (I 4)))))


-- data PolySum1 a where
--    SumRange1 :: Range -> Scope () PolySum1 a -> PolySum1 a
--    V1        :: a                            -> PolySum1 a
--    (:+&:)    :: PolySum1 a -> PolySum1 a     -> PolySum1 a
--    (:*&:)    :: PolySum1 a -> PolySum1 a     -> PolySum1 a
--    (:^&:)    :: PolySum1 a -> Int            -> PolySum1 a
--    I1        :: Integer                      -> PolySum1 a
