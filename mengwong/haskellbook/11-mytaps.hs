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
reverseTaps d'phone wantc =
  fromJust $ lookup wantc reversed
  where
    reversed :: [(Char,[(Digit,Presses)])]
    reversed = lowers ++ (map upper lowers)
    lowers = [ (char, [ (digit, presses) ] )
             | (digit, abc)     <- d'phone
             , (char,  presses) <- zip abc [1..]
             ]
    upper (char,digitPresses) = (toUpper char
                                ,reverseTaps d'phone '^' ++ digitPresses)

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead dp s = concat (map (reverseTaps dp) s)

fingerTaps :: [(Digit,Presses)] -> Presses
fingerTaps = sum . (fmap snd)

answer input = 
  let beepboop = cellPhonesDead daPhone input
  in unlines [ show beepboop 
             , show (fingerTaps beepboop) ++ " presses" ]

main = do
  forM_ convo (\myline -> do
                  putStrLn $ myline
                  putStrLn $ answer myline
              )
  interact (unlines .
            map answer .
            lines)

