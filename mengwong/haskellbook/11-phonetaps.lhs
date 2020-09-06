> import Data.Char (isUpper, toLower)
> import Data.List (elemIndex)
> -- validButtons = "1234567890*#"
> type Digit = Char
> -- Valid presses: 1 and up
> type Presses = Int
>
> data Button = Button Digit [Char]
>
> newtype DaPhone = DaPhone [Button]
>
> phone :: DaPhone
> phone = DaPhone [one, two, three, four, five, six, seven, eight, nine, star, zero, hash]
>   where
>       one = Button '1' "1"
>       two = Button '2' "abc2"
>       three = Button '3' "def3"
>       four = Button '4' "ghi4"
>       five = Button '5' "jkl5"
>       six = Button '6' "mno6"
>       seven = Button '7' "pqrs7"
>       eight = Button '8' "tuv8"
>       nine = Button '9' "wxyz9"
>       star = Button '*' "^"
>       zero = Button '0' "+ 0"
>       hash = Button '#' ".,#"

2. Convert the following conversations into the keypresses re- quired to express them. We’re going to suggest types and functions to fill in order to accomplish the goal, but they’re not obligatory. If you want to do it differently, go right ahead.

> convo :: [String]
> convo =
>   ["Wanna play 20 questions",
>    "Ya",
>    "U 1st haha",
>    "Lol ok. Have u ever tasted alcohol",
>    "Lol ya",
>    "Wow ur cool haha. Ur turn",
>    "Ok. Do u think I am pretty Lol",
>    "Lol ya",
>    "Just making sure rofl ur turn"]
>
> reverseTaps
>   :: DaPhone
>   -> Char
>   -> [(Digit, Presses)]
> reverseTaps (DaPhone buttons) c =
>   if isUpper c
>       then ('*', 1) : taps buttons (toLower c)
>       else taps buttons c
>   where
>       taps bs c = [buttonTaps (button bs c) c]
>       buttonTaps (Button d cs) c = (d, maybe (error "boom") succ $ c `elemIndex` cs)
>       button bs c = head $ dropWhile (not . includes c) $ bs
>       includes c (Button _ cs) = c `elem` cs
>
> cellPhonesDead
>   :: DaPhone
>   -> String
>   -> [(Digit, Presses)]
> cellPhonesDead _ [] = []
> cellPhonesDead p (c:cs) = reverseTaps p c ++ cellPhonesDead p cs
>
> main = do
>    putStrLn $ unlines $ do
>       myline <- convo
>       return $ show (myline, cellPhonesDead phone myline)
