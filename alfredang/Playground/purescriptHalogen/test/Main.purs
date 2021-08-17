module Test.Main where

import Prelude

import Euler (answer)
import Test.Assert (assert)
import Effect (Effect)

main :: Effect Unit
main = do
  assert (answer == 233168)