{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Gates where

import Data.Text ( Text )
import Generic.Data ( Generic )

-- *** Readme *** --
-- Use graphviz library for visualisation.
-- Graphviz uses fgl library.
-- Fgl library represents nodes using a unique index of type Int.
-- I use Generic.Data from generic-data library to
--    auto-generate unique indices. (using the function: gconIndex)

-- | Gates used in the model.
data NodeRef = Bulb'MustNot | Bulb'May | And'MustNot | Or'May | N1 | N2 | M3 | M4 | M5
  deriving (Generic, Show)

-- | Logic gate types
data GateType = NOT | AND | OR | NOR | Bulb | Switch deriving Show

-- | 
data GateInfo = GInfo { gType :: GateType, gDescr :: Text } deriving Show

-- | To specify info about each specific gate (node).
gateInfo :: NodeRef -> GateInfo
gateInfo = \case
  Bulb'MustNot -> GInfo Bulb "Must Not"
  Bulb'May -> GInfo Bulb "May"
  And'MustNot -> GInfo AND "Must Not"
  Or'May -> GInfo OR "May"
  N1 -> GInfo Switch "N1"
  N2 -> GInfo Switch "N2"
  M3 -> GInfo Switch "N3"
  M4 -> GInfo Switch "M4"
  M5 -> GInfo Switch "M5"

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


gatesMain :: IO ()
gatesMain = do
  putStrLn "__gatesMain__"