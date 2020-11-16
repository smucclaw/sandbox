module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"


myDatabase1 = [(String, Integer)]

myDatabase1 = Data.Map.Map String Integer

myDatabase1 = fromList [("one",1)
                       ,("two",2)]

myDatabase2 = fromList [("three",3)
                       ,("four", 4)]

myDatabase3 = fromList [("five",5)
                       ,("six" ,6)]

myJointDB = foldr1 (<>) [myDatabase1, myDatabase2, myDatabase3]







             

