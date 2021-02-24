{-# LANGUAGE InstanceSigs #-}
module Lib where

import Control.Monad (join)

someFunc :: IO ()
someFunc = putStrLn "someFunc"

-- naively,
(</>) a bs = if null bs then pure a else [ a <> [x] <> b | x <- "aeiou", b <- bs ]
infixr 7 </>

-- λ: take 10 ("s" </> "p" </> "rm" </> "rk" </> "t" </> [])
-- ["saparmarkat","saparmarket","saparmarkit","saparmarkot","saparmarkut","saparmerkat","saparmerket","saparmerkit","saparmerkot","saparmerkut"]
  
-- let's do it more natively

-- should return    MkV ["supermarket", "saparmarkat", "sopormorket", ... ]
-- vowelize :: MyVowels String
-- vowelize = do
--   "s"
--   "pr"
--   "mr"
--   "kt"



data MyVowels a = MkV [a] deriving (Show, Eq)

instance Functor MyVowels where
  fmap :: (a -> b) -> MyVowels a -> MyVowels b
  fmap f (MkV xs) = MkV (fmap f xs)

instance Applicative MyVowels where
  (<*>) :: MyVowels (a -> b) -> MyVowels a -> MyVowels b
  (<*>) (MkV fs) (MkV xs) = MkV (fs <*> xs)
  pure x = MkV [x]

-- the "programmable semicolon" here inserts every possible vowel, in between lines of the "do"
instance Monad MyVowels where
  (>>=) :: (MyVowels a) -> (a -> MyVowels b) -> MyVowels b
  (>>=) (MkV []) _ = MkV []
  (>>=) (MkV xs) f =
    -- let's start with a "simple" id
    let -- ys :: [MyVowels b]
        ys = [ f (x ++ [vowel])
             | x <- xs
             , vowel <- "aeiou" ]
        unwrapped = concat [ zs
                           | (MkV zs) <- ys
                           ]
        -- toreturn :: MyVowels c
        toreturn = MkV unwrapped    -- sequence :: (Traversable t, Monad m) => t (m a) -> m (t a)
    in
      toreturn

-- this works with
-- let monadicUC str = MkV [stringUpper str]

