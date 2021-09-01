{-# LANGUAGE PackageImports #-}
module Main where

import Lib ( mainFunc )
import Rule34 ( as_org )

main :: IO ()
main = as_org

-- usage:
-- ┌─[mengwong@solo-wmw] - [~/src/smucclaw/sandbox/jacobtan/Rule34-logic-gates/rule34-haskell] - [2021-04-26 09:00:16]
-- └─[0] <git:(default e208aad✱✈) > stack run | perl -ple 's/^\s+//' > asorg.org

