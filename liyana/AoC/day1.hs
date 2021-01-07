module Main where


main = do 
    expenses <- readFile "input.txt"
    let entries = read <$> lines expenses
    --print $ head [ x*y | x <- entries, y <- entries, x+y == 2020 ]
    print $ head [ x*y*z | x <- entries, y <- entries, z <- entries, x+y+z == 2020 ]

