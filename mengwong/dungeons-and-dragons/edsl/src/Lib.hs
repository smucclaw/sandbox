module Lib
    ( mymain
    ) where

import Data.Tree
import Data.Graph.Inductive

type StateName = String

data State = MkState { stateName :: StateName
                     , outDegree :: StateName
                     }

type StateTree = Tree State

charCreator :: StateTree
charCreator = 

someFunc :: IO ()
someFunc = putStrLn "someFunc"
