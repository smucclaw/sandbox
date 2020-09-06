-- USAGE: % runghc 11-mytaps.hs
module Main where
import Data.Char (toUpper)
import Data.Maybe (fromJust)
import Control.Monad (forM_)

type Digit = Char
type Presses = Int

type DaPhone = [(Char,[Char])]
daPhone :: DaPhone
daPhone = map (\(lhs, rhs) -> (lhs, rhs ++ [lhs]))
          [('1',"")
          ,('2',"abc")
          ,('3',"def")
          ,('4',"ghi")
          ,('5',"jkl")
          ,('6',"mno")
          ,('7',"pqrs")
          ,('8',"tuv")
          ,('9',"wxyz")
          ,('*',"^")
          ,('0',"+ _")
          ,('#',".,")
          ]

convo :: [String]
convo =
   ["Wanna play 20 questions",
    "Ya",
    "U 1st haha",
    "Lol ok. Have u ever tasted alcohol",
    "Lol ya",
    "Wow ur cool haha. Ur turn",
    "Ok. Do u think I am pretty Lol",
    "Lol ya",
    "Just making sure rofl ur turn"]

reverseTaps :: DaPhone -> Char -> [(Digit,Presses)]
reverseTaps dp wantc =
  fromJust $ lookup wantc reversed
  where
    reversed :: [(Char,[(Digit,Presses)])]
    reversed = lowers ++ (uppers <$> lowers)
    lowers = [ (c, [ (n,i) ] )
             | (n,abc) <- dp
             , (c,i) <- zipWith (,) abc [1..]
             ]
    uppers (c,lower) = (toUpper c, reverseTaps dp '^' ++ lower)

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead dp = concatMap $ reverseTaps dp

main = do
  forM_ convo (\myline -> do
                  print myline
                  print $ cellPhonesDead daPhone myline
                  putStrLn ""
              )
  


