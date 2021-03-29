module Main where

import SCasp ( parseModel )
import SCaspToGF ( nlg, nlgModels )
import Data.Either (rights)

main :: IO ()
main = do
  let models = rights $ map parseModel tests
  nlgModels models

  putStrLn "\n-------\njust one model completely:"
  nlg (head models)

tests :: [String]
tests= [
  "{ win(A,RPS),  is_game(RPS),  is_participant_in(A,RPS),  is_player(A),  throw(A,rock), is_player(C),  is_participant_in(C,RPS),  throw(C,scissors),  beat(rock,scissors) }",
  "{ win(A,RPS),  is_game(RPS),  is_participant_in(A,RPS),  is_player(A),  throw(A,scissors),  is_player(C),  is_participant_in(C,RPS),  throw(C,paper),  beat(scissors,paper) }",
  "{ win(A,RPS),  is_game(RPS),  is_participant_in(A,RPS),  is_player(A),  throw(A,paper),  is_player(C),  is_participant_in(C,RPS),  throw(C,rock),  beat(paper,rock) }"
  ]


