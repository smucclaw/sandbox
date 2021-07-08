module Junk.StackoverflowQuestion66897069 where
import Debug.Trace ( trace )

heavyComputation :: Int -> Int
heavyComputation x = trace ("heavyComputation " ++ show x) (x+1)

plus :: Int -> Int -> Int
plus x y = trace ("addition " ++ show x ++ " " ++ show y) (x + y)

impl1 :: [Int]
impl1 = trace "Impl1" [heavyComputation i | i <- [0..5]]

impl2 :: [Int]
impl2 = trace "Impl2" (let n = heavyComputation 0
                       in [plus i n | i <- [0..5]])

tryBoth :: IO ()
tryBoth = do
    print $ sum impl1
    print $ sum impl2

