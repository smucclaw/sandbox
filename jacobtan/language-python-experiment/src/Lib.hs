module Lib
    ( someFunc
    ) where

import Language.Python.Common
import Language.Python.Version3 (parseModule)

someFunc :: IO ()
someFunc = putStrLn "someFunc"

x = either show (prettyText . fst) $ parseModule "def inc(x): return x + 1\n" []