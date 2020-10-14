-- write a program that plays every possible tic-tac-toe game, and then prints the number of valid games

{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}

import Data.List (findIndices)
data Mark = O | X | E -- E == empty box
  deriving (Eq, Show)
type Board = [Mark]

-- adapted from Meng's code

winnerl :: Board -> Bool
winnerl [X, X, X, _, _, _, _, _, _] = True
winnerl [_, _, _, X, X, X, _, _, _] = True
winnerl [_, _, _, _, _, _, X, X, X] = True
winnerl [X, _, _, X, _, _, X, _, _] = True
winnerl [_, X, _, _, X, _, _, X, _] = True
winnerl [_, _, X, _, _, X, _, _, X] = True
winnerl [_, _, X, _, X, _, X, _, _] = True
winnerl [X, _, _, _, X, _, _, _, X] = True
winnerl [O, O, O, _, _, _, _, _, _] = True
winnerl [_, _, _, O, O, O, _, _, _] = True
winnerl [_, _, _, _, _, _, O, O, O] = True
winnerl [O, _, _, O, _, _, O, _, _] = True
winnerl [_, O, _, _, O, _, _, O, _] = True
winnerl [_, _, O, _, _, O, _, _, O] = True
winnerl [_, _, O, _, O, _, O, _, _] = True
winnerl [O, _, _, _, O, _, _, _, O] = True
winnerl _ = False


isGameOver :: Board -> Bool
isGameOver board = winnerl board
-- isGameOver board = isWon O || isWon X || isDrawn
--   where
--     isWon mark = any (isWonLine mark) $ concat [rows, cols, diag1, diag2]
--     isWonLine mark line = all ((==mark).(board !!)) line
--     rows = [[i,i+1,i+2] | i <- [0,3,6]]
--     cols = [[i,i+3,i+6] | i <- [0,1,2]]
--     diag1 = [[0,4,8]]
--     diag2 = [[2,4,6]]
--     isDrawn = not . any (==E) $ board

countValidGames :: [Mark] -> [Board] -> Int
countValidGames turns boards = sum . map (countValidGames_single turns) $ boards

countValidGames_single [] _ = 1
countValidGames_single (_:nextTurns) board = if
  | isGameOver board -> 1
  | otherwise -> countValidGames (nextTurns) . nextBoards nextTurns $ board
  where
    -- nextTurn = switchTurn turn
    -- switchTurn = \case
    --   O -> X
    --   X -> O
    --   E -> E
nextBoards (m:_) board = [update m p board
    | p <- findIndices (==E) board
  ]
update mark position board =
  take position board ++ [mark] ++ drop (position + 1) board

startBoard = replicate 9 E

solution = countValidGames (take 9 $ cycle [O,X]) [startBoard]

main = print solution