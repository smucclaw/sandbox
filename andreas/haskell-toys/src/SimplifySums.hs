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
  I 1 * b   = b
  a   * I 1 = a
  a * b = a :*: b
  abs _ = error "PolySum: abs not defined"
  signum = error "PolySum: signum not defined"
  fromInteger = I
  negate = (I (-1) *)

sumRange :: Eq a => Range -> a -> PolySum a -> PolySum a
sumRange r n e = SumRange r $ abstract1 n e

normalizePoly :: Num a => PolySum (Var () a) -> [a]
normalizePoly (SumRange r inner) = normalizePoly $ polyRange r (normalizePoly $ unscope inner)
normalizePoly (V (B _)) = [0, 1]
normalizePoly (V (F a)) = [a]
normalizePoly (a :+: b) = normalizePoly a +& normalizePoly b
normalizePoly (a :*: b) = multPoly (normalizePoly a) (normalizePoly b)
-- normalizePoly (a :^: i) = _
normalizePoly (I i) = [fromInteger i]


normalizeClosed :: PolySum a -> PolySum a
normalizeClosed (SumRange r inner) = normalizeClosed $ polyRange r (normalizePoly $ unscope inner)
normalizeClosed (V a) = V a
normalizeClosed (a :+: b) = normalizeClosed a + normalizeClosed b
normalizeClosed (a :*: b) = normalizeClosed a * normalizeClosed b
-- normalizeClosed (a :^: i) = _
normalizeClosed (I i) = I i

polySumToNum :: Num a => PolySum a -> a
polySumToNum (SumRange r inner) = polySumToNum $ polyRange r (normalizePoly $ unscope inner)
polySumToNum (V a) = a
polySumToNum (a :+: b) = polySumToNum a + polySumToNum b
polySumToNum (a :*: b) = polySumToNum a * polySumToNum b
polySumToNum (I i) = fromInteger i

evaluate :: PolySum a -> Maybe Integer
evaluate = fmap polySumToNum . closed

-- polyRangeFormulas :: Num a => [Range -> a]
-- polyRangeFormulas :: Integral a => [Range -> a]
polyRangeFormulas :: [Range -> Integer]
polyRangeFormulas = [ rLen , rSum , rSquare , rCube ] ++ [error $ "Don't know how to sum x^" ++ show n | n <- [4..]]

polyRange :: Num a => Range -> [a] -> a
polyRange r = sum . zipWith (*) (map (fromInteger . ($ r)) polyRangeFormulas)

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

oneToNine = sumRange (Range 1 9) "n" $ (V"n" + V"a") * V"n" * V"n"

-- >>> oneToNine
-- >>> normalizeClosed oneToNine
-- SumRange (Range 1 9) (Scope (((V (B ()) :+: V (F (V "a"))) :*: V (B ())) :*: V (B ())))
-- (I 285 :*: V "a") :+: I 2025

-- data PolySum1 a where
--    SumRange1 :: Range -> Scope () PolySum1 a -> PolySum1 a
--    V1        :: a                            -> PolySum1 a
--    (:+&:)    :: PolySum1 a -> PolySum1 a     -> PolySum1 a
--    (:*&:)    :: PolySum1 a -> PolySum1 a     -> PolySum1 a
--    (:^&:)    :: PolySum1 a -> Int            -> PolySum1 a
--    I1        :: Integer                      -> PolySum1 a

t5'0 = sum [10000*a+1000*b+100*bc+10*c+d | a <- [1..9], b <- [0..9], c <- [0..9], d <- [0..9] , a + b == c + d, bc <- [0..9]]

t5'11 =
    sum [
        10000* sum [10*a+n - a | a <- rToList $ pairRng1 n] * lPairs0 n
      + 10   * lPairs1 n                * sum [10*c+n - c | c <- rToList $ pairRng0 n]
      + 100  * sum [bc | bc <- [0..9]]  * lPairs1 n * lPairs0 n
    | n <- rToList $ r19 + r09 ]
    where
      r09 = Range 0 9
      r19 = Range 1 9
      pairRng1 n = overlapRange r19 $ fromIntegral n - r09
      lPairs1 = rLen . pairRng1
      pairRng0 n = overlapRange r09 $ fromIntegral n - r09
      lPairs0 = rLen . pairRng0

t5'12 =
    sum [
        10000* sumRange (pairRng1 n) "a" (10*a+ I n - a) * sumRange (pairRng0 n) "c" 1
      + 10   * sumRange (pairRng1 n) "a" 1               * sumRange (pairRng0 n) "c" (10*c+I n - c )
      + 100  * sumRange r09 "bc" (V "bc")  * lPairs1 n * lPairs0 n
    | n <- rToList $ r19 + r09 ]
    where
      a = V"a"
      c = V"c"
      r09 = Range 0 9
      r19 = Range 1 9
      pairRng1 n = overlapRange r19 $ fromIntegral n - r09
      lPairs1 n = sumRange (pairRng1 n) "a" 1
      pairRng0 n = overlapRange r09 $ fromIntegral n - r09
      lPairs0 n = sumRange (pairRng0 n) "c" 1

t5'13 =
    sum [
        sumRange (pairRng1 n) "a" (sumRange (pairRng0 n) "c" $ 10000* (10*a+ I n - a))
      + sumRange (pairRng1 n) "a" (sumRange (pairRng0 n) "c" $ 10   * (10*c+ I n - c))
      + sumRange r09 "bc" (100  * V "bc")  * lPairs1 n * lPairs0 n
    | n <- rToList $ r19 + r09 ]
    where
      a = V"a"
      c = V"c"
      r09 = Range 0 9
      r19 = Range 1 9
      pairRng1 n = overlapRange r19 $ fromIntegral n - r09
      lPairs1 n = sumRange (pairRng1 n) "a" 1
      pairRng0 n = overlapRange r09 $ fromIntegral n - r09
      lPairs0 n = sumRange (pairRng0 n) "c" 1

t5'14 =
    sum [
        sumRange (pairRng1 n) "a" (sumRange (pairRng0 n) "c" $ 10000* (10*a+ I n - a) + 10 * (10*c+ I n - c))
      + sumRange r09 "bc" (100  * V "bc")  * lPairs1 n * lPairs0 n
    | n <- rToList $ r19 + r09 ]
    where
      a = V"a"
      c = V"c"
      r09 = Range 0 9
      r19 = Range 1 9
      pairRng1 n = overlapRange r19 $ fromIntegral n - r09
      lPairs1 n = sumRange (pairRng1 n) "a" 1
      pairRng0 n = overlapRange r09 $ fromIntegral n - r09
      lPairs0 n = sumRange (pairRng0 n) "c" 1

-- >>> t5'11
-- >>> normalizeClosed t5'14
-- 331431000
-- I 331431000
