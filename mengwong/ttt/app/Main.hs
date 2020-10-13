
-- from How To Interview Engineers
-- https://defmacro.substack.com/p/how-to-interview-engineers

module Main where

import Data.Array
import Data.List
import Data.List.Split (chunksOf)
import Data.Maybe
import Control.Monad
import Debug.Trace

data Player = X | O        deriving (Show, Eq)
type Cell   = Maybe Player
type Board  = Array Int Cell
type BoardList = [Cell]

winner :: Board -> Maybe Player
winner b = winnerl $ elems b

winnerl :: BoardList -> Maybe Player
winnerl [(Just X), (Just X), (Just X), _, _, _, _, _, _] = Just X
winnerl [_, _, _, (Just X), (Just X), (Just X), _, _, _] = Just X
winnerl [_, _, _, _, _, _, (Just X), (Just X), (Just X)] = Just X
winnerl [(Just X), _, _, (Just X), _, _, (Just X), _, _] = Just X
winnerl [_, (Just X), _, _, (Just X), _, _, (Just X), _] = Just X
winnerl [_, _, (Just X), _, _, (Just X), _, _, (Just X)] = Just X
winnerl [_, _, (Just X), _, (Just X), _, (Just X), _, _] = Just X
winnerl [(Just X), _, _, _, (Just X), _, _, _, (Just X)] = Just X
winnerl [(Just O), (Just O), (Just O), _, _, _, _, _, _] = Just O
winnerl [_, _, _, (Just O), (Just O), (Just O), _, _, _] = Just O
winnerl [_, _, _, _, _, _, (Just O), (Just O), (Just O)] = Just O
winnerl [(Just O), _, _, (Just O), _, _, (Just O), _, _] = Just O
winnerl [_, (Just O), _, _, (Just O), _, _, (Just O), _] = Just O
winnerl [_, _, (Just O), _, _, (Just O), _, _, (Just O)] = Just O
winnerl [_, _, (Just O), _, (Just O), _, (Just O), _, _] = Just O
winnerl [(Just O), _, _, _, (Just O), _, _, _, (Just O)] = Just O
winnerl _                                                = Nothing

allGames :: [Player] -> [Board] -> [Board]
allGames [] inboards = inboards -- draws
allGames (player:players) inboards = do
  board <- inboards
  if winner board /= Nothing
    then pure board
    else allGames players [ board // [(cell, Just player)]
                          | cell <- [0..8]
                          , board ! cell == Nothing ]

main :: IO ()
main = print $ length $ allGames (take 9 $ cycle [X,O]) [startBoard]
  where startBoard = listArray (0,8) $ repeat Nothing
