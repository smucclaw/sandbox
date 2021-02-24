{-# LANGUAGE InstanceSigs #-}

{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib where

import Control.Monad (join, liftM, ap)
import Data.String (IsString(..))

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

-- phantom type
-- I did not use Maybe in first try. Worked perfectly with Monad but Applicative had funny behaviour.
-- Added Maybe and fixed Applicative behaviour.
newtype MyVowels a = MkV {unV :: Maybe [String]}
  deriving (Show, Eq)

-- overloaded strings
instance IsString (MyVowels a) where
  fromString string = MkV $ Just [string]

-- basically, Functor and Applicative are derived from Monad
instance Functor MyVowels where
  fmap = liftM
instance Applicative MyVowels where
  (<*>) = ap
  pure = return

-- the "programmable semicolon" here inserts every possible vowel, in between lines of the "do"
instance Monad MyVowels where
  (>>=) :: forall a b . MyVowels a -> (a -> MyVowels b) -> MyVowels b
  (>>=) (MkV mxss) f =
    let (MkV myss) = f undefined -- magic
     in case (mxss,myss) of
        (Just xss, Just yss) -> MkV $ Just $
          [ xs ++ [vowel] ++ ys
            | xs <- xss
            , vowel <- "aeiou"
            , ys <- yss
          ]
        (Just xss, Nothing) -> MkV $ Just xss
        (Nothing, Just yss) -> MkV $ Just yss
        _ -> MkV Nothing
        
  return _ = MkV Nothing

example :: MyVowels () = "x"
-- >>> example
-- MkV {unV = Just ["x"]}

example1 :: MyVowels () = do
  "x"
  "y"
example2 :: MyVowels () = do
  "x"
  "y"
  "z"

-- >>> example1
-- >>> fmap length $ unV example1
-- >>> example2
-- >>> fmap length $ unV example2
-- MkV {unV = Just ["xay","xey","xiy","xoy","xuy"]}
-- Just 5
-- MkV {unV = Just ["xayaz","xayez","xayiz","xayoz","xayuz","xeyaz","xeyez","xeyiz","xeyoz","xeyuz","xiyaz","xiyez","xiyiz","xiyoz","xiyuz","xoyaz","xoyez","xoyiz","xoyoz","xoyuz","xuyaz","xuyez","xuyiz","xuyoz","xuyuz"]}
-- Just 25

-- >>> "x" :: MyVowels ()
-- >>> "x" <*> "y" :: MyVowels ()
-- >>> "x" <*> "y" <*> "z" :: MyVowels ()
-- MkV {unV = Just ["x"]}
-- MkV {unV = Just ["xay","xey","xiy","xoy","xuy"]}
-- MkV {unV = Just ["xayaz","xayez","xayiz","xayoz","xayuz","xeyaz","xeyez","xeyiz","xeyoz","xeyuz","xiyaz","xiyez","xiyiz","xiyoz","xiyuz","xoyaz","xoyez","xoyiz","xoyoz","xoyuz","xuyaz","xuyez","xuyiz","xuyoz","xuyuz"]}

-- >>> sequence [] :: MyVowels [()]
-- >>> sequence ["x" :: MyVowels ()]
-- >>> sequence ["x" :: MyVowels (), "y"]
-- >>> sequence ["x" :: MyVowels (), "y", "z"]
-- MkV {unV = Nothing}
-- MkV {unV = Just ["x"]}
-- MkV {unV = Just ["xay","xey","xiy","xoy","xuy"]}
-- MkV {unV = Just ["xayaz","xayez","xayiz","xayoz","xayuz","xeyaz","xeyez","xeyiz","xeyoz","xeyuz","xiyaz","xiyez","xiyiz","xiyoz","xiyuz","xoyaz","xoyez","xoyiz","xoyoz","xoyuz","xuyaz","xuyez","xuyiz","xuyoz","xuyuz"]}
