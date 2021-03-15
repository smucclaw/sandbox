module Main where

import SCasp
import ToGF

main :: IO ()
-- main = parseModel' testModel
main = do
  putStrLn testModel
  let Right model = parseModel testModel
  nlg model

