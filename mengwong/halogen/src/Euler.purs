module Euler where

import Prelude

import Data.List
import Data.Foldable

answer n = sum $ filter (\n -> mod n 3 == 0 || mod n 5 == 0) $ 0 .. n
