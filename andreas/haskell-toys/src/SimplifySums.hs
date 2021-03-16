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
import Data.Ratio (Ratio)
import Data.Map.Strict (Map)
import Data.Set (Set)
import qualified Data.Map as M
import qualified Data.Set as S

class Num a => FromRational a where
    fromRat :: Rational -> a
    (//) :: a -> Rational -> a
    x // n = x * fromRat (recip n)

infixl 7 //

instance Integral a => FromRational (Ratio a) where
    fromRat = fromRational

type Range = RangeX Integer
data RangeX a = Range a a
  deriving (Show, Eq, Functor, Foldable, Traversable)
instance Num a => Num (RangeX a) where
  Range l1 r1 + Range l2 r2 = Range (l1 + l2) (r1 + r2)
  Range l1 r1 * Range l2 r2 = Range (l1 * l2) (r1 * r2)
--   abs (Range l r) = Range (max 0 l) r
  abs (Range l r) = error "Abs is not defined for ranges"
  signum n = error "Signum is not defined for ranges"
  fromInteger n = Range n' n' where n' = fromInteger n
  negate (Range l r) = Range (-r) (-l)

deriveEq1   ''RangeX
deriveOrd1  ''RangeX
deriveRead1 ''RangeX
deriveShow1 ''RangeX

generalRange :: Num b => Range -> RangeX b
generalRange = fmap fromInteger

rToList (Range l r) = [l..r]

rLen (Range l r) = r - l + 1
rSum rng@(Range l r) = (rLen rng * (l + r)) // 2
rSum' (Range l r) = sum [l..r]

sumOfN n = n * (n + 1) // 2
sumOfSquares n = n * (n + 1) * (2*n + 1) // 6
sumOfCubes n = n^2 * (n + 1)^2 // 4

-- (n + 1)^2 = n^2 + 2n + 1
-- (n + 1)^2 - n^2 = 2n + 1
-- n^2 - (n-1)^2 = 2n - 1
-- sum_1^n(k^2 - (n-1)^2) = 2 sum k - sum 1
-- (n)^2 = 2 sum k - sum 1
-- 2 sum k = n^2 + sum 1
-- sum1 k = (n^2 + n)/2

-- (n - 1)^3 = n^3 - 3n^2 + 3n - 1
-- n^3 - (n - 1)^3 = 3n^2 - 3n + 1
-- sum (n^3 - (n - 1)^3) = 3 sum n^2 - 3 sum n + sum 1
-- n^3 = 3 sum n^2 - 3 sum n + sum 1
-- 3 sum n^2 = n^3 + 3 sum n - sum 1
-- sum n^2 = (n^3 + 3 (n^2 + n)/2 - n)/3
-- sum n^2 = (n^3 + 3/2*n^2 + 3/2n - n)/3
-- sum n^2 = (n^3 + 3/2*n^2 + 1/2n)/3
-- sum n^2 = (2n^2 + 3*n + 1)n/6
-- sum n^2 = (2n + 1)*(n + 1)*n/6
-- sum n^2 = (2n + 1)/3 * (n + 1)*n/2

-- (n - 1)^4 = n^4 - 4n^3 + 6n^2 - 4n + 1
-- n^4 - (n - 1)^4 = 4n^3 - 6n^2 + 4n - 1
-- sum (n^4 - (n - 1)^4) = 4 * sum n^3 - 6 * sum n^2 + 4 * sum n - sum 1
-- n^4 = 4 sum n^3 - 6 (2*n + 1)*(n + 1)*n/6 + 4 * (n + 1)*n/2 - n
-- 4 sum n^3 = n^4 + (2*n + 1)*(n + 1)*n - 2 * (n + 1)*n + n
-- sum n^3 = (n^4 + (2*n + 1)*(n + 1)*n - 2 * (n + 1)*n + n)/4
-- sum n^3 = (n^3 + (2*n + 1)*(n + 1) - 2 * (n + 1) + 1)*n/4
-- sum n^3 = (n^3 + ((2*n + 1) - 2)*(n + 1) + 1)*n/4
-- sum n^3 = (n^3 + (2*n - 1)*(n + 1) + 1)*n/4
-- sum n^3 = (n^3 + 2*n^2 + n - 1 + 1)*n/4
-- sum n^3 = (n^3 + 2*n^2 + n)*n/4
-- sum n^3 = (n^2 + 2*n + 1)*n^2/4
-- sum n^3 = (n + 1)^2*n^2/4
sum3 n = sum1 n ^ 2

-- (n - 1)^5 = n^5 - 5*n^4 + 10*n^3 - 10*n^2 + 5*n - 1
-- n^5 - (n - 1)^5 = 5*n^4 - 10*n^3 + 10*n^2 - 5*n + 1
-- 5*n^4 = n^5 - (n - 1)^5 + 10*n^3 - 10*n^2 + 5*n - 1
-- 5*sum4 n = sum(n^5 - (n - 1)^5) + 10*sum3 n - 10*sum2 n + 5*sum1 n - sum0 n
-- 5*sum4 n = n^5 + 10*sum3 n - 10*sum2 n + 5*sum1 n - sum0 n
--
sum0 n = n
sum1 n = (n + 1)*n//2
-- sum1 n = (n^2 + sum0 n)/2
sum2 n = (2*n + 1) * (n + 1)*n//6
-- sum2 n = (2*n + 1)/3 * sum1 n
-- sum2 n = (n^3 + 3 * sum1 n - sum0 n)/3
-- sum2 n = (n^3 + 3 * n^2 + 3*sum0 n - sum0 n)/3

-- (2n + 1)/3 * sum1 n = (n^3 + 3 * sum1 n - sum0 n)/3
-- (2n + 1) * sum1 n = n^3 + 3 * sum1 n - sum0 n

sum4 n = (n^5 + 10*sum3 n - 10*sum2 n + 5*sum1 n - sum0 n)// 5
-- 5*sum4 n = n^5 + 10*sum3 n - 10*sum2 n + 5*sum1 n - sum0 n
-- 5*sum4 n = n^5 + 10*sum1 n^2 - 10*(2*n+1)*sum1 n/3 + 5*sum1 n - sum0 n
-- 5*sum4 n = n^5 + 5*(2*sum1 n - 2*(2*n+1)/3 + 1)*sum1 n - sum0 n
-- 5*sum4 n = n^5 + 5*((n+1)*n - 2*(2*n+1)/3 + 1)*sum1 n - sum0 n
-- 5*sum4 n = n^5 + 5*(n^2 + n - 4*n/3 + 2/3 + 1)*sum1 n - sum0 n

choose n k = product [k+1..n] `div` product [1..n-k]

chooseList n = choose n <$> [0..n]

-- | Calculate the sum of k^n from k=1 to k=x
-- sumPow n x == sum [k^n | k <- [1..x]]
sumPow :: (Num t, FromRational t) => Integer -> t -> t
sumPow n x = (// fromInteger n') $ x^n' + sum [(-1)^k*fromInteger(choose n' k) * sumPow (n' - k) x | k <- [2..n']] where n' = n + 1

prop_sumPow n x = sumPow n x == sum [k^n | k <- [1..x]]
-- >>> and [prop_sumPow n x | n <- [0..8], x <- [0..8 :: Rational]]
-- True

-- >>> mkPoly () $ sumPow 0
-- >>> mkPoly () $ sum0
-- >>> mkPoly () $ sumPow 1
-- >>> mkPoly () $ sum1
-- >>> mkPoly () $ sumPow 2
-- >>> mkPoly () $ sum2
-- >>> mkPoly () $ sumPow 3
-- >>> mkPoly () $ sum3
-- >>> mkPoly () $ sumPow 4
-- >>> mkPoly () $ sum4
-- P {unP = [I (0 % 1),I (1 % 1)]}
-- P {unP = [I (0 % 1),I (1 % 1)]}
-- P {unP = [I (0 % 1),I (1 % 2),I (1 % 2)]}
-- P {unP = [I (0 % 1),I (1 % 2),I (1 % 2)]}
-- P {unP = [I (0 % 1),I (1 % 6),I (1 % 2),I (1 % 3)]}
-- P {unP = [I (0 % 1),I (1 % 6),I (1 % 2),I (1 % 3)]}
-- P {unP = [I (0 % 1),I (0 % 1),I (1 % 4),I (1 % 2),I (1 % 4)]}
-- P {unP = [I (0 % 1),I (0 % 1),I (1 % 4),I (1 % 2),I (1 % 4)]}
-- P {unP = [I (0 % 1),I ((-1) % 30),I (0 % 1),I (1 % 3),I (1 % 2),I (1 % 5)]}
-- P {unP = [I (0 % 1),I ((-1) % 30),I (0 % 1),I (1 % 3),I (1 % 2),I (1 % 5)]}

-- >>> fullyNormalize $ sumPow 4 $ V"n"
--     I ((-1) % 30) :*: V "n"
-- :+: I (1 % 3)     :*: (V "n" :*: V "n" :*: V "n")
-- :+: I (1 % 2)     :*: (V "n" :*: V "n" :*: V "n" :*: V "n")
-- :+: I (1 % 5)     :*: (V "n" :*: V "n" :*: V "n" :*: V "n" :*: V "n")

rSquare :: FromRational a => RangeX a -> a
rSquare (Range l r) = sumOfSquares r - sumOfSquares (l - 1)
rSquare' (Range l r) = sumOfSquares (fromInteger r) - sumOfSquares (fromInteger (l - 1))

rCube :: FromRational a => RangeX a -> a
rCube (Range l r) = sumOfCubes r - sumOfCubes (l - 1)
rCube' (Range l r) = sumOfCubes (fromInteger r) - sumOfCubes (fromInteger (l - 1))

-- >>> and [(rSum a == rSum' a) | l <- [-5..5], r <- [-5..10], let a = Range l r]
-- True

overlapRange (Range l1 r1) (Range l2 r2) = Range (max l1 l2) (min r1 r2)


data PolySum a
  = SumRange (RangeX (PolySum a)) (Scope () PolySum a)
  | V a
  | PolySum a :+: PolySum a
  | PolySum a :*: PolySum a
--   | PolySum a :^: Int
  | I Rational
    deriving (Functor, Foldable, Traversable)

infixl 6 :+:
infixl 7 :*:

deriveEq1   ''PolySum
deriveOrd1  ''PolySum
deriveRead1 ''PolySum
deriveShow1 ''PolySum

instance Eq a   => Eq   (PolySum a) where (==) = eq1
instance Ord a  => Ord  (PolySum a) where compare = compare1
instance Show a => Show (PolySum a) where showsPrec = showsPrec1
instance Read a => Read (PolySum a) where readsPrec = readsPrec1

instance Applicative PolySum where pure = V; (<*>) = ap
instance Monad PolySum where
  (>>=) (SumRange r inner) f = SumRange (fmap (>>= f) r) (inner >>>= f)
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
  fromInteger = I . fromInteger
  negate = (I (-1) *)

instance FromRational (PolySum a) where
    fromRat = I

sumRange :: Eq a => Range -> a -> PolySum a -> PolySum a
sumRange r n e = SumRange (generalRange r) $ abstract1 n e

newtype Polynomial a = P {unP :: [a]}
  deriving Show

instance Num a => Num (Polynomial a) where
    P[] + bs = bs
    P(a:as) + P(b:bs) = P $ (a + b) : unP (P as + P bs)
    as + P[] = as
    P [] * bs = P[]
    P(a:as) * P bs = P (map (a *) bs) + P as * P(0:bs)
    abs _ = error "Polynomial: abs not defined"
    signum = error "Polynomial: signum not defined"
    fromInteger = P . pure . fromInteger
    negate (P xs) = P $ map negate xs

instance FromRational a => FromRational (Polynomial a) where
  fromRat = P . pure . fromRat

varToPoly :: Num a => Var () a -> Polynomial a
varToPoly (B _) = P [0, 1]
varToPoly (F a) = P [a]

polyBound :: a -> Polynomial (PolySum a)
polyBound a = P [0, V a]
-- polyBound = P . (0:) . (:[]) . V

polyOfFree :: PolySum a -> Polynomial (PolySum a)
polyOfFree = polySumToNum . fmap polyBound

normalizePoly :: FromRational a => PolySum (Var () a) -> Polynomial a
normalizePoly = polySumToNum . fmap varToPoly

normalizeClosed :: PolySum a -> PolySum a
normalizeClosed = polySumToNum . fmap V

polySumToNum :: FromRational a => PolySum a -> a
polySumToNum (SumRange r inner) = polySumToNum $ polyRange r (normalizePoly $ unscope inner)
polySumToNum (V a) = a
polySumToNum (a :+: b) = polySumToNum a + polySumToNum b
polySumToNum (a :*: b) = polySumToNum a * polySumToNum b
polySumToNum (I i) = fromRat i

evaluate :: PolySum a -> Maybe Rational
evaluate = fmap polySumToNum . closed

-- polyRangeFormulas :: Num a => [Range -> a]
-- polyRangeFormulas :: Integral a => [Range -> a]
polyRangeFormulas :: (Num a, FromRational a) => [RangeX a -> a]
polyRangeFormulas = [ \(Range l r) -> sumPow p r - sumPow p (l - 1) | p <- [0..]]

-- | The sum of a polynomial over a range
polyRange :: (Num a, FromRational a) => RangeX a -> Polynomial a -> a
polyRange r = sum . zipWith (*) (map ($ r) polyRangeFormulas) . unP

reifyPoly :: Polynomial a -> PolySum (Var () a)
reifyPoly (P []) = I 0
reifyPoly (P(x : xs)) = V (F x) + V (B ()) * reifyPoly (P xs)

-- bindVariable :: Eq a => a -> (PolySum a -> PolySum a) -> PolySum (Var () (PolySum a))
bindVariable :: (Monad f, Eq a) => a -> (f a -> f a) -> f (Var () (f a))
bindVariable name f = unscope . abstract1 name $ f (pure name)

mkPoly :: Eq a => a -> (PolySum a -> PolySum a) -> Polynomial (PolySum a)
mkPoly name = normalizePoly . bindVariable name

evalPoly :: Num p => p -> Polynomial p -> p
evalPoly x (P[]) = 0
evalPoly x (P(a : as)) = a + x * evalPoly x (P as)

-- | A generalized polynomial written as a map from a product of varialbes to their coeffiecients
newtype NormalExpr a
  = NE {unNE :: Map (MultiSet a) Rational }
  deriving Show

type MultiSet a = Map a Int

unionMultiSet :: Ord a => MultiSet a -> MultiSet a -> MultiSet a
unionMultiSet = M.unionWith (+)

multiSetToList :: MultiSet a -> [a]
multiSetToList = concatMap (\(a,n) -> replicate n a) . M.toList

instance Ord a => Num (NormalExpr a) where
  NE a + NE b = NE $ M.unionWith (+) a b
  NE a * NE b = sum . map (uncurry multiplySingle) $ M.toList a
    where multiplySingle varsA coeffA = NE $ M.map (* coeffA) $ M.mapKeysWith (error "this shouldn't happen") (unionMultiSet varsA) b
  abs = error "NormalExpr: abs is not defined"
  signum = error "NormalExpr: signum is not defined"
  fromInteger = fromRat . fromInteger
  negate = NE . M.map negate . unNE

instance Ord a => FromRational (NormalExpr a) where
  fromRat = NE . M.singleton M.empty

singleNE x = NE $ M.singleton (M.singleton x 1) 1

toNormalExpr :: Ord a => PolySum a -> NormalExpr a
toNormalExpr = polySumToNum . fmap singleNE

reifyNormalExpr :: NormalExpr a -> PolySum a
reifyNormalExpr = sum . M.mapWithKey convSingle . unNE
  where
    convSingle :: MultiSet a -> Rational -> PolySum a
    convSingle ms coeff = I coeff * product (map V $ multiSetToList ms)
    -- convSingle :: (FromRational (f a), Applicative f) => MultiSet a -> Rational -> f a
    -- convSingle ms coeff = fromRat coeff * product (map pure $ multiSetToList ms)

fullyNormalize :: Ord a => PolySum a -> PolySum a
fullyNormalize = reifyNormalExpr . toNormalExpr

ex :: Scope () PolySum String
ex = abstract1 "x" $ x + 4 * x + x * 3 * x + x * x
  where x = V"x"

-- >>> ex
-- >>> normalizePoly $ unscope ex
-- >>> reifyPoly . normalizePoly $ unscope ex
-- >>> fullyNormalize $ unscope ex
-- Scope (((V (B ()) :+: I (4 % 1) :*: V (B ())) :+: (V (B ()) :*: I (3 % 1)) :*: V (B ())) :+: V (B ()) :*: V (B ()))
-- P {unP = [I (0 % 1),I (5 % 1),I (4 % 1)]}
-- V (F (I (0 % 1))) :+: V (B ()) :*: (V (F (I (5 % 1))) :+: V (B ()) :*: V (F (I (4 % 1))))
-- I (5 % 1) :*: V (B ()) :+: I (4 % 1) :*: (V (B ()) :*: V (B ()))

oneToNine = sumRange (Range 1 9) "n" $ (V"n" + V"a") * V"n" * V"n"

-- >>> oneToNine
-- >>> normalizeClosed oneToNine
-- >>> fullyNormalize oneToNine
-- SumRange (Range (I (1 % 1)) (I (9 % 1))) (Scope (((V (B ()) :+: V (F (V "a"))) :*: V (B ())) :*: V (B ())))
-- I (285 % 1) :*: V "a" :+: I (2025 % 1)
-- I (2025 % 1) :+: I (285 % 1) :*: V "a"

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
        10000* sumRange (pairRng1 n) "a" (10*a+ fromInteger n - a) * sumRange (pairRng0 n) "c" 1
      + 10   * sumRange (pairRng1 n) "a" 1               * sumRange (pairRng0 n) "c" (10*c+fromInteger n - c )
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
        sumRange (pairRng1 n) "a" (sumRange (pairRng0 n) "c" $ 10000* (10*a+ fromInteger n - a))
      + sumRange (pairRng1 n) "a" (sumRange (pairRng0 n) "c" $ 10   * (10*c+ fromInteger n - c))
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
        sumRange (pairRng1 n) "a" (sumRange (pairRng0 n) "c" $ 10000* (10*a+ fromInteger n - a) + 10 * (10*c+ fromInteger n - c))
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

t5'15 =
    sum [
        sumRange (pairRng1 n) "a" $ sumRange (pairRng0 n) "c" $ sumRange r09 "bc" $
          let b = fromInteger n - a
              d = fromInteger n - c
          in
          10000*a + 1000*b + 100*bc + 10*c + d
    | n <- rToList $ r19 + r09 ]
    where
      a = V"a"
      c = V"c"
      bc = V"bc"
      r09 = Range 0 9
      r19 = Range 1 9
      pairRng1 n = overlapRange r19 $ fromIntegral n - r09
      lPairs1 n = sumRange (pairRng1 n) "a" 1
      pairRng0 n = overlapRange r09 $ fromIntegral n - r09
      lPairs0 n = sumRange (pairRng0 n) "c" 1

t5'16 =
    sum [
        sumRange (pairRng1 n) "a" $ sumRange (pairRng0 n) "c" $ fullyNormalize $ sumRange r09 "bc" $
          let b = fromInteger n - a
              d = fromInteger n - c
          in
          10000*a + 1000*b + 100*bc + 10*c + d
    | n <- rToList $ r19 + r09 ]
    where
      a = V"a"
      c = V"c"
      bc = V"bc"
      r09 = Range 0 9
      r19 = Range 1 9
      pairRng1 n = overlapRange r19 $ fromIntegral n - r09
      lPairs1 n = sumRange (pairRng1 n) "a" 1
      pairRng0 n = overlapRange r09 $ fromIntegral n - r09
      lPairs0 n = sumRange (pairRng0 n) "c" 1

-- >>> t5'11
-- >>> normalizeClosed t5'16
-- 331431000
-- I (331431000 % 1)


t5_a =
    [
        sumRange r09 "bc" $
          let b = fromInteger n - a
              d = fromInteger n - c
          in
          10000*a + 1000*b + 100*bc + 10*c + d
    | n <- rToList $ r19 + r09 ]
    where
      a = V"a"
      c = V"c"
      bc = V"bc"
      r09 = Range 0 9
      r19 = Range 1 9
      pairRng1 n = overlapRange r19 $ fromIntegral n - r09
      lPairs1 n = sumRange (pairRng1 n) "a" 1
      pairRng0 n = overlapRange r09 $ fromIntegral n - r09
      lPairs0 n = sumRange (pairRng0 n) "c" 1

-- >>> t5_a
-- >>> map fullyNormalize t5_a
-- [SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (1 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (1 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (2 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (2 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (3 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (3 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (4 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (4 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (5 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (5 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (6 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (6 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (7 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (7 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (8 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (8 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (9 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (9 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (10 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (10 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (11 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (11 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (12 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (12 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (13 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (13 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (14 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (14 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (15 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (15 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (16 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (16 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (17 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (17 % 1) :+: (I ((-1) % 1) :*: V (F (V "c")))))),SumRange (Range (I (0 % 1)) (I (9 % 1))) (Scope (((((I (10000 % 1) :*: V (F (V "a"))) :+: (I (1000 % 1) :*: (I (18 % 1) :+: (I ((-1) % 1) :*: V (F (V "a")))))) :+: (I (100 % 1) :*: V (B ()))) :+: (I (10 % 1) :*: V (F (V "c")))) :+: (I (18 % 1) :+: (I ((-1) % 1) :*: V (F (V "c"))))))]
-- [(I (14510 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (24520 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (34530 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (44540 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (54550 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (64560 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (74570 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (84580 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (94590 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (104600 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (114610 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (124620 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (134630 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (144640 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (154650 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (164660 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (174670 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c"),(I (184680 % 1) :+: (I (90000 % 1) :*: V "a")) :+: (I (90 % 1) :*: V "c")]



t6'1 =
    sum [
        sumRange (pairRng1 n) "a" $ sumRange (pairRng0 n) "d" $ sumRange r09 "bc" $
          let b = fromInteger n - a
              c = fromInteger n - a
              e = fromInteger n - d
              f = fromInteger n - d
          in
          100000*a + 10000*b + 1000*c + 100*d + 10*e + f
    | n <- rToList $ r19 + r09 + r09 ]
    where
      a = V"a"
      d = V"d"
      bc = V"bc"
      r09 = Range 0 9
      r19 = Range 1 9
      pairRng1 n = overlapRange r19 $ fromIntegral n - r09
      lPairs1 n = sumRange (pairRng1 n) "a" 1
      pairRng0 n = overlapRange r09 $ fromIntegral n - r09
      lPairs0 n = sumRange (pairRng0 n) "c" 1
