module Rule34 where

import Encoding
import LogicGates

data MyRule = MyRule { label :: String
                     , defeasors :: [Defeasor]
                     , party :: Party
                     , deontic :: Deontic
                --   , action :: Action
                     , condition :: Condition
                     }

type Party = String
lp :: Party


rule34_1_a = MyRule { label = "34.1.a undignified"
                    , defeasors = []
                    , party = lp
                    , deontic = MustNot 
                    , condition = 
                    }

toCircuitDiagram :: [MyRule] -> NodeList

