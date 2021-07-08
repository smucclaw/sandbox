module Junk.Stackoverflow66941010 where
{-# ANN module "HLINT: ignore Use camelCase" #-}

data Statistics = MkStatistics
  { matches      :: Int
  , total_points :: Int
  , goal_for     :: Int
  , goal_against :: Int
  , dif          :: Int
  }

emptyStatistics :: Statistics
emptyStatistics = MkStatistics 0 0 0 0 0

statistics :: [(Int,Int)] -> Statistics
statistics s = help_statistics s s 0 emptyStatistics

help_statistics :: [(Int,Int)] -> [(Int,Int)] -> Int -> Statistics -> Statistics
help_statistics s ((x,y):tl) counter@0 stats
    -- When counter == 0, increase it by 1 (i.e. set it to 1)
    -- Is this really what whas intended?
    = help_statistics s tl (counter+1) stats'
  where stats' = stats {matches = length s} -- Update `matches` to a new value
help_statistics s (_:_) counter stats
   = stats -- when counter is not 0, return the stats. Was this reversed?
help_statistics s [] counter stats
   = stats -- What should we do with an empty list?

--
