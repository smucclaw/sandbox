module MyRead where

import Text.Read (Read)

data MyData = MyData { n :: Int }
  deriving (Eq, Show, Read)

