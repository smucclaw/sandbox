-- write a program that plays every possible tic-tac-toe game, and then prints the number of valid games

{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}

import Data.List (findIndices)
data Mark = O | X | E -- E == empty box
  deriving (Eq, Show)
type Board = [Mark]

isGameOver :: Board -> Bool
isGameOver board = isWon O || isWon X || isDrawn
  where
    isWon mark = any (isWonLine mark) $ concat [rows, cols, diag1, diag2]
    isWonLine mark line = all ((==mark).(board !!)) line
    rows = [[i,i+1,i+2] | i <- [0,3,6]]
    cols = [[i,i+3,i+6] | i <- [0,1,2]]
    diag1 = [[0,4,8]]
    diag2 = [[2,4,6]]
    isDrawn = not . any (==E) $ board

countValidGames :: Mark -> [Board] -> Int
countValidGames turn boards = sum . map (countValidGames_single turn) $ boards
countValidGames_single turn board = if
  | isGameOver board -> 1
  | otherwise -> countValidGames (nextTurn) . nextBoards nextTurn $ board
  where
    nextTurn = switchTurn turn
    switchTurn = \case
      O -> X
      X -> O
      E -> E
nextBoards m board = [update m p board
    | p <- findIndices (==E) board
  ]
update mark position board =
  take position board ++ [mark] ++ drop (position + 1) board

startBoard = replicate 9 E

solution = countValidGames O [startBoard]