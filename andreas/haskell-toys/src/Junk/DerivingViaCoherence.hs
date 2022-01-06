{-# LANGUAGE DerivingVia #-}
module Junk.DerivingViaCoherence where
-- Does this cause problems?

-- import Control.Applicative (ZipList(..))
-- newtype Foo a = Foo [a]
--   deriving (Functor, Applicative) via ZipList
--   deriving (Monad) via []

class Hello a where
  hello :: a -> String

class Hello a => World a where
  world :: a -> String

newtype HelloWorld = HW ()
instance Hello HelloWorld where hello _ = "hello"
instance World HelloWorld where world x = hello x ++ " world"

newtype HiEarth = HE ()
instance Hello HiEarth where hello _ = "hi"
instance World HiEarth where world x = hello x ++ " earth"

-- >>> hello $ Both ()
-- "hello"
--
-- >>> world $ Both ()
-- "hi earth"
newtype Both = Both ()
  deriving World via HiEarth
  deriving Hello via HelloWorld
