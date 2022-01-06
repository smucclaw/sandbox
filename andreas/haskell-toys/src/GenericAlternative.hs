{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DerivingStrategies #-}
module GenericAlternative where

import GHC.Generics
import Control.Applicative
import Data.Data (Proxy(Proxy))
import Control.Monad (ap, (>=>), mfilter, MonadPlus)
import System.Random
import Data.Foldable (toList)
import Data.List (sort)
import Control.Arrow (left,Arrow (first))

test :: [(Int, Maybe ())]
-- test = alternate (Proxy @((~) Int)) (_)
test = alternate (Proxy @Enumerate) enumerate

test2 :: (Generic a, GAlternating ((~) Int) (Rep a), Alternative f) => f a
test2 = alternate (Proxy @((~) Int)) (pure 4)

test3 :: [(Int , Int)]
test3 = alternate (Proxy @((~) Int)) [1, 2]

-- >>> take 10 $ test
-- >>> test2 @(Maybe Int) @[]
-- >>> test3
-- [(0,Nothing),(0,Just ()),(1,Nothing),(1,Just ())]
-- [Nothing,Just 4]
-- [(1,1),(1,2),(2,1),(2,2)]

-- >>> enumerate @(Maybe (Maybe Bool))
-- [Nothing,Just Nothing,Just (Just False),Just (Just True)]

data LeafTree a = Leaf a | Node (LeafTree a) (LeafTree a) | Empty
  deriving (Show, Functor, Foldable, Traversable)

instance Applicative LeafTree where
  pure = Leaf
  (<*>) = ap

instance Alternative LeafTree where
  empty = Empty
  (<|>) = Node

instance Monad LeafTree where
  (Leaf a) >>= f = f a
  (Node la la3) >>= f = Node (la >>= f) (la3 >>= f)
  Empty >>= _ = Empty

simplifyTree :: LeafTree a -> LeafTree a
simplifyTree = transformTree simpl
  where
    simpl (Node Empty b) = b
    simpl (Node a Empty) = a
    simpl x = x

transformTree :: (LeafTree a -> LeafTree a) -> LeafTree a -> LeafTree a
transformTree f (Node a b) = f $ Node (transformTree f a) (transformTree f b)
transformTree f x = f x

truncateL :: Int -> LeafTree a -> LeafTree a
truncateL 0 _ = Empty
truncateL n (Node la la3) = Node (truncateL (n-1) la) (truncateL (n-1) la3)
truncateL _ a = a

truncateL' :: Int -> LeafTree a -> LeafTree a
truncateL' n = simplifyTree . truncateL n

toLeafTree :: Enumerate a => LeafTree a
toLeafTree = alternatives

toShallowList :: Enumerate a => Int -> [a]
toShallowList n = toList $ truncateL n toLeafTree

-- >>> take 200 $ show $ truncateL 6 $ toLeafTree @([] Int)
-- >>> take 200 $ show $ truncateL' 7 $ toLeafTree @([] Int)
-- "Node (Leaf []) (Node (Node (Leaf [0]) (Node (Node (Leaf [0,0]) (Node Empty Empty)) (Node (Node Empty Empty) (Node Empty Empty)))) (Node (Node (Node (Leaf [1]) (Node Empty Empty)) (Node (Node Empty Emp"
-- "Node (Leaf []) (Node (Node (Leaf [0]) (Leaf [0,0])) (Node (Leaf [1]) (Leaf [3])))"

-- >>> take 200 $ show $ truncateL' 7 $ toLeafTree @([] Bool)
-- "Node (Leaf []) (Node (Node (Leaf [False]) (Node (Leaf [False,False]) (Leaf [False,True]))) (Node (Leaf [True]) (Node (Leaf [True,False]) (Leaf [True,True]))))"

newtype State s m a = State {runState :: s -> m (a, s)}
  deriving Functor

lift :: Functor m => m a -> State t m a
lift x = State $ \s -> fmap (,s) x

local :: (s -> s) -> State s m a -> State s m a
local f (State x) = State $ x . f

instance Monad m => Applicative (State s m) where
  pure a = State $ pure . (a,)
  (<*>) = ap
--   State f <*> State x = State $ \s -> let (f', s') = f s in first f' $ x s'
instance Monad m => Monad (State s m) where
  State x >>= f = State $ \s -> do (x',s') <- x s; runState (f x') s'

instance (Alternative f, Monad f) => Alternative (State s f) where
  empty = State $ const empty
  State a <|> State b = State \s -> a s <|> b s

instance (Alternative f, Monad f) => MonadPlus (State s f)

newtype RngMonad g a = RngMonad {runRng :: State g Maybe a}
  deriving (Functor, Applicative, Monad)
-- instance Applicative (RngMonad g) where
--   pure = RngMonad . pure
--   RngMonad f <*> RngMonad x = RngMonad $ f <*> x -- (<*>) <$> f <*> x

-- instance Monad (RngMonad g) where
--    RngMonad x >>= f = RngMonad $ x >>= runRng . f
-- --    RngMonad x >>= f = RngMonad $ x >=> \(a, g') -> runRng (f a) g'

randomM :: (Random a, RandomGen g) => RngMonad g a
randomM = RngMonad $ State $ Just . random

instance RandomGen g => Alternative (RngMonad g) where
  empty = RngMonad empty
--   RngMonad (Just a) <|> (RngMonad (Just b)) = RngMonad . Just $ do
--       p <- State random
--       if p then a
--           else b
--   RngMonad a <|> RngMonad b = RngMonad $ a <|> b
  a <|> b = do
      p <- randomM
      if p then
        a
       else
        b

rngIo :: RngMonad StdGen a -> IO (Maybe a)
rngIo = getStdRandom . (\f g -> maybe (Nothing, g) (first Just) $ f g) . runState . runRng
-- rngIo = maybe (pure Nothing) (fmap Just . getStdRandom . runState) . runRng

genRandom :: Enumerate a => IO (Maybe a)
genRandom = rngIo alternatives

-- >>> genRandom @([Bool], Maybe Int)
-- >>> genRandom @([Bool], Maybe Int)
-- >>> genRandom @([Bool], Maybe Int)
-- >>> genRandom @([Bool], Maybe Int)
-- >>> genRandom @([Bool], Maybe Int)
-- Just ([True,False,False],Just 0)
-- Just ([],Nothing)
-- Just ([True,False,True,True],Just 0)
-- Just ([False,True,False,False,True,True,True,False,False],Nothing)
-- Just ([],Just 1)

-- >>> seq (from [1..]) ()
-- ()

data InfiniteOr a = Finite a | Infinite
  deriving (Show, Functor)

instance Applicative InfiniteOr where
  pure = Finite
  Finite f <*> Finite x = Finite (f x)
  _ <*> _ = Infinite

instance (Num a, Eq a) => Num (InfiniteOr a) where
  (+) = liftA2 (+)
  Finite 0 * _ = Finite 0
  _ * Finite 0 = Finite 0
  a * b = liftA2 (*) a b
  abs = fmap abs
  signum = fmap signum
  fromInteger = pure . fromInteger
  negate = fmap negate

newtype SizeOf n a = Size n
  deriving (Show, Functor)
  deriving newtype (Num)

instance Num n => Applicative (SizeOf n) where
  pure _ = 1
  Size a <*> Size b = Size $ a * b

instance Num n => Alternative (SizeOf n) where
  empty = Size 0
  Size a <|> Size b = Size $ a + b

sizeOf :: (Enumerate a, Num n) => (SizeOf n) a
sizeOf = alternatives

-- >>> sizeOf @(Maybe (Bool, Bool))
-- Size 5

newtype AtDepth f a = AtDepth {withDepth :: Int -> f a}
  deriving Functor

instance Alternative f => Applicative (AtDepth f) where
--   pure x = AtDepth \n -> if n == 0 then pure x else empty
--   pure x = AtDepth \case 0 -> pure x; _ -> empty
  pure x = AtDepth $ const $ pure x
  AtDepth f <*> AtDepth x = AtDepth \case 0 -> empty; n -> f (n - 1) <*> x (n - 1)
--   AtDepth f <*> AtDepth x = AtDepth \n -> f n <*> x n

instance Alternative f => Alternative (AtDepth f) where
  empty = AtDepth $ const empty
  AtDepth a <|> AtDepth b = AtDepth \case 0 -> empty; n -> a (n - 1) <|> b (n - 1)

-- >>> withDepth alternatives <$> [0..7] :: [[[Int]]]
-- [[],[[]],[[]],[[],[0]],[[],[0]],[[],[0],[0,0],[1],[1,0]],[[],[0],[0,0],[1],[1,0],[3],[3,0]],[[],[0],[0,0],[0,0,0],[0,1],[0,1,0],[1],[1,0],[1,0,0],[1,1],[1,1,0],[2],[2,0],[2,0,0],[2,1],[2,1,0],[3],[3,0],[3,0,0],[3,1],[3,1,0],[7],[7,0],[7,0,0],[7,1],[7,1,0]]]

-- newtype OfSize f a = OfSize {withSize :: Int -> (f a, Int)}
--   deriving Functor
-- instance Alternative f => Applicative (OfSize f) where
--   pure x = OfSize \case 0 -> (empty, 0); n -> (pure x, n - 1)
--   OfSize f <*> OfSize x = OfSize \case
--     0 -> (empty, 0)
--     n -> let (fa, n') = f n; (xa, n'') = x n' in (fa <*> xa, n')
-- instance Alternative f => Alternative (OfSize f) where
--   empty = OfSize (empty,)
--   OfSize a <|> OfSize b = OfSize \case
--     0 -> (empty,0)
--     n -> let (aa, n') = a n; (ba, n'') = b n in (aa <|> ba, _)
newtype OfSize f a = OfSize {withSize :: State Int f a}
  deriving Functor
-- Not law-abiding instances
instance (Alternative f, Monad f) => Applicative (OfSize f) where
  pure x = OfSize $ State \case 0 -> empty; n -> pure (x, n - 1)
  OfSize f <*> OfSize x = OfSize $ State \case
    0 -> empty
    n -> runState (f <*> x) n
    -- n -> let (fa, n') = f n; (xa, n'') = x n' in (fa <*> xa, n')
instance (Alternative f, Monad f) => Alternative (OfSize f) where
  empty = OfSize $ lift empty
  OfSize a <|> OfSize b = OfSize $ State \case
    0 -> empty
    n -> runState (a <|> b) n
    -- n -> runState (a <|> local pred b) n

sizeUpTo :: (Alternative m, Monad m, Enumerate a) => Int -> m (a, Int)
sizeUpTo = runState (withSize alternatives)

sizeExactly :: (MonadPlus f, Enumerate a) => Int -> f a
sizeExactly n = fmap fst . mfilter ((==0).snd) $ sizeUpTo n

subtractOne :: (Alternative m) => State Int m a -> State Int m a
subtractOne s = State \case 0 -> empty ; n -> runState s (n - 1)

sizeUpTo' :: (Alternative m, Monad m, Enumerate a) => Int -> m (a, Int)
sizeUpTo' = runState (withLayers subtractOne)

sizeExactly' :: (MonadPlus f, Enumerate a) => Int -> f a
sizeExactly' n = fmap fst . mfilter ((==0).snd) $ sizeUpTo' n

-- >>> take 30 $ sizeExactly @[] @Int 5
-- ProgressCancelledException

-- >>> sizeExactly' @[] @([Maybe ((), ())]) 0
-- >>> sizeExactly' @[] @([Maybe ((), ())]) 1
-- >>> sizeExactly' @[] @([Maybe ((), ())]) 2
-- >>> sizeExactly' @[] @([Maybe ((), ())]) 3
-- >>> sizeExactly' @[] @([Maybe ((), ())]) 4
-- [[]]
-- []
-- [[Nothing]]
-- []
-- [[Nothing,Nothing]]

data Nat = Z | S Nat
  deriving (Show, Eq, Ord)
instance Num Nat where
  -- Balanced addition and multiplication,
  -- so both sides will be consumed equally.
  Z + m = m
  S n + m = S $ m + n
  Z * m = Z
  S n * m = m + m * n
  abs = id
  signum Z = Z
  signum (S _) = S Z
  fromInteger 0 = Z
  fromInteger n | n > 0 = S (fromInteger (n - 1))
  negate _ = error "Can't negate a natural number"

-- | Min of two peano numbers. Infinite numbers are allowed
smallest :: Nat -> Nat -> Nat
smallest Z _ = Z
smallest (S n) Z = Z
smallest (S n) (S m) = S $ smallest n m

-- | Max of two peano numbers. Infinite numbers are allowed
largest :: Nat -> Nat -> Nat
largest Z m = m
largest n Z = n
largest (S n) (S m) = S $ largest n m



infinity = S infinity

-- >>> compare 93 infinity
-- LT

class Enumerate a where
    enumerate :: [a]
    default enumerate :: (Generic a, GAlternating Enumerate (Rep a)) => [a]
    enumerate = alternate (Proxy @Enumerate) enumerate
    alternatives :: Alternative f => f a
    default alternatives :: (Alternative f, Generic a, GAlternating Enumerate (Rep a)) => f a
    alternatives = alternate (Proxy @Enumerate) alternatives

    size :: SizeOf (InfiniteOr Int) a
    size = alternatives

    withLayers :: Alternative f => (forall b. f b -> f b) -> f a
    default withLayers :: (Alternative f, Generic a, GAlternating Enumerate (Rep a)) => (forall b. f b -> f b) -> f a
    withLayers f = alternate (Proxy @Enumerate) (f $ withLayers f)

instance Enumerate a => Enumerate [a]
    where size = (:) <$> size <*> Size Infinite
instance Enumerate a => Enumerate (ZipList a)
    where size = Size Infinite
instance Enumerate a => Enumerate (Maybe a)
instance (Enumerate a, Enumerate b) => Enumerate (a , b)
instance Enumerate ()
instance Enumerate Bool

instance Enumerate Int where
  enumerate = [0..1]
  size = Size Infinite
  -- alternatives = pure 0 <|> alternativesInt 1
  alternatives = pure 0 <|> binaryToInt <$> alternatives
  withLayers _ = alternatives

binaryToInt :: [Bool] -> Int
binaryToInt [] = 1
binaryToInt (x:xs) = fromEnum x + 2* binaryToInt xs

alternativesInt :: (Alternative f) => Int -> f Int
alternativesInt n = pure n <|> alternativesInt (2*n) <|> alternativesInt (2*n + 1)

-- >>> sort $ toShallowList @Int 7
-- [0,1,2,3,5,6,7,15]

-- >>> take 10 $ binaryToInt . getZipList <$> alternatives
-- >>> take 10 $ binaryToInt <$> alternatives
-- >>> binaryToInt . reverse <$> toShallowList 8
-- >>> binaryToInt <$> toShallowList 8
-- >>> sort $ binaryToInt <$> toShallowList 8
-- [1,2,4,8,16,32,64,128,256,512]
-- [1,2,4,8,16,32,64,128,256,512]
-- [1,2,4,8,9,5,10,11,3,6,12,13,7,14,15]
-- [1,2,4,8,12,6,10,14,3,5,9,13,7,11,15]
-- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]

-- * Implementation

class (Generic a, GAlternating q (Rep a)) => Alternating q a where
  alternate :: Alternative f => p q -> (forall b. q b => f b) -> f a

instance (Generic a, GAlternating q (Rep a)) => Alternating q a  where
  alternate p q = to <$> galternate p q

class GAlternating q t where
  galternate :: Alternative f => p q -> (forall b. q b => f b) -> f (t a)

instance GAlternating q U1 where
  galternate _ _ = pure U1

instance GAlternating q V1 where
  galternate _ _ = empty

instance (GAlternating q f, GAlternating q g) => GAlternating q (f :*: g) where
  galternate p q = (:*:) <$> galternate p q <*> galternate p q

instance (GAlternating q f, GAlternating q g) => GAlternating q (f :+: g) where
  galternate p q = L1 <$> galternate p q <|> R1 <$> galternate p q

instance q p => GAlternating q (K1 i p) where
  galternate _ q = fmap K1 q

instance GAlternating q f => GAlternating q (M1 i c f) where
  galternate p q = fmap M1 (galternate p q)
