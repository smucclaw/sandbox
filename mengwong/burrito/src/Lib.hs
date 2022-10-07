{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( someFunc
    ) where

-- | demonstrate how to generate a stream of random strings for insertion into XML ids
-- for background, see
-- - haskellbook.com chapter 23
-- - https://hackage.haskell.org/package/random-1.2.1.1/docs/System-Random.html
-- - https://hackage.haskell.org/package/string-random-0.1.4.3/docs/Text-StringRandom.html
-- - https://hackage.haskell.org/package/string-random-0.1.4.3/docs/Text-StringRandom.html

import System.Random
import Control.Monad.Trans.State
import Control.Monad
import System.Random.Stateful
import Text.StringRandom
import qualified Data.Text.Lazy as TL
import qualified Data.Text      as T

someFunc :: IO ()
someFunc = do
  putStrLn "* first we try to obtain a stream of random numbers, using the standard Random State Monad approach"
  let
    gen = mkStdGen 2022
    rollDie :: State StdGen Int
    rollDie = state $ do
      (n, s) <- randomR (1,6)
      return (n, s)
    random1 = runState rollDie gen
    random2 = runState rollDie (snd random1)
    random3 = runState rollDie (snd random2)
    random4 = runState rollDie (snd random3)
    random5 = runState rollDie (snd random4)
    random6 = runState rollDie (snd random5)
    randomStream = randomRs (1 :: Int, 6)
  putStrLn $ "- random1: " ++ show (random1)
  putStrLn $ "- random2: " ++ show (random2)
  putStrLn $ "- random3: " ++ show (random3)
  putStrLn $ "- random4: " ++ show (random4)
  putStrLn $ "- random5: " ++ show (random5)
  putStrLn $ "- random6: " ++ show (random6)
  -- we observe that randomStream is pure
  putStr "- randomStream: "; print (take 6 $ randomStream gen)
  putStr "- randomStream: "; print (take 6 $ randomStream gen)


  putStrLn "* now we try it with the MonadIO approach"
  let
    rollIO = applyAtomicGen (uniformR (1,6)) globalStdGen
    rollStreamIO = replicateM 10 (rollIO :: IO Int)

  -- thanks to IO we do not get a pure result!
  rollStream1 <- rollStreamIO  
  putStr "- "; print $ take 6 rollStream1

  rollStream2 <- rollStreamIO  
  putStr "- "; print $ take 6 rollStream2

  putStrLn "* instead of rolling a six-sided die, let's roll a 16-sided die"
  let
    rollStringIO = stringRandomIO (T.replicate 6 "[0-9a-f]")

  rollString1 <- rollStringIO
  print rollString1

  rollString2 <- rollStringIO
  print rollString2
  

  putStrLn "* let's pretend we need to fill a piece of XHTML"
  let
    htmlTemplate = "<html><head><title>hello, world!</title></head><body><p>I am an XHTML.</p.</body></html>"

  putStrLn "\n** the original html template"
  putStrLn "#+BEGIN_SRC html"
  putStrLn htmlTemplate
  putStrLn "#+END_SRC\n"

  idsInserted <- insertIDs rollStringIO htmlTemplate

  putStrLn "\n** with IDs in perhaps more places than necessary"
  putStrLn "#+BEGIN_SRC html"
  putStrLn $ T.unpack idsInserted
  putStrLn "#+END_SRC"

  where
    insertIDs :: IO T.Text -> String -> IO T.Text
    insertIDs rollID htmlTemplate = do
      let htmlText = T.pack htmlTemplate
      rereplace ">" rollID " id=\"" "\">" htmlText

    rereplace :: T.Text -> IO T.Text -> T.Text -> T.Text -> T.Text -> IO T.Text
    rereplace needle replacementIO prefix postfix haystack =
      reres $ T.splitOn needle haystack
      where
        reres :: [T.Text] -> IO T.Text
        reres [] = return ""
        reres [x] = return x
        reres (x:xs) = do
          replacement <- replacementIO
          reres' <- reres xs
          return $ x <> prefix <> replacement <> postfix <> reres'

