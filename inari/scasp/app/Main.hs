{-# LANGUAGE GADTs #-}

module Main where

import School
import PGF
import Data.List (groupBy)
-- import System.Environment (getArgs)


printGF gr lang tree = do
    putStrLn $ showExpr [] $ gf tree
    putStrLn $ linearize gr lang $ gf tree

-- showGF = showExpr [] . gf

main :: IO ()
main = do
    sentences <- lines <$> readFile "school-corpus.txt"
    gr <- readPGF "School.pgf"
    let eng = head $ languages gr
        sent = startCat gr
        parses = [fg t | (t:_) <- parse gr eng sent <$> sentences]

    -- print $ map showGF <$> groupFullStop parses

    -- print $ map showGF <$> (groupAndBecause <$> groupFullStop parses)
    mapM_ (printGF gr eng) (transformSimple parses)


transformSimple :: [GS] -> [GS]
transformSimple sentences = mergeB <$> [groupAndBecause ss | ss <- groupFullStop sentences]
  where

    mergeB = mergeBecause . map removeConstructor

    mergeBecause [x1,x2] = GBecauseS x1 x2
    mergeBecause (x:xs) = GBecauseS x (mergeBecause xs)
    mergeBecause xs = error "mergeBecause: too short list"

groupFullStop :: [GS] -> [[GS]]
groupFullStop [] = []
groupFullStop sentences = firstBatch : groupFullStop restOfList
  where
    isFullStop :: GS -> Bool
    isFullStop (GfullStop _) = True
    isFullStop _ = False

    (firstBatch, restOfList) = case break isFullStop sentences of
        (notFullStop, fullStop:rest) -> (notFullStop <> [fullStop], rest)
        (xs, ys) -> (xs, ys) -- TODO ?


groupAndBecause :: [GS] -> [GS]
groupAndBecause sentences = mergeAnd <$> groupBy groupAnd sentences
  where
    mergeAnd :: [GS] -> GS
    mergeAnd [] = error "mergeAnd: empty list"
    mergeAnd [s] = s
    mergeAnd ss = GNoEvidenceThat_ $ GListS $ map removeConstructors ss

    groupAnd :: GS -> GS -> Bool
    groupAnd (Gand _) (Gand _) = True
    groupAnd (GfullStop _) (GfullStop _) = True
    groupAnd (GfullStop _) (Gand _) = True
    groupAnd (Gand _) (GfullStop _) = True
    groupAnd _ _ = False

removeConstructors :: GS -> GS
removeConstructors s = case removeConstructor s of
    GNoEvidenceThat (GEmbedSC np vps) -> GPredVPS np vps
    x -> x

removeConstructor :: GS -> GS
removeConstructor (Gand s) = s
removeConstructor (GfullStop s) = s
removeConstructor (Gcondition s) = s
removeConstructor s = s