module Main where

    import PGF
    import System.Environment (getArgs)

    main :: IO ()
    main = do
        file:_ <- getArgs -- standard line, required to read PGF
        gr     <- readPGF file --standard line, required to read PGF
        putStrLn "foo" -- Just to make it compile for now

    
