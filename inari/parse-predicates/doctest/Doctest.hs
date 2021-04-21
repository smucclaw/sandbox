module Main
  ( main
  )
where

import Test.DocTest

main :: IO ()
main = doctest $ [ "-package parse-predicates","-isrc","src/ParsePred.hs", "app/Main.hs"] <> ghcArgs

ghcArgs :: [String]
ghcArgs = []
--   [ "-XDataKinds"
--   , "-XGADTs"
--   , "-XTypeApplications"
--   , "-XTypeOperators"
--   ]
