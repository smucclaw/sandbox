----------------------------------------------------------------------------
-- |
-- Module      :  Main
-- Copyright   :  (c) Fontaine 2011
-- License     :  BSD3
-- 
-- Maintainer  :  fontaine@cs.uni-duesseldorf.de
-- Stability   :  experimental
-- Portability :  GHC-only
--
-- Generate Haskell and Prolog modules from parser tables which are
-- generated by the SableCC parser generator.
--
-- The input should be an XML file in the format of
-- sablecc-3-beta.3.altgen.20041114
--
-----------------------------------------------------------------------------

module Main (main) where

import SableCC.GenerateHaskell (generateHaskellTables)
-- import SableCC.GenerateProlog (generatePrologTables)

import System.Environment
import System.Exit

main :: IO ()
main = do
  args <- getArgs
  case args of
    [fileName] -> do
       -- generatePrologTables fileName
       generateHaskellTables fileName
       exitSuccess
    _ -> putStrLn "Name of the XML file is required as argument" >> exitFailure 