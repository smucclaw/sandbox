{-# LANGUAGE PackageImports #-}
module Main where

import "rule34-haskell" Lib ( mainFunc )
import qualified SandboxBuilder

main = SandboxBuilder.main

-- usage:
-- ┌─[mengwong@solo-wmw] - [~/src/smucclaw/sandbox/jacobtan/Rule34-logic-gates/rule34-haskell] - [2021-04-26 09:00:16]
-- └─[0] <git:(default e208aad✱✈) > stack run | perl -ple 's/^\s+//' > asorg.org

