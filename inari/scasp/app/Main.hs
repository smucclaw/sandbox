{-# LANGUAGE GADTs, RankNTypes #-}

module Main where

import School
import PGF hiding (Tree)
import Data.List (groupBy)
import Data.Either (rights, lefts)
import Debug.Trace (trace, traceShow)



printGF gr lang tree = do
    putStrLn "\n---------"
    putStrLn $ showExpr [] $ gf tree
    putStrLn "\n"
    putStr $ linearize gr lang $ gf tree
    putStrLn "."

showGF = showExpr [] . gf

main :: IO ()
main = do
    sentences <- lines <$> readFile "school-corpus.txt"
    gr <- readPGF "School.pgf"
    let eng = head $ languages gr
        sent = startCat gr
        parses = [fg t | (t:_) <- parse gr eng sent <$> sentences]
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
    mergeAnd ss = case removeCommonSubject $ map removeConstructors ss of
       [s] -> s
       ss' -> GNoEvidenceThat_ $ GListS ss'

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

flipPolarity :: forall a . Tree a -> Tree a
flipPolarity GPOS = GNEG
flipPolarity GNEG = GPOS
flipPolarity x = composOp flipPolarity x

removeConstructor :: GS -> GS
removeConstructor (Gand s) = s
removeConstructor (GfullStop s) = s
removeConstructor (Gcondition s) = s
removeConstructor s = s

removeCommonSubject :: [GS] -> [GS]
removeCommonSubject sentences@(s:ss) = case (getSubjPred s, getSubjPred <$> ss) of
   (Nothing, _) -> sentences
   (first@(Just (subj, _pred)), _rest) ->
      let ssOrVPSs = breakEqSubjs subj sentences -- must include first one too!
          (preds, unchangedSents) = (rights ssOrVPSs, lefts ssOrVPSs)
      in case preds of
            [] -> trace ("preds=" <> show (map showGF preds)) sentences
            [_] -> trace ("preds=" <> show (map showGF preds)) sentences
            _ -> trace ("preds=" <> show (map showGF preds)) $ GPredVPS subj (aggregatePreds preds) : unchangedSents
  where
    breakEqSubjs :: GNP -> [GS] -> [Either GS GVPS]
    breakEqSubjs _subj [] = []
    breakEqSubjs  subj (x@(GPredVPS subj' pred):xs)
      | subj == subj' = Right pred : breakEqSubjs subj xs
      | otherwise     = Left x : breakEqSubjs subj xs
    breakEqSubjs subj (x:xs) = Left x : breakEqSubjs subj xs


    getSubjPred :: GS -> Maybe (GNP, GVPS)
    getSubjPred (GPredVPS np vps) = Just (np, vps)
    getSubjPred _ = Nothing

aggregatePreds :: [GVPS] -> GVPS
aggregatePreds preds = newVPS
  where
    fallback = GConjVPS Gor_Conj (GListVPS preds)
    (tempPols@((temp,pol):_), vpss) = unzip $ map peelTempPol preds
    nps = aggregateCompNPs vpss
    newVPS = if preserved nps vpss && allEq (temp,pol) tempPols
                then GMkVPS temp pol (GUseComp (GCompNP (GConjNP Gor_Conj (GListNP nps))))
                else fallback

    peelTempPol :: GVPS -> ((GTemp, GPol), GVP)
    peelTempPol (GMkVPS t p vp) = ((t,p), vp)


    preserved :: [a] -> [b] -> Bool
    preserved [] [] = True
    preserved (x:xs) (y:ys) = preserved xs ys
    preserved _ _ = False

aggregateCompNPs :: [GVP] -> [GNP]
aggregateCompNPs [] = []
aggregateCompNPs (GUseComp (GCompNP np):rest) = np:aggregateCompNPs rest
aggregateCompNPs _ = []

allEq _ [] = True
allEq x (x':xs)
  | x == x'   = allEq x xs
  | otherwise = False