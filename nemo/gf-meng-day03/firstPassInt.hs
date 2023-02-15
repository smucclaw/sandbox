module Main where

    import PGF
    import System.Environment

-- We are going to use the 'parse' command, which needs the following:
-- `parse :: PGF -> Language -> Type -> String -> [Tree]`

    questions = ["Do you promise to serve ?" , "Do you swear your loyalty ?" , "Do you swear your loyalty to me ?" , "Do you swear your loyalty , to me ?" , "Do you swear your loyalty , to me , upon this book ?" , "Do you swear your loyalty , to me , upon this book , on oath ?"]

    answers =["I promise to serve .",
        "I swear my loyalty .",
        "I hereby swear my loyalty to you .",
        "I hereby swear my loyalty , to you .",
        "I hereby swear my loyalty , to you , upon this book ."]
    
    main :: IO ()
    main = do
        file:_      <- getArgs
        gr          <- readPGF file -- 'PGF'
        let
            eng           = head $ languages gr -- 'Language'
            cat           = startCat gr -- 'Type'
            -- loyalString   = "Do you swear your loyalty , to me , upon this book ?" -- "Str"
            questions_parsed      = map (parse gr eng cat) questions

        -- loop (question)
        mapM_ (putStrLn . createOuput gr eng) questions_parsed

    -- loop :: ([Tree]) -> IO ()
    -- loop trans = do
    --     s <- getLine
    --     if s == "quit" then putStrLn "bye" else do
    --         putStrLn $ s
    --         loop trans


    -- NOTE: This is what creatOutput was previously, which was unHaskell like because it outputs to an IO () action.
    -- printOutput :: PGF -> Language -> [Tree] -> IO ()
    -- printOutput gr eng trees = case trees of 
    --     []  -> putStrLn "Unrecognised" 
    --     tree:_ -> do
    --         let                 
    --             Just (f, args) = unApp tree
    --             answer = mkApp (mkCId "mkAnswer") args
    --         mapM_ putStrLn $ linearize gr eng <$> [tree, answer]

    createOuput :: PGF -> Language -> [Tree] -> String
    createOuput _gr _eng []  = "Unrecognised" 
    createOuput gr eng (tree:_) = unlines $ linearize gr eng <$> [tree, answer]
        where                 
            Just (f, args) = unApp tree
            answer = mkApp (mkCId "mkAnswer") args
