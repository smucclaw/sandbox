{-# LANGUAGE PackageImports #-}

module Main where

import "edsl" Lib

main :: IO ()
main = writePCC "viz/pcc2"
