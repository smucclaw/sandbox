-- Fake main program without intrinsic interest

{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}

module Main where


main :: IO ()
main = do
  putStrLn "hello world"
