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
import Control.Monad (ap, (>=>))
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

-- >>> take 10 $ test
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
toShallowList n = toList $ truncateL n toLeafTree

-- >>> take 200 $ show $ truncateL 6 $ toLeafTree @([] Int)
-- >>> take 200 $ show $ truncateL' 7 $ toLeafTree @([] Int)
-- "Node (Leaf []) (Node (Node (Leaf [0]) (Node (Node (Leaf [0,0]) (Node Empty Empty)) (Node (Node Empty Empty) (Node Empty Empty)))) (Node (Node (Node (Leaf [1]) (Node Empty Empty)) (Node (Node Empty Emp"
-- "Node (Leaf []) (Node (Node (Leaf [0]) (Leaf [0,0])) (Node (Leaf [1]) (Leaf [3])))"

-- >>> take 200 $ show $ truncateL' 7 $ toLeafTree @([] Bool)
-- "Node (Leaf []) (Node (Node (Leaf [False]) (Node (Leaf [False,False]) (Leaf [False,True]))) (Node (Leaf [True]) (Node (Leaf [True,False]) (Leaf [True,True]))))"

newtype State s m a = State {runState :: s -> m (a, s)}
  deriving Functor

instance Monad m => Applicative (State s m) where
  pure a = State $ pure . (a,)
  (<*>) = ap
--   State f <*> State x = State $ \s -> let (f', s') = f s in first f' $ x s'
instance Monad m => Monad (State s m) where
  State x >>= f = State $ \s -> do (x',s') <- x s; runState (f x') s'

newtype RngMonad g a = RngMonad {runRng :: State g Maybe a}
  deriving (Functor, Applicative, Monad)
-- instance Applicative (RngMonad g) where
--   pure = RngMonad . pure
--   RngMonad f <*> RngMonad x = RngMonad $ f <*> x -- (<*>) <$> f <*> x

-- instance Monad (RngMonad g) where
--    RngMonad x >>= f = RngMonad $ x >>= runRng . f
-- --    RngMonad x >>= f = RngMonad $ x >=> \(a, g') -> runRng (f a) g'

randomM :: (Random a, RandomGen g) => RngMonad g a
randomM = RngMonad $ State $ Just . random

instance RandomGen g => Alternative (RngMonad g) where
  empty = RngMonad $ State $ const Nothing
--   RngMonad (Just a) <|> (RngMonad (Just b)) = RngMonad . Just $ do
--       p <- State random
--       if p then a
--           else b
--   RngMonad a <|> RngMonad b = RngMonad $ a <|> b
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

newtype SizeOf a = Size (InfiniteOr Int)
  deriving (Show, Functor)
  deriving newtype (Num)

instance Applicative SizeOf where
  pure _ = 1
  Size a <*> Size b = Size $ a * b

instance Alternative SizeOf where
  empty = Size 0
  Size a <|> Size b = Size $ a + b

sizeOf :: Enumerate a => SizeOf a
sizeOf = alternatives

-- >>> sizeOf @(Maybe (Bool, Bool))
-- Size 5

newtype AtDepth f a = AtDepth (Int -> f a)

class Enumerate a where
    enumerate :: [a]
    default enumerate :: (Generic a, GAlternating Enumerate (Rep a)) => [a]
    enumerate = alternate (Proxy @Enumerate) enumerate
    alternatives :: Alternative f => f a
    default alternatives :: (Alternative f, Generic a, GAlternating Enumerate (Rep a)) => f a
    alternatives = alternate (Proxy @Enumerate) alternatives

    size :: SizeOf a
    size = alternatives

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
--   alternatives = pure 0 <|> alternativesInt 1
  alternatives = pure 0 <|> alternativesInt 1

binaryToInt :: [Bool] -> Int
binaryToInt [] = 1
binaryToInt (x:xs) = fromEnum x + 2* binaryToInt xs

alternativesInt :: (Alternative f) => Int -> f Int
alternativesInt n = pure n <|> alternativesInt (2*n) <|> alternativesInt (2*n + 1)

-- >>> sort $ toShallowList @Int 7
-- [0,1,2,3,5,6,7,15]

-- >>> take 10 $ binaryToInt . getZipList <$> alternatives
-- >>> take 10 $ binaryToInt <$> alternatives
-- >>> binaryToInt . reverse <$> toShallowList 8
-- >>> binaryToInt <$> toShallowList 8
-- >>> sort $ binaryToInt <$> toShallowList 8
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
