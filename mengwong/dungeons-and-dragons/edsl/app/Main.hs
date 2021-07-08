{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PackageImports #-}

module Main where
import "edsl" Lib
import System.Environment
import Options.Generic

data MyOpts = MyOpts { out :: String
                     , sketch :: String
                     }
    deriving (Generic, Show)

instance ParseRecord MyOpts

main = do
    x <- getRecord "edsl-exe"
    -- print (x :: MyOpts)
    writePCC ( out x ) ( sketch x )

