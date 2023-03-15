-- Goal: use Question2AnswerGadt.hs to take a list of questions and output is transformed sentences. The difference between this and thirdPassInt is that this one uses Haskell's GADT format.

module Main where

import Question2AnswerGadt
import PGF
import Question2Answer (GS(GmkQuestion), GAdverbial (GmkAdverbial, Gmagazine))
import GHC.Float (Floating(acos))
import GF (composOp)
import Main (transfer)
import PGF

adverbials = ["upon this book", "upon this magazine"]

questions = ["Do you promise to serve ?" , 
"Do you swear your loyalty ?" , 
"Do you swear your loyalty to me ?" , 
"Do you swear your loyalty , to me ?" , 
"Do you swear your loyalty , to me , upon this book ?" , 
"Do you swear your loyalty , to me , upon this magazine ?",  
"Do you swear your loyalty , to me , upon this book , on oath ?"]

answers =["I promise to serve .",
    "I swear my loyalty .",
    "I hereby swear my loyalty to you .",
    "I hereby swear my loyalty , to you .",
    "I hereby swear my loyalty , to you , upon this book .",
    "I hereby swear my loyalty , to you , upon this magazine ."]

{-
These 3 are defined in NLG.hs to make this exercise more like CCLAW SMU codebase.
Note that NLGEnv -> ... at the beginning is implicit
-}
data NLGEnv = NLGEnv
  { gfGrammar :: PGF
  , gfParse :: String -> [Expr]
  , gfLin :: Expr -> String
  }

getLang :: String -> Language
getLang str = case readLanguage str of
    Nothing -> error $ "language " <> str <> " not found"
    Just l -> l

myNLGEnv :: IO NLGEnv
myNLGEnv = do
  let grammarFile = "question2Answer.pgf"
  gr <- readPGF grammarFile --readPGF is an IO function
  let eng = getLang "question2AnswerEng"
      myParse txt = parse gr eng (startCat gr) txt
      myLin = linearize gr eng
  pure $ NLGEnv gr myParse myLin

{-
Top level of the tree (e.g. mkQuestion and mkAnswer)
The last line, q2aGadt, is needed to pattern match the rest of the Tree:; * -> * patterns. Normally we do q2aGadt x = composOp q2aGadt x
composOp goes deeper down the tree. But since this is top level, and there's no recursive traversing from S -> S, so we don't need to worry about composOp.
-}
q2a2qGadt :: Tree a -> Tree a
q2a2qGadt (GmkQuestion x) = (GmkAnswer x) 
q2a2qGadt (GmkAnswer x) = (GmkQuestion x)
q2a2qGadt Gbook = Gmagazine
q2a2qGadt Gmagazine = Gbook
q2a2qGadt x = composOp q2a2qGadt x

-- transfer function compared to thirdPassInt is a lot easier 
-- because, again, everything is Tree:: * -> *
transfer :: Expr -> Expr
transfer = gf . q2a2qGadt . fg

--Check if question and answer matches
qMatch :: NLGEnv -> String -> String -> Bool
qMatch env question answer = gfLin env transformedQTree == answer
  where
    qTrees = gfParse env question -- remember NLGEnv is implicit in GParse, so we need env
    qTree = case qTrees of -- type Expr
        [] -> error $ "qMatch: Unable to parse" <> question -- type Expr
        x:_ -> x -- type Expr
    transformedQ = transfer qTree -- type Expr


main = do
    env <- myNLGEnv
    print $ zipWith (qaMatch env) questions answers

{-
-- This function below converts book to mag and back. I've commented this out because you can put Gbook and Gmag into q2a2qGadt since they're of the same type Tree:: * -> *
book2mag2bookGadt:: Tree a -> Tree a
book2mag2bookGadt Gbook = Gmagazine
book2mag2bookGadt Gmagazine = Gbook
book2mag2bookGadt x = composOp book2mag2bookGadt x
-}

-- 1) Start from the constructors that you want to make changes
-- f x = composOp f x