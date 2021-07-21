{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PackageImports #-}

module Main where

import "rule34-haskell" Lib ( mainFunc )
import "rule34-haskell" Rule34 ( MyRule(..) )
import qualified SandboxBuilder

import System.Environment
import Options.Generic

data MyOpts = MyOpts { out :: String
                     , src :: String
                     }
    deriving (Generic, Show)

instance ParseRecord MyOpts

main = do
    x <- getRecord "l4-to-png"
    putStrLn ("* loading haskell embedded DSL source for reading from " ++ (src x))
    inputFile <- readFile $ src x
    let mysketch = read inputFile :: MyRule
    print mysketch
    putStrLn ("* output: normally we would output to " ++ (out x))
    -- SandboxBuilder.main

-- usage:
-- stack run rule34-png -- --src read/myrule.txt --out myruleout1.png
-- reads myrule.txt
-- converts it to an AnyAll
-- converts it to a PNG
-- saves the png to the file specified in the --out

