-- This file uses the GADT (General Algebraic Data Type????)
-- The task is to convert 'upon this book" into 'upon this magazine'

module Main where

import PGF (Expr, PGF, linearize, startCat, parseAllLang, readPGF)
import System.Environment (getArgs)
import Question2Answer

-- We are going to use the 'parse' command, which needs the following:
-- `parse :: PGF -> Language -> Type -> String -> [Tree]`

adverbials = ["upon this book", "upon this magazine"]

questions = ["Do you promise to serve ?" , "Do you swear your loyalty ?" , "Do you swear your loyalty to me ?" , "Do you swear your loyalty , to me ?" , "Do you swear your loyalty , to me , upon this book ?" , "Do you swear your loyalty , to me , upon this magazine ?",  "Do you swear your loyalty , to me , upon this book , on oath ?"]

answers =["I promise to serve .",
    "I swear my loyalty .",
    "I hereby swear my loyalty to you .",
    "I hereby swear my loyalty , to you .",
    "I hereby swear my loyalty , to you , upon this book .",
    "I hereby swear my loyalty , to you , upon this magazine ."]

main :: IO ()
main = do
    -- file:_  <- getArgs
    gr      <- readPGF "Question2Answer.pgf" -- generated by gf -make MiniLangEng.gf
    putStrLn "Write your question here, I will transform it into an answer, or an answer to a questio"
    putStrLn "Write quit to exit."
    loop (translate transfer gr)

converter :: GS  -> GS
converter (GmkQuestion x) = (GmkAnswer x)
converter (GmkAnswer x) = (GmkQuestion x)

book2magWrapperS :: GS -> GS
book2magWrapperS (GmkQuestion x) = GmkQuestion (book2magWrapperPred x)
book2magWrapperS (GmkAnswer x) =  GmkAnswer (book2magWrapperPred x)

book2magWrapperPred :: GPredicate -> GPredicate
book2magWrapperPred (GmkPredicate x y) = GmkPredicate (book2magWrapperPred x) (book2mag y)
book2magWrapperPred x = x

book2mag :: GAdverbial -> GAdverbial
book2mag Gbook = Gmagazine
book2mag Gmagazine = Gbook

transfer :: Expr -> Expr
transfer = gf . book2magWrapperS . converter. fg

loop :: (String -> String) -> IO ()
loop trans = do
    s <- getLine
    if s == "quit" then putStrLn "bye" else do
        putStrLn $ trans s
        loop trans

translate :: (Expr -> Expr) -> PGF -> String -> String
translate tr gr s = case parseAllLang gr (startCat gr) s of
    (lg,t:_):_ -> linearize gr lg (tr t)
    _ -> "NO PARSE"