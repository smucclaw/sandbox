module Main where

import SCaspAbsSyn
import ToGF

main :: IO ()
-- main = parseModel' testModel
main = do
  let Right model = parseModel testModel
  nlg model

