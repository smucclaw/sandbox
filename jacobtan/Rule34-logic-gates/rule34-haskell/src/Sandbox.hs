{-# LANGUAGE PackageImports #-}
module Sandbox where

import "svg-builder-sandbox" Lib ( someFunc )

x :: IO ()
x = someFunc
