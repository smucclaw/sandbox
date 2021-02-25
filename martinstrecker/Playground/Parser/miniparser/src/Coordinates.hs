module Coordinates where

-- coordinate point
data CoordPt = CoordPt  Int Int
    deriving (Eq, Ord, Show, Read)

-- coordinate range
data CoordRng
     = CoordUnknown
     | CoordRng CoordPt CoordPt
    deriving (Eq, Ord, Show, Read)

