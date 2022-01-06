{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveTraversable #-}
module Euler217 where

-- Balanced digits
import Data.Char (digitToInt)
import Data.List ((\\), groupBy, sort, genericLength)
import Data.Function (on)
import Data.Void (Void)

digits :: Show a => a -> [Int]
digits = map digitToInt . show

{-
-- https://projecteuler.net/problem=217

A positive integer with k (decimal) digits is called balanced if its first ⌈k/2⌉ digits sum to the same value as its last ⌈k/2⌉ digits, where ⌈x⌉, pronounced ceiling of x, is the smallest integer ≥ x, thus ⌈π⌉ = 4 and ⌈5⌉ = 5.

So, for example, all palindromes are balanced, as is 13722.

Let T(n) be the sum of all balanced numbers less than 10n.
Thus: T(1) = 45, T(2) = 540 and T(5) = 334795890.

Find T(47) mod 315
-}

-- >>> sumBalanced 1
-- >>> sumBalanced 2
-- >>> sumBalanced 5
-- 45
-- 540
-- 334795890

t1 :: Integer
t1 = 45
-- t1 = sum [1..9]

{-
t2 = sum [10*x + x | x <- [1..9]] + t1
   = sum [11*x | x <- [1..9]] + t1
   = 11 * sum [x | x <- [1..9]] + t1
   = 11 * t1 + t1
   = 12 * t1
   = 540
-}

t2 = 12 * t1

{-
t3 = t2 + sum [101*x+10*y | x <- [1..9], y <- [0..9]]
   = t2 + sum [101*x | x <- [1..9], y <- [0..9]] + sum [10*y | x <- [1..9], y <- [0..9]]
   = t2 + 10 * sum [101*x | x <- [1..9]] + 9 * sum [10*y | y <- [0..9]]
   = t2 + 10*101 * sum [x | x <- [1..9]] + 9 * 10 * sum [y | y <- [0..9]]
   = t2 + 10*101 * t1 + 9 * 10 * t1
   = t2 + (101+9)*10*t1
   = t2 + 110*10*t1
   = t2 + 1100*t1
   = t2 + 49500
-}

t3 = t2 + 1100*t1

splitDigits :: [a] -> ([a], [a])
splitDigits xs = (take n xs, drop m xs)
    where n = length xs `div` 2
          m = length xs - (length xs `div` 2)

splitDigs :: Show a => a -> ([Int], [Int])
splitDigs = splitDigits . digits

isBalanced :: Show a => a -> Bool
isBalanced n = let
    (l,r) = splitDigits $ digits n
    in sum l == sum r

sumBalanced = sum . allBalanced
allBalanced n = filter isBalanced [0..10^n - 1]

ds = [0..9]

t4' = sum [1000*a+100*b+10*c+d | a <- [1..9], b <- [0..9], c <- [0..9], d <- [0..9] , a + b == c + d]
t4 = t4' + t3
t4s = [1000*a+100*b+10*c+d | a <- [1..9], b <- [0..9], c <- [0..9], d <- [0..9] , a + b == c + d]

p4s = [1000*a+100*b+10*b+a | a <- [1..9], b <- [0..9]]
p4s' = [1000*a+100*b+10*a+b | a <- [1..9], b <- [0..9]]

t4Nonpal = (t4s \\ p4s) \\ p4s'

t4s1 = [1000*a+100*b+10*c+d | a <- [1..9], b <- [0..9], c <- [0..9], let d = a + b - c , d >= 0, d < 10]
t4s2 = [1000*a+100*b+10*c+d | a <- [1..9], b <- [0..9], c <- [0..9], let d = a + b - c , a + b >= c, a + b - 9 <= c]
t4s3 = [1000*a+100*b+10*c+d | a <- [1..9], b <- [0..9], c <- [max 0 (a + b - 9)..min 9 (a + b)], let d = a + b - c]

pairs0 n = [10*a+b | a <- [1..9], b <- [0..9], a + b == n]
pairs1 n = [10*a+b | a <- [1..9], let b = n - a, b >= 0, b <= 9]
pairs2 n = [10*a+b | a <- [1..9], let b = n - a, n - a >= 0, n - a <= 9]
pairs3 n = [10*a+b | a <- [1..9], let b = n - a, n >= a, n - 9 <= a]
pairs4 n = [10*a+b | a <- [max 1 (n - 9)..min 9 n], let b = n - a]
pairs5 n = [10*a+n - a | a <- [max 1 (n - 9)..min 9 n]]
pairs6 n = [9*a+n | a <- [max 1 (n - 9)..min 9 n]]

pairs :: (Ord a, Num a, Enum a) => a -> [a]
pairs = pairs6

pairs' n = [10*a+b | a <- [max 0 (n - 9)..min 9 n], let b = n - a]

-- >>> (pairs6 <$> [0..19]) == (pairs0 <$> [0..19])
-- True

lenPairs1 n = max 0 $ min 9 n - max 1 (n - 9) + 1
lenPairs2 n = rLen $ Range (max 1 (n - 9)) (min 9 n)
lenPairs = lenPairs2
lenPairs' n = max 0 $ min 9 n - max 0 (n - 9) + 1

-- >>> [(lenPairs n, length (pairs6 n)) | n <- [-1..20]]
-- >>> [lenPairs n == genericLength (pairs n) | n <- [-1..20]]
-- [(0,0),(0,0),(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(9,9),(8,8),(7,7),(6,6),(5,5),(4,4),(3,3),(2,2),(1,1),(0,0),(0,0)]
-- [True,True,True,True,True,True,True,True,True,True,True,True,True,True,True,True,True,True,True,True,True,True]

pairsSum1 n = sum [9*a+n | a <- [max 1 (n - 9)..min 9 n]]
pairsSum2 n = sum [9*a | a <- [max 1 (n - 9)..min 9 n]] + lenPairs n * n
pairsSum3 n = 9 * sum [a | a <- [max 1 (n - 9)..min 9 n]] + lenPairs n * n
pairsSum4 n = 9 * sumRange (max 1 (n - 9)) (min 9 n) + lenPairs n * n
pairsSum5 n = 9 * rSum rng + rLen rng * n where rng = pairRange n
pairsSum6 = pairsSumFor (Range 1 9)
pairsSum = pairsSum6

-- pairsSum' n = 9 * sumRange (max 0 (n - 9)) (min 9 n) + lenPairs' n * n
pairsSum' = pairsSumFor (Range 0 9)

pairsSumFor rng n = psumOfn n $ pairRangeFor rng n
psumOfn n rng = 9 * rSum rng + rLen rng * n

-- First digit must be nonzero
-- pairRange n = Range (max 1 (n - 9)) (min 9 n)
pairRange n = overlapRange (Range 1 9) (Range (n - 9) n)

-- First digit may be zero
pairRange' n = overlapRange (Range 0 9) (Range (n - 9) n)

pairRangeFor rng n = overlapRange (Range (n - 9) n) rng

pairRanges = (Range 1 <$> [1..9]) ++ (flip Range 9 <$> [1..9])
pairRanges' = (Range 0 <$> [1..9]) ++ (flip Range 9 <$> [1..9])
-- >>> (pairRange <$> [1..18]) == pairRanges
-- >>> (pairRange' <$> [1..18]) == pairRanges'
-- True
-- True

sumRange1 a b = sum [a..b]
sumRange2 a b = rSum $ Range a b

sumRange = sumRange2

-- >>> and [pairsSum4 n == sum (pairs6 n) | n <- [-1..20]]
-- True

doublePair n = [100*a+b | a <- pairs n, b <- pairs' n]

doublePairSum1 n = sum [100*a+b | a <- pairs n, b <- pairs' n]
doublePairSum2 n = sum [100*a | a <- pairs n, b <- pairs' n] + sum [b | a <- pairs n, b <- pairs' n]
doublePairSum3 n = length (pairs' n) * sum [100*a | a <- pairs n] + length (pairs n) * sum [b | b <- pairs' n]
doublePairSum4 n = 100*length (pairs' n) * sum [a | a <- pairs n] + length (pairs n) * sum [b | b <- pairs' n]
doublePairSum5 n = 100*length (pairs' n) * sum (pairs n) + length (pairs n) * sum (pairs' n)
doublePairSum6 n = 100*lenPairs' n * sum (pairs n) + lenPairs n * sum (pairs' n)
doublePairSum7 n = 100*lenPairs' n * pairsSum n + lenPairs n * sum (pairs' n)
doublePairSum8 n = 100*lenPairs' n * pairsSum n + lenPairs n * pairsSum' n
doublePairSum9 n = 100*rLen rng' * psum + rLen rng * psum'
  where rng = pairRange n
        rng' = pairRange' n
        psum = 9 * rSum rng + rLen rng * n
        psum' = 9 * rSum rng' + rLen rng' * n
doublePairSum10 n = 100*rLen rng0 * psumOf rng1 + rLen rng1 * psumOf rng0
  where rng1 = pairRangeFor (Range 1 9) n
        rng0 = pairRangeFor (Range 0 9) n
        psumOf = psumOfn n


doublePairSum = doublePairSum10

doublePairSums1 = map doublePairSum [1..18]
doublePairSums2 = zipWith3 dps pairRanges pairRanges' [1..18]
  where dps rng1 rng0 n = 100*rLen rng0 * psumOfn n rng1 + rLen rng1 * psumOfn n rng0
doublePairSums3 = zipWith3 dps pairRangesA pairRanges'A [1..9] ++ zipWith3 dps pairRangesB pairRanges'B [10..18]
  where
    dps rng1 rng0 n = 100*rLen rng0 * psumOfn n rng1 + rLen rng1 * psumOfn n rng0
    pairRangesA = Range 1 <$> [1..9]
    pairRangesB = flip Range 9 <$> [1..9]
    pairRanges'A = Range 0 <$> [1..9]
    pairRanges'B = flip Range 9 <$> [1..9]
doublePairSums4 = map dpsA [1..9] ++ map dpsB [1..9]
  where
    dpsA n = 100*rLen rng0 * psumOfn n rng1 + rLen rng1 * psumOfn n rng0
      where
        rng1 = Range 1 n
        rng0 = Range 0 n
    dpsB n' = 100*rLen rng * psumOfn n rng + rLen rng * psumOfn n rng
      where
        n = n' + 9
        rng = Range n' 9
doublePairSums5 = map dpsA [1..9] ++ map dpsB [1..9]
  where
    dpsA n = 100*rl0 * psumOfn n rng1 + rl1 * psumOfn n rng0
      where
        rng1 = Range 1 n
        rng0 = Range 0 n
        rl0 = n + 1
        rl1 = n
    dpsB n' = 101*rl * psumOfn n rng
      where
        n = n' + 9
        rng = Range n' 9
        rl = 10 - n'
doublePairSums6 = map dpsA [1..9] ++ map dpsB [1..9]
  where
    -- dpsA n = 100*rl0 * psumOfn n rng1 + rl1 * (psumOfn n rng1 + n)
    -- dpsA n = 100*rl0 * psumOfn n rng1 + rl1 * psumOfn n rng1 + rl1 * n
    -- dpsA n = (100*rl0 + rl1) * psumOfn n rng1 + rl1 * n
    -- dpsA n = (100*(n + 1) + n) * psumOfn n rng1 + n * n
    dpsA n = (101*n + 100) * psumOfn n rng1 + n * n
      where
        rng1 = Range 1 n
        -- rng0 = Range 0 n
        -- rl0 = n + 1
        -- rl1 = n
    dpsB n' = 101*rl * psumOfn n rng
      where
        n = n' + 9
        rng = Range n' 9
        rl = 10 - n'
doublePairSums7 = map dpsA [1..9] ++ map dpsB [1..9]
  where
    dpsA n = (101*n + 100) * psumOfn n (Range 1 n) + n * n
    dpsB n = 101 * (10-n) * psumOfn (n + 9) (Range n 9)
    psumOfn n rng = 9 * rSum rng + rLen rng * n
doublePairSums8 = map dpsA [1..9] ++ map dpsB [1..9]
  where
    -- psumOfn n (Range 1 n) = 9 * rSum (Range 1 n) + n * n
    -- psumOfn (n + 9) (Range n 9) = (9 * rSum (Range n 9) + (10 - n) * (n + 9))
    -- dpsA n = (101*n + 100) * (9 * rSum (Range 1 n) + n * n) + n * n
    -- dpsA n = (101*n + 100) * 9 * rSum (Range 1 n) + ((101*n + 100) + 1) * n * n
    dpsA n = (101*n + 100) * 9 * rSum (Range 1 n) + 101 * (n + 1) * n * n
    -- dpsB n = 101 * (10-n) * (9 * rSum (Range n 9) + (10 - n) * (n + 9))
    dpsB n = 101 * rl * (9 * rSum (Range n 9) + rl * (n + 9))
      where rl = 10 - n
    rSum rng@(Range l r) = (rLen rng * (l + r)) `div` 2
doublePairSums9 = map dpsA [1..9] ++ map dpsB [1..9]
  where
    -- dpsA n = (101*n + 100) * 9 * rSum (Range 1 n) + 101 * (n + 1) * n * n
    -- rSum (Range 1 n) = (n * (1 + n)) `div` 2
    dpsA n = (101*n + 100) * 9 * (n * (1 + n) `div` 2) + 101 * (n + 1) * n * n

    -- dpsB n = 101 * rl * (9 * rSum (Range n 9) + rl * (n + 9))
    --- rSum (Range n 9) = (rl * (n + 9)) `div` 2
    -- dpsB n = 101 * rl * (9 * ((rl * (n + 9)) `div` 2) + rl * (n + 9))
    -- dpsB n = 101 * rl * (9 * (rl * (n + 9)) `div` 2 + (2*rl * (n + 9))`div`2)
    -- dpsB n = 101 * rl * 11 * (rl * (n + 9) `div` 2)
    -- dpsB n = 101 * rl * 11 * ((n - n * n + 90) `div` 2)
    dpsB n = 101 * rl * 11 * ((1 - n) * n `div` 2 + 45)
      where rl = 10 - n
            -- rl * (n + 9) = (10 - n) * (n + 9)
            -- = 10 * n - 9 * n - n * n + 90
            -- = n - n * n + 90
            -- = (1 - n) * n + 90
doublePairSums10 = map (`div` 2) $ map dpsA [1..9] ++ map dpsB [1..9]
  where
    -- dpsA n = (101*n + 100) * 9 * n * (1 + n) + 2 * 101 * (n + 1) * n * n
    -- dpsA n = 101*n * 9 * n * (1 + n) + 100 * 9 * n * (1 + n) + 2 * 101 * (n + 1) * n * n
    -- dpsA n = 101 * 9 * (1 + n) * n * n + 100 * 9 * n * (1 + n) + 2 * 101 * (n + 1) * n * n
    -- dpsA n = 11 * 101 * n * (n + 1) * n + 100 * 9 * (n + 1) * n
    -- dpsA n = (11 * 101 * n + 900) * (n + 1) * n
    -- dpsA n = (1111 * n + 900) * (n + 1) * n
    -- dpsA n = (1111 * n + 900) * (n * n + n)
    -- dpsA n = (1111 * n * n + 1111 * n + 900 * n + 900) * n
    -- dpsA n = (1111 * n * n + 2011 * n + 900) * n
    dpsA n = 1111*n^3 + 2011*n^2 + 900*n

    -- dpsB n = 101 * (10 - n) * 11 * ((1 - n) * n + 90)
    -- dpsB n = 1111 * (10 - n) * ((1 - n) * n + 90)
    -- dpsB n = 1111 * (10 - n) * (1 - n) * n + 1111 * (10 - n) * 90
    -- dpsB n = 1111 * 10 * (1 - n) * n + 1111 * 10 * 90 - 1111 * n * (1 - n) * n - 1111 * n * 90
    -- dpsB n = 1111 * (10 * (1 - n) * n + 900 - n * (1 - n) * n - n * 90)
    -- dpsB n = 1111 * (10 * n - 10 * n * n + 900 - n * n + n * n * n - n * 90)
    -- dpsB n = 1111 * (10*n - 10*n*n + 900 - n*n + n*n*n - n*90)
    -- dpsB n = 1111 * (- 11*n*n + 900 + n*n*n - n*80)
    -- dpsB n = 1111 * (n*n*n - 11*n*n - n*80 + 900)
    dpsB n = 1111 * (n^3 - 11*n^2 - 80*n + 900)
doublePairSums11 = map (`div` 2) $ map dpsA [1..9] ++ map dpsB [1..9]
  where
    dpsA n = 1111*n^3 + 2011*n^2 + 900*n
    dpsB n = 1111 * (n^3 - 11*n^2 - 80*n + 900)
doublePairSums = doublePairSums10

-- >>> and $ zipWith (==) (fmap doublePairSum [1..18]) (map sum groupedT4s1)
-- >>> and $ zipWith (==) doublePairSums (map sum groupedT4s1)
-- True
-- True

data Range = Range Integer Integer
  deriving (Show, Eq)

data RangeOp a = RangeOp Integer Integer (Integer -> a)
  deriving Functor

instance Num Range where
  Range l1 r1 + Range l2 r2 = Range (l1 + l2) (r1 + r2)
  Range l1 r1 * Range l2 r2 = Range (l1 * l2) (r1 * r2)
  abs (Range l r) = Range (max 0 l) r
  signum n = error "Signum is not defined for ranges"
  fromInteger n = Range n n
  negate (Range l r) = Range (-r) (-l)

rToList (Range l r) = [l..r]

rLen (Range l r) = max 0 $ r - l + 1
rOpLen (RangeOp l r _) = r - l + 1
rSum rng@(Range l r) = (rLen rng * (l + r)) `div` 2
rSum' (Range l r) = sum [l..r]

sumOfN n = n * (n + 1) `div` 2
sumOfSquares n = n * (n + 1) * (2*n + 1) `div` 6
sumOfQubes n = n^2 * (n + 1)^2 `div` 4

-- >>> and [(rSum a == rSum' a) | l <- [-5..5], r <- [-5..10], let a = Range l r]
-- True

overlapRange (Range l1 r1) (Range l2 r2) = Range (max l1 l2) (min r1 r2)

-- >>> t4'
-- >>> sumBalanced 4 - t3
-- >>> sum t4s1
-- >>> sum t4s3
-- >>> sum t4s3
-- >>> sum $ doublePairSum <$> [1..18]
-- 3314850
-- 3314850
-- 3314850
-- 3314850
-- 3314850
-- 3314850

getHalfSum :: Show a => a -> Int
getHalfSum = sum . fst . splitDigs

groupOn :: Eq a1 => (a2 -> a1) -> [a2] -> [[a2]]
groupOn f = groupBy ((==) `on` f)

sortGroupOn :: (Ord a, Ord b) => (b -> a) -> [b] -> [[b]]
sortGroupOn f xs = map (map snd) $ groupOn fst $ sort [(f n,n) | n <- xs]

groupedT4s1 :: [[Integer]]
groupedT4s1 = sortGroupOn getHalfSum t4s1

doublePairs :: [[Integer]]
doublePairs = doublePair <$> [1..18]

-- >>> doublePairs == groupedT4s1
-- True

-- groupOn fst $ sort [(sum a,n) | n <- t4s1 , let (a,b) = splitDigs n]
-- mapM_ (print.map snd) $ groupOn fst $ sort [(sum a,n) | n <- t4s1 , let (a,b) = splitDigs n]
-- mapM_ (print.map snd) $ groupOn fst $ sort [(getHalfSum n,n) | n <- t4s1]
-- mapM_ print $ sortGroupOn getHalfSum t4s1
-- [1001,1010]
-- [1102,1111,1120,2002,2011,2020]
-- [1203,1212,1221,1230,2103,2112,2121,2130,3003,3012,3021,3030]
-- [1304,1313,1322,1331,1340,2204,2213,2222,2231,2240,3104,3113,3122,3131,3140,4004,4013,4022,4031,4040]
-- [1405,1414,1423,1432,1441,1450,2305,2314,2323,2332,2341,2350,3205,3214,3223,3232,3241,3250,4105,4114,4123,4132,4141,4150,5005,5014,5023,5032,5041,5050]
-- [1506,1515,1524,1533,1542,1551,1560,2406,2415,2424,2433,2442,2451,2460,3306,3315,3324,3333,3342,3351,3360,4206,4215,4224,4233,4242,4251,4260,5106,5115,5124,5133,5142,5151,5160,6006,6015,6024,6033,6042,6051,6060]
-- [1607,1616,1625,1634,1643,1652,1661,1670,2507,2516,2525,2534,2543,2552,2561,2570,3407,3416,3425,3434,3443,3452,3461,3470,4307,4316,4325,4334,4343,4352,4361,4370,5207,5216,5225,5234,5243,5252,5261,5270,6107,6116,6125,6134,6143,6152,6161,6170,7007,7016,7025,7034,7043,7052,7061,7070]
-- [1708,1717,1726,1735,1744,1753,1762,1771,1780,2608,2617,2626,2635,2644,2653,2662,2671,2680,3508,3517,3526,3535,3544,3553,3562,3571,3580,4408,4417,4426,4435,4444,4453,4462,4471,4480,5308,5317,5326,5335,5344,5353,5362,5371,5380,6208,6217,6226,6235,6244,6253,6262,6271,6280,7108,7117,7126,7135,7144,7153,7162,7171,7180,8008,8017,8026,8035,8044,8053,8062,8071,8080]
-- [1809,1818,1827,1836,1845,1854,1863,1872,1881,1890,2709,2718,2727,2736,2745,2754,2763,2772,2781,2790,3609,3618,3627,3636,3645,3654,3663,3672,3681,3690,4509,4518,4527,4536,4545,4554,4563,4572,4581,4590,5409,5418,5427,5436,5445,5454,5463,5472,5481,5490,6309,6318,6327,6336,6345,6354,6363,6372,6381,6390,7209,7218,7227,7236,7245,7254,7263,7272,7281,7290,8109,8118,8127,8136,8145,8154,8163,8172,8181,8190,9009,9018,9027,9036,9045,9054,9063,9072,9081,9090]
-- [1919,1928,1937,1946,1955,1964,1973,1982,1991,2819,2828,2837,2846,2855,2864,2873,2882,2891,3719,3728,3737,3746,3755,3764,3773,3782,3791,4619,4628,4637,4646,4655,4664,4673,4682,4691,5519,5528,5537,5546,5555,5564,5573,5582,5591,6419,6428,6437,6446,6455,6464,6473,6482,6491,7319,7328,7337,7346,7355,7364,7373,7382,7391,8219,8228,8237,8246,8255,8264,8273,8282,8291,9119,9128,9137,9146,9155,9164,9173,9182,9191]
-- [2929,2938,2947,2956,2965,2974,2983,2992,3829,3838,3847,3856,3865,3874,3883,3892,4729,4738,4747,4756,4765,4774,4783,4792,5629,5638,5647,5656,5665,5674,5683,5692,6529,6538,6547,6556,6565,6574,6583,6592,7429,7438,7447,7456,7465,7474,7483,7492,8329,8338,8347,8356,8365,8374,8383,8392,9229,9238,9247,9256,9265,9274,9283,9292]
-- [3939,3948,3957,3966,3975,3984,3993,4839,4848,4857,4866,4875,4884,4893,5739,5748,5757,5766,5775,5784,5793,6639,6648,6657,6666,6675,6684,6693,7539,7548,7557,7566,7575,7584,7593,8439,8448,8457,8466,8475,8484,8493,9339,9348,9357,9366,9375,9384,9393]
-- [4949,4958,4967,4976,4985,4994,5849,5858,5867,5876,5885,5894,6749,6758,6767,6776,6785,6794,7649,7658,7667,7676,7685,7694,8549,8558,8567,8576,8585,8594,9449,9458,9467,9476,9485,9494]
-- [5959,5968,5977,5986,5995,6859,6868,6877,6886,6895,7759,7768,7777,7786,7795,8659,8668,8677,8686,8695,9559,9568,9577,9586,9595]
-- [6969,6978,6987,6996,7869,7878,7887,7896,8769,8778,8787,8796,9669,9678,9687,9696]
-- [7979,7988,7997,8879,8888,8897,9779,9788,9797]
-- [8989,8998,9889,9898]
-- [9999]


-- * Size 5

t5'0 = sum [10000*a+1000*b+100*bc+10*c+d | a <- [1..9], b <- [0..9], c <- [0..9], d <- [0..9] , a + b == c + d, bc <- [0..9]]
t5'1 = sum [10000*a+1000*b+10*c+d | a <- [1..9], b <- [0..9], c <- [0..9], d <- [0..9] , a + b == c + d, bc <- [0..9]]
     + sum [100*bc | a <- [1..9], b <- [0..9], c <- [0..9], d <- [0..9] , a + b == c + d, bc <- [0..9]]
t5'2 = 10*sum [10000*a+1000*b+10*c+d | a <- [1..9], b <- [0..9], c <- [0..9], d <- [0..9] , a + b == c + d]
     + sum [100*bc | a <- [1..9], b <- [0..9], c <- [0..9], d <- [0..9] , a + b == c + d, bc <- [0..9]]
     -- 100 * t1 * count pairs * count pairs'
t5'3 = 10*sum [10000*a+1000*b | n <- [1..18], a <- [1..9], b <- [0..9], n == a + b, c <- [0..9], d <- [0..9] , n == c + d]
     + 10*sum [10*c+d         | n <- [1..18], a <- [1..9], b <- [0..9], n == a + b, c <- [0..9], d <- [0..9] , n == c + d]
     + sum [100*bc | bc <- [0..9]] * sum [1 | a <- [1..9], b <- [0..9], c <- [0..9], d <- [0..9] , a + b == c + d]
t5'4 = 10*sum [sum [10000*a+1000*b | a <- [1..9], b <- [0..9], n == a + b, c <- [0..9], d <- [0..9] , n == c + d] | n <- [1..18]]
     + 10*sum [sum [10*c+d         | a <- [1..9], b <- [0..9], n == a + b, c <- [0..9], d <- [0..9] , n == c + d] | n <- [1..18]]
     + sum [100*bc | bc <- [0..9]] * sum [1 | a <- [1..9], b <- [0..9], c <- [0..9], d <- [0..9] , a + b == c + d]
t5'5 = 10*sum [sum [10000*a+1000*b | a <- [1..9], b <- [0..9], n == a + b] * sum [1      | c <- [0..9], d <- [0..9] , n == c + d] | n <- [1..18]]
     + 10*sum [sum [1              | a <- [1..9], b <- [0..9], n == a + b] * sum [10*c+d |c <- [0..9], d <- [0..9] , n == c + d] | n <- [1..18]]
     + sum [100*bc | bc <- [0..9]] * sum [1 | a <- [1..9], b <- [0..9], c <- [0..9], d <- [0..9] , a + b == c + d]
t5'6 = 10000*sum [sum [10*a+b | a <- [1..9], b <- [0..9], n == a + b] * sum [1      | c <- [0..9], d <- [0..9], n == c + d] | n <- [1..18]]
     + 10   *sum [sum [1      | a <- [1..9], b <- [0..9], n == a + b] * sum [10*c+d | c <- [0..9], d <- [0..9], n == c + d] | n <- [1..18]]
     + sum [100*bc | bc <- [0..9]]
       * sum [sum [1 | a <- [1..9], b <- [0..9], n ==  a + b] * sum [1 | c <- [0..9], d <- [0..9], n == c + d] | n <- [1..18]]
t5'7 = 10000*sum [sum [10*a+b | (a,b) <- pairs1 n] * sum [1      | (c,d) <- pairs0 n] | n <- [1..18]]
     + 10   *sum [sum [1      | (a,b) <- pairs1 n] * sum [10*c+d | (c,d) <- pairs0 n] | n <- [1..18]]
     + 100  *sum [bc | bc <- [0..9]]
       * sum [sum [1 | (a,b) <- pairs1 n] * sum [1 | (c,d) <- pairs0 n] | n <- [1..18]]
    where
      pairs1 n = [(a,b) | a <- [1..9], b <- [0..9], n == a + b]
      pairs0 n = [(c,d) | c <- [0..9], d <- [0..9], n == c + d]
t5'8 = 10000*sum [sum [10*a+b | (a,b) <- pairs1 n] * length (pairs0 n)                | n <- [1..18]]
     + 10   *sum [length (pairs1 n)                * sum [10*c+d | (c,d) <- pairs0 n] | n <- [1..18]]
     + 100  *sum [bc | bc <- [0..9]]
       * sum [length (pairs1 n) * length (pairs0 n) | n <- [1..18]]
    where
      pairs1 n = [(a,b) | a <- [1..9], b <- [0..9], n == a + b]
      pairs0 n = [(c,d) | c <- [0..9], d <- [0..9], n == c + d]
t5'9 = 10000*sum [sum [10*a+b | (a,b) <- pairs1 n] * lPairs0 n                | n <- [1..18]]
     + 10   *sum [lPairs1 n                * sum [10*c+d | (c,d) <- pairs0 n] | n <- [1..18]]
     + 100  *sum [bc | bc <- [0..9]]
       * sum [lPairs1 n * lPairs0 n | n <- [1..18]]
    where
      r09 = Range 0 9
      r19 = Range 1 9
      pairs1 n = [(a,b) | a <- rToList abRng, let b = n - a]
        where
          aRng = r19
          bRng = r09
          abRng = overlapRange aRng $ fromIntegral n - bRng

      lPairs1 n = rLen $ overlapRange r19 $ fromIntegral n - r09

      pairs0 n = [(c,d) | c <- rToList abRng, let d = n - c]
        where
          aRng = r09
          bRng = r09
          abRng = overlapRange aRng $ fromIntegral n - bRng
      lPairs0 n = rLen $ overlapRange r09 $ fromIntegral n - r09
t5'10 = 10000*sum [sum [10*a+n - a | a <- rToList $ pairRng1 n] * lPairs0 n                | n <- [1..18]]
      + 10   *sum [lPairs1 n                * sum [10*c+n - c | c <- rToList $ pairRng0 n] | n <- [1..18]]
      + 100  *sum [bc | bc <- [0..9]]
        * sum [lPairs1 n * lPairs0 n | n <- [1..18]]
    where
      r09 = Range 0 9
      r19 = Range 1 9
      pairRng1 n = overlapRange r19 $ fromIntegral n - r09
      lPairs1 = rLen . pairRng1
      pairRng0 n = overlapRange r09 $ fromIntegral n - r09
      lPairs0 = rLen . pairRng0
t5'11 =
    sum [
        10000* sum [10*a+n - a | a <- rToList $ pairRng1 n] * lPairs0 n
      + 10   * lPairs1 n                * sum [10*c+n - c | c <- rToList $ pairRng0 n]
      + 100  * sum [bc | bc <- [0..9]]  * lPairs1 n * lPairs0 n
    | n <- rToList $ r19 + r09 ]
    where
      r09 = Range 0 9
      r19 = Range 1 9
      pairRng1 n = overlapRange r19 $ fromIntegral n - r09
      lPairs1 = rLen . pairRng1
      pairRng0 n = overlapRange r09 $ fromIntegral n - r09
      lPairs0 = rLen . pairRng0

-- TODO:
-- * Nestable polynomials
-- * Function for sum [10*a+n - a | a <- rToList $ pairRng1 n]
-- * Call it rangeSum f rng = sum $ [f a | a <- rToList rng]
-- * Call it rangeSum f rng = sum $ map f $ rToList rng
-- * Call it rangeSum f = sum . map f . rToList
-- * Convert rangeSum (\x -> a*x^2 + b*x + c) rng to
--   a * rngSquare rng + b * rSum rng + rLen rng

t5' = t5'11

t5 = t4 + t5'
-- >>> t5
-- >>> sumBalanced 5
-- 334795890
-- 334795890

t5Pairs = zipWith3 dps pairRanges pairRanges' [1..18]
  where dps rng1 rng0 n = 1000*rLen rng0 * psumOfn n rng1 + rLen rng1 * psumOfn n rng0

------------

data Incr a = Z String | S String a
  deriving (Eq, Show)
  deriving (Functor, Foldable, Traversable)

newtype Scope f a = Scope (f (Incr a))
  deriving Functor
  deriving Foldable
  deriving Traversable
--   deriving newtype Eq

-- UndecidableInstances
deriving newtype instance Eq (f (Incr a)) => Eq (Scope f a)
deriving newtype instance Show (f (Incr a)) => Show (Scope f a)

data Exp a
  = Var a
  | Exp a :@ Exp a
  | Lam (Scope Exp a)
  deriving (Eq, Show)
  deriving (Functor, Foldable, Traversable)

lam :: String -> (Exp (Incr a) -> Exp (Incr a)) -> Exp a
lam name f = Lam $ Scope $ f $ Var (Z name)

-- lam2 f = lam \x -> lam \y -> f (s x) y
-- lam2 :: (Exp (Incr (Incr a)) -> Exp (Incr (Incr a)) -> Exp (Incr (Incr a))) -> Exp a
-- lam2 f = lam $ lam . f . s

s :: String -> Exp a -> Exp (Incr a)
s x = fmap (S x)
-- s (Var x) = Var (S x)
-- s (x :@ y) = s x :@ s y
-- s (Lam (Scope f)) = Lam $ s f

ex :: Exp Void
ex = lam "x" $ \x -> lam "y" $ \y -> s "y" x :@ y

ex2 :: Exp Void
ex2 = lam "z" \z -> s "z" ex :@ z

ex3 :: Exp Void
ex3 = lam "x" $ \x -> s "lul" $ lam "y" $ \y -> x :@ y

-- >>> ex
-- >>> ex2
-- >>> ex3
-- Lam (Lam (Var (S "y" (Z "x")) :@ Var (Z "y")))
-- Lam (Lam (Lam (Var (S "y" (Z "x")) :@ Var (Z "y"))) :@ Var (Z "z"))
-- Lam (Lam (Var (Z "x") :@ Var (Z "y")))
