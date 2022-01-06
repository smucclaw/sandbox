{-# LANGUAGE
    TypeOperators
  , DeriveGeneric
  , DeriveAnyClass
  , ConstraintKinds
  , FlexibleContexts
  , TypeApplications
  , DefaultSignatures
  , KindSignatures
  , ScopedTypeVariables
  , MonoLocalBinds

  , UndecidableInstances
  , UndecidableSuperClasses
  , FlexibleInstances
  #-}

-- depends on the one-liner library
module OneLinerExamples.Defaultsignature where

import GHC.Generics
import Generics.OneLiner

import Data.Monoid
import Control.Applicative
import Data.Bifunctor (first)
import Data.Maybe (fromMaybe)
import Data.Proxy (Proxy(..))
import Data.Typeable (Typeable, cast, eqT, (:~:)(..))
import Control.Monad.Identity


class Size t where

  size :: t -> Int

  default size :: (ADT t, Constraints t Size) => t -> Int
  size = succ . getSum . gfoldMap @Size (Sum . size)

instance Size Bool
instance Size ()
instance Size a => Size (Maybe a)

-- class Size1 t where

--   size1 :: Size a => t a -> Int

--   default size1 :: (ADT1 t, Constraints1 t Size1) => t a -> Int
--   size1 = succ . getSum . gfoldMap1 @Size1 _ (Sum . size1)

type Collection a = Tree a
-- type Collection a = [a]
-- type Collection a = BFS a


class EnumAll t where

--   enumAll :: [t]

--   default enumAll :: (ADT t, Constraints t EnumAll) => [t]
--   enumAll = createA @EnumAll enumAll
  enumAll :: Collection t

  default enumAll :: (ADT t, Constraints t EnumAll) => Collection t
  enumAll = createA @EnumAll enumAll

instance EnumAll Bool
instance EnumAll ()
instance EnumAll a => EnumAll (Maybe a)


infixr 5 :^:
-- data Tree a = Leaf { value :: a } | Tree a :^: Tree a
data Tree a = Leaf a | Tree a :^: Tree a
  deriving (Show, Generic, Generic1, Size, EnumAll)

instance Functor Tree where
  fmap = gmap1 @Functor fmap
--   fmap f (Leaf x) = Leaf (f x)
--   fmap f (x :^: y) = fmap f x :^: fmap f y

instance Applicative Tree where
  pure = Leaf
  Leaf f <*> x = fmap f x
  (f :^: g) <*> x = (f <*> x) :^: (g <*> x)
--   Leaf f <*> Leaf x = Leaf (f x)
--   f <*> (t :^: u) = (f <*> t) :^: (f <*> u)

instance Alternative Tree where
  empty = error "Empty trees not allowed"
  (<|>) = (:^:)

trees :: Collection (Tree (Maybe Bool))
-- trees :: Collection (Tree (Bool))
trees = enumAll

sizes :: Collection (Int)
sizes = fmap size trees

diff xs = zipWith (-) (tail xs) xs

trunkateDepth :: Eq a => Int -> a -> Tree a -> Tree a
trunkateDepth 0 a _ = Leaf a
trunkateDepth n a (Leaf x) = Leaf x
trunkateDepth n a (x :^: y) = compact $ trunkateDepth (n - 1) a x :^: trunkateDepth (n - 1) a y
  where 
    compact (Leaf a1 :^: Leaf a2) | a1 == a, a2 == a = Leaf a
    compact a = a

printTree :: Show a => Int -> Int -> Tree a -> IO ()
printTree n d = putStrLn . take n . drawTree . trunkateDepth d "..." . fmap show

-- | 2-dimensional ASCII drawing of a tree.
--
-- ==== __Examples__
--
-- > putStr $ drawTree $ fmap show $ (Leaf 1 :^: Leaf 2) :^: Leaf 3
--
-- @
-- +-+- 1
-- | |
-- | `- 2
-- |
-- `- 3
-- @
--
-- Other variation:
--
-- @
-- ,
-- +-,
-- | +- 1
-- | `- 2
-- `- 3
-- @
--
drawTree :: Tree String -> String
drawTree  = unlines . draw


draw :: Tree String -> [String]
-- draw (Node x ts0) = lines x ++ drawSubTrees ts0
draw = drawSubTrees
  where
    drawSubTrees :: Tree String -> [String]
    drawSubTrees (Leaf t) = [' ' : t]
    drawSubTrees (t :^: u) = 
        "," :
        shift "+-" "| " (draw t)
        ++ 
        -- "|" : 
        shift "`-" "  " (draw u)

    shift first other = zipWith (++) (first : repeat other)

newtype BFS a = BFS { unBFS :: [a] }
  deriving (Eq, Show, Generic)

instance Functor BFS where
  fmap f (BFS xs) = BFS (fmap f xs)

instance Applicative BFS where
  pure x = BFS [x]
  BFS [] <*> _ = empty
  BFS (f:fs) <*> xs = fmap f xs <|> BFS fs <*> xs
--   BFS fs <*> BFS xs = BFS (combine fs xs)
--    where
--     combine :: [a -> b] -> [a] -> [b]
--     combine [] _ = []
--     combine (f:fs) xs = fmap f xs +++ combine fs xs

instance Alternative BFS where
  empty = BFS []
  BFS xs <|> ys = BFS $ xs +++ (unBFS ys)
--   BFS [] <|> BFS ys = BFS ys
--   BFS (x:xs) <|> BFS ys = BFS [x] <|> BFS (ys <|> xs)

   where
    (+++) :: [a] -> [a] -> [a]
    [] +++ ys = ys
    -- xs +++ [] = xs
    (x:xs) +++ ys = x : (ys +++ xs)

bfs :: Tree a -> [a]
bfs = fmap snd . bfs'

bfs' (Leaf x) = [(0,x)]
bfs' (x :^: y) = fmap (first succ) $ bfs' x +^^+ bfs' y
  where
    [] +^^+ ys = ys
    (x:xs) +^^+ ys = x : (xs +^+ ys)
    [] +^+ ys = ys
    (x:xs) +^+ (y:ys) | fst x <= fst y = x : (xs +^+ (y:ys))
    (x:xs) +^+ (y:ys) | fst x > fst y = y : ((x:xs) +^+ ys)
    xs +^+ [] = xs

data Deeper a = Here a | Deeper (Maybe a) (Deeper a)
  deriving Show

bfs'' :: Tree a -> Deeper [a]
bfs'' (Leaf x) = Here [x]
bfs'' (xs :^: ys) = Deeper Nothing $ bfs'' xs +++ bfs'' ys
  where
    Here xs +++ Here ys = Here (xs ++ ys)
    Here xs +++ Deeper ys1 ys = Deeper (Just xs <> ys1) ys
    Deeper xs1 xs +++ Here ys = Deeper (xs1 <> Just ys) xs
    Deeper xs1 xs +++ Deeper ys1 ys = Deeper (xs1 <> ys1) (xs +++ ys)

bfs''' :: Tree a -> [[a]]
bfs''' (Leaf x) = [[x]]
bfs''' (xs :^: ys) = [] : zipWithExtend (++) (bfs''' xs) (bfs''' ys)

zipWithExtend :: (a -> a -> a) -> [a] -> [a] -> [a]
zipWithExtend f [] ys = ys
zipWithExtend f xs [] = xs
zipWithExtend f (x:xs) (y:ys) = f x y : zipWithExtend f xs ys

-- printTree 2000 9 trees
-- mapM_ ((>>putStrLn "--") . mapM_ print) $ take 10 $ bfs''' trees

class Never (f :: * -> *) where
  never :: proxy f -> x

mkProxy :: f a -> Proxy f
mkProxy _ = Proxy

myListFoldMap :: Monoid m => (a -> m) -> [a] -> m
myListFoldMap = gfoldMap1 @((~) []) myListFoldMap

-- | foldMap for simple recursive types
myFoldMap :: forall t m a. (ADT1 t, Constraints1 t ((~) t), Monoid m) => (a -> m) -> t a -> m
myFoldMap = gfoldMap1 @((~) t) myFoldMap

myGtraverse1 :: forall t f a b. (ADT1 t, Constraints1 t ((~) t), Applicative f) => (a -> f b) -> t a -> f (t b)
myGtraverse1 = gtraverse1 @((~) t) myGtraverse1

mygeneric1 :: forall p t a b. (ADT1 t, Constraints1 t ((~) t), GenericProfunctor p) => p a b -> p (t a) (t b)
mygeneric1 = generic1 @((~) t) mygeneric1

modifyAtType :: forall a b. (ADT b, Constraints b Typeable, Typeable a, Typeable b) => (a -> a) -> b -> b
modifyAtType f = gmap @Typeable (maybe (maybe id id (cast (modifyAtType @a @b f))) id (cast f))

class (Typeable a) => DeepChange a where
  deepChange :: Typeable b => (b -> b) -> a -> a
  deepChange f = runIdentity . deepTraverse (Identity . f)
--   default deepChange :: (ADT a, Constraints a DeepChange, Typeable b) => (b -> b) -> a -> a
--   deepChange f = gmap @DeepChange (maybe (deepChange f) id (cast f))
  deepTraverse :: forall b f. (Applicative f, Typeable b) => (b -> f b) -> a -> f a
  default deepTraverse :: forall b f. (ADT a, Constraints a DeepChange, Typeable b, Applicative f)  => (b -> f b) -> a -> f a
--   deepTraverse f = gtraverse @DeepChange $ case eqT @a @b of
  deepTraverse f = case eqT @a @b of
    Just Refl -> f
    Nothing -> gtraverse @DeepChange (deepTraverse f)

traverseNoop :: forall f a b. (Applicative f, Typeable a, Typeable b) => (b -> f b) -> a -> f a
traverseNoop f = case eqT @a @b of
    Just Refl -> f
    Nothing -> pure


deepFoldMap :: (Typeable b, DeepChange a, Monoid m) => (b -> m) -> a -> m
deepFoldMap f = getConst . deepTraverse (Const . f)

instance DeepChange a => DeepChange [a]
instance (DeepChange a, DeepChange b) => DeepChange (a,b)
instance (DeepChange a, DeepChange b, DeepChange c) => DeepChange (a,b,c)
instance DeepChange Char where deepChange = const id; deepTraverse = traverseNoop
instance DeepChange Int where deepTraverse = traverseNoop

-- modifyAtType :: forall a b. (ADT b, Constraints b RecursiveADT, Typeable a) => (a -> a) -> b -> b
-- modifyAtType f = gmap @RecursiveADT (maybe (modifyAtType f) id (cast f))
-- class (ADT a, Constraints a RecursiveADT, Typeable a) => RecursiveADT a
-- instance (ADT a, Constraints a RecursiveADT, Typeable a) => RecursiveADT a