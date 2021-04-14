{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeApplications #-}
module Encoding where

import Data.Text ( Text )
import Generic.Data ( Generic, genumFrom, gtoEnum, gconIndex )


-- | Gates used in the model.
data NodeRef = Bulb'MustNot | Bulb'May | And'MustNot | Or'May | N1 | N2 | M3 | M4 | M5
  deriving (Generic, Show)

nodeList :: [NodeRef]
nodeList = genumFrom (gtoEnum @NodeRef 0)
-- ^ Use generics to generate a list of all the nodes (gates),
--   i.e. a list of all the constructors in the NodeRef data type.

-- | Logic gate types
data GateType = NOT | AND | OR | NOR | Bulb | Switch deriving Show

-- | 
data NodeInfo = Node { gType :: GateType, gDescr :: Text } deriving Show

-- | To specify info about each specific gate (node).
nodeInfo :: NodeRef -> NodeInfo
nodeInfo = \case
  Bulb'MustNot -> Node Bulb "Must Not"
  Bulb'May -> Node Bulb "May"
  And'MustNot -> Node AND "Must Not"
  Or'May -> Node OR "May"
  N1 -> Node Switch "N1"
  N2 -> Node Switch "N2"
  M3 -> Node Switch "N3"
  M4 -> Node Switch "M4"
  M5 -> Node Switch "M5"

edges0 :: [(NodeRef, NodeRef)]
edges0 = [
  (And'MustNot, Bulb'MustNot),
  (N1, And'MustNot),
  (N2, And'MustNot),

  (Or'May, Bulb'May),
  (M3, Or'May),
  (M4, Or'May),
  (M5, Or'May)
  ]


encodingMain :: IO ()
encodingMain = do
  putStrLn "__gatesMain__"
  print $ gconIndex Bulb'May
  print $ gconIndex Or'May
  print $ genumFrom Bulb'MustNot
  print $ genumFrom (gtoEnum @NodeRef 0) -- nodeList