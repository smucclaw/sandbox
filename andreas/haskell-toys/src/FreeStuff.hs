{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE QuantifiedConstraints #-}
{-# LANGUAGE DeriveFunctor #-}
module FreeStuff where

import Data.Maybe (fromMaybe)
data Free f a
 = Pure a
 | Free (f (Free f a))

deriving instance (Show a, forall b. Show b => Show (f b)) => Show (Free f a)

instance Functor f => Functor (Free f) where
  fmap f = go where
    go (Pure a)  = Pure (f a)
    go (Free fa) = Free (go <$> fa)

instance Functor f => Applicative (Free f) where
  pure = Pure
  {-# INLINE pure #-}
  Pure a <*> Pure b = Pure $ a b
  Pure a <*> Free mb = Free $ fmap a <$> mb
  Free ma <*> b = Free $ (<*> b) <$> ma
instance Functor f => Monad (Free f) where
  Free a >>= f   = Free (fmap (>>= f) a)
  Pure a >>= f = f a


type FList a = Free ((,) a) ()


data DSL next = Get String (String -> next)
              | Set String String next
              | Choice Bool next next
              | EndX
              deriving Functor

type FDSL = Free DSL

get :: String -> FDSL String
get s = Free (Get s Pure)

setX :: String -> String -> FDSL ()
setX s1 s2 = Free (Set s1 s2 (Pure ()))

end' :: FDSL a
end' = Free EndX

program :: Free DSL ()
program = do
  x <- get "foo"
  setX "bar" x
  end'
  setX "baz" "hey"

program2 :: Free DSL ()
program2 = do
  x <- get "foo"
  setX "bar" x

program3 :: Free DSL ()
program3 = do
  x <- get "foo"
  setX "bar" x
  setX "foo" "Fooish"

iterM :: (Monad m, Functor f) => (f (m a) -> m a) -> Free f a -> m a
iterM _   (Pure x) = return x
iterM phi (Free f) = phi (iterM phi <$> f)

-- | Tear down a 'Free' 'Monad' using iteration.
iter :: Functor f => (f a -> a) -> Free f a -> a
iter _ (Pure a) = a
iter phi (Free m) = phi (iter phi <$> m)

runIO :: FDSL () -> IO ()
runIO = iterM $ \case
  Get x cont -> do
    print x
    cont "hello"
  Set x val cont -> do
    putStrLn $ "Set " ++ show x ++ " to " ++ show val
    cont
  EndX -> pure ()

-- | This is a reverse state monad that runs backwards
-- *time travel*
runPure :: FDSL [(String,String)] -> [(String,String)]
runPure = iter $ \case
  Get x cont -> let
    y = fromMaybe ("Unknown value: " ++ x) $ lookup x ys
    ys = cont y
    in ys
  Set x val cont -> (x,val):cont
  EndX -> []

-- >>> runPure $ [("a","b")] <$ program2
-- >>> runPure $ [("a","b")] <$ program3
-- [("bar","Unknown value: foo"),("a","b")]
-- [("bar","Fooish"),("foo","Fooish"),("a","b")]

-- get2 :: String -> (String -> Free DSL a) -> Free DSL a
-- get2 s f = Free (Get s f)
