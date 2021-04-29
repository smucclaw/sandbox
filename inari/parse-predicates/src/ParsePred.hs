{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}

module ParsePred where

import Data.Char (toLower, toUpper, isLower)
import Data.List.Extra (trim, sort, transpose, allSame, nub, intercalate)
import Data.List.Split ( split, splitOn, startsWithOneOf )
import Data.Monoid (Any (..))
import PGF hiding (Tree)
import ParseGF
import Text.Printf (printf)
import Paths_parse_predicates ( getDataFileName )

----------------------------------------------------

fromLexicalNode :: Tree a -> Maybe String
fromLexicalNode (LexA str) = Just str
fromLexicalNode (LexA2 str) = Just str
fromLexicalNode (LexAdV str) = Just str
fromLexicalNode (LexAdv str) = Just str
fromLexicalNode (LexCard str) = Just str
fromLexicalNode (LexDet str) = Just str
fromLexicalNode (LexN str) = Just str
fromLexicalNode (LexN2 str) = Just str
fromLexicalNode (LexPN str) = Just str
fromLexicalNode (LexPol str) = Just str
fromLexicalNode (LexPredet str) = Just str
fromLexicalNode (LexPrep str) = Just str
fromLexicalNode (LexPron str) = Just str
fromLexicalNode (LexQuant str) = Just str
fromLexicalNode (LexSubj str) = Just str
fromLexicalNode (LexV str) = Just str
fromLexicalNode (LexV2 str) = Just str
fromLexicalNode (LexV2A str) = Just str
fromLexicalNode (LexV2S str) = Just str
fromLexicalNode (LexV2V str) = Just str
fromLexicalNode (LexV3 str) = Just str
fromLexicalNode (LexVA str) = Just str
fromLexicalNode (LexVS str) = Just str
fromLexicalNode (LexVV str) = Just str
fromLexicalNode (LexN3 str) = Just str
fromLexicalNode (LexText str) = Just str
fromLexicalNode (LexV2Q str) = Just str
fromLexicalNode (GString str) = Just str
fromLexicalNode _ = Nothing

getPGF :: IO PGF
getPGF = do
  pgf <- getDataFileName "ParseGF.pgf"
  readPGF pgf


----------------------------------------------------

data Predicate = Pred {name :: String, trees :: MyParseOutput, arity :: Int}

instance Show Predicate where
  show (Pred nm [] ar) = printf "%s\narity %d, no parses" nm ar
  show (Pred nm ts ar) = printf "%s\narity %d\nparses\n%s" nm ar exprs
    where
      exprs = unlines $ map (showExpr []) ts
      -- exprs = unlines [
      --   unlines [ showExpr [] t
      --           , showBracketedString b]
      --   | (t,b) <- ts
      --   ]

type Question = [String]

step1 :: Predicate -> [Question]
step1 pr | length (trees pr) <= 1 = []
         | otherwise = mkQuestion (extractContentWords pr)

-- $setup
-- >>> gr <- getPGF
-- |
-- >>> mkQuestion $ extractContentWords (parsePred gr "InvolvesSharingFeesWithUnauthorizedPersonsForLegalWorkPerformedByTheLegalPractitioner")
-- [["share_V2"],["share_V2"],["share_V2"],["share_V2"],["sharing_N"],["sharing_N"],["sharing_N"]]

-- >>> askWord $ extractContentWords (parsePred gr "SoleIndependentContractor")
-- "sole_V2 or sole_A or sole_N"

-- 
-- >>> askWord $ checkWord "sOle_V2" (extractContentWords (parsePred gr "SoleIndependentContractor"))
-- "independent_A or independent_N"

-- yes I mean sole_v2
-- >>> filterWord "sole_v2" (mkQuestion $ extractContentWords (parsePred gr "SoleIndependentContractor"))
-- [["independent_A","sole_V2"],["independent_N","sole_V2"]]

-- >>> mkQuestion $ extractContentWords (parsePred gr "SoleIndependentContractor")
-- [["independent_A","sole_V2"],["independent_N","sole_V2"],["independent_A","sole_A"],["independent_N","sole_A"],["independent_A","sole_N"],["independent_N","sole_N"],["independent_N","sole_N"]]

-- >>> extractContentWords (parsePred gr "SoleIndependentContractor")
-- [["sole_V2","independent_A","contractor_N"],["sole_V2","independent_N","contractor_N"],["sole_A","independent_A","contractor_N"],
--  ["sole_A","independent_N","contractor_N"],["sole_N","independent_A","contractor_N"],["sole_N","independent_A","contractor_N"],
--  ["sole_N","independent_N","contractor_N"],["sole_A","independent_N","contractor_N"],["sole_N","independent_N","contractor_N"]]

-- >>> (parsePred gr "SoleIndependentContractor")
-- SoleIndependentContractor
-- arity 0
-- parses
-- FullPred PresIndPl PosPol (ComplVP (ComplSlash (SlashV2a sole_V2) (MassNP (AdjCN (PositA independent_A) (UseN contractor_N)))))
-- FullPred PresIndPl PosPol (ComplVP (ComplSlash (SlashV2a sole_V2) (MassNP (ApposCN (UseN independent_N) (MassNP (UseN contractor_N))))))
-- PredNP PosPol (MassNP (AdjCN (PositA sole_A) (AdjCN (PositA independent_A) (UseN contractor_N))))
-- PredNP PosPol (MassNP (AdjCN (PositA sole_A) (ApposCN (UseN independent_N) (MassNP (UseN contractor_N)))))
-- PredNP PosPol (MassNP (AdjCN (NPAP (MassNP (UseN sole_N)) (PositA independent_A)) (UseN contractor_N)))
-- PredNP PosPol (MassNP (ApposCN (UseN sole_N) (MassNP (AdjCN (PositA independent_A) (UseN contractor_N)))))
-- PredNP PosPol (MassNP (ApposCN (UseN sole_N) (MassNP (ApposCN (UseN independent_N) (MassNP (UseN contractor_N))))))
-- PredNP PosPol (MassNP (ApposCN (AdjCN (PositA sole_A) (UseN independent_N)) (MassNP (UseN contractor_N))))
-- PredNP PosPol (MassNP (ApposCN (ApposCN (UseN sole_N) (MassNP (UseN independent_N))) (MassNP (UseN contractor_N))))

-- (FullPredicate:819 sole independent (N:731 contractor))

-- ask more questions to clarify what things are
groupWord :: Eq a => [[a]] -> [[a]]
groupWord [] = []
groupWord ([]:_) = []
groupWord l = map nub (map head l : groupWord (map tail l))

-- check for most variety of type word, and ask which type
askWord :: [[String]] -> String
askWord = intercalate " or " . snd . maximum . map ((,) =<< length) . groupWord . mkQuestion

-- check if chosen word exists

checkWord :: String -> [[String]] -> [[String]]
checkWord w str
  | doesExist = filterWord w str
  | otherwise = error "that is not a valid choice"
  where
    doesExist = map toLower w `elem` (map . map) toLower (filter (/="or") $ words $ askWord str)

-- only get lists with that chosen word type
filterWord :: String -> [[String]] -> [[String]]
filterWord w (l:ls)
  | null ls = []
  | map toLower w `elem` (map . map) toLower l = l : filterWord w ls
  | otherwise = filterWord w ls


-- take lists and check for most variety of type word, and keep going
keepAsking :: [[String]] -> IO ()
keepAsking str = do
  putStrLn $ askWord str
  chosenWord <- getLine 
  let action | length (checkWord chosenWord str) == 1 = putStrLn $ (concat . concat) str
             | otherwise = keepAsking str
  action

-- TODO: use the information from position and function to ask proper questions:
-- "is sole a verb or a noun"
-- and that makes other options impossible
-- Ask first the most discriminating questions
mkQuestion :: [[String]] -> [Question]
mkQuestion = transpose .
  differingItems

differingItems :: (Ord a) => [[a]] -> [[a]]
differingItems = filter (not . allSame) . transpose . map sort


-- $setup
-- >>> gr <- getPGF

-- >>> extractContentWords (parsePred gr "InvolvesSharingFeesWithUnauthorizedPersonsForLegalWorkPerformedByTheLegalPractitioner")
-- [["involve_V2","perform_V2","DefArt","legal_A","practitioner_N","sharing_N","IndefArt","fee_N","with_Prep","IndefArt","unauthorized_A","person_N","for_Prep","legal_A","work_N"],["involve_V2","perform_V2","DefArt","legal_A","practitioner_N","share_V2","IndefArt","fee_N","with_Prep","IndefArt","unauthorized_A","person_N","for_Prep","legal_A","work_N"],["involve_V2","IndefArt","fee_N","with_Prep","IndefArt","unauthorized_A","person_N","for_Prep","legal_A","work_N","perform_V2","DefArt","legal_A","practitioner_N","sharing_N"],["involve_V2","sharing_N","IndefArt","perform_V2","DefArt","legal_A","practitioner_N","fee_N","with_Prep","IndefArt","unauthorized_A","person_N","for_Prep","legal_A","work_N"],["involve_V2","sharing_N","IndefArt","fee_N","with_Prep","IndefArt","unauthorized_A","perform_V2","DefArt","legal_A","practitioner_N","person_N","for_Prep","legal_A","work_N"],["involve_V2","sharing_N","IndefArt","fee_N","with_Prep","IndefArt","unauthorized_A","person_N","for_Prep","legal_A","perform_V2","DefArt","legal_A","practitioner_N","work_N"],["involve_V2","share_V2","IndefArt","perform_V2","DefArt","legal_A","practitioner_N","fee_N","with_Prep","IndefArt","unauthorized_A","person_N","for_Prep","legal_A","work_N"],["involve_V2","share_V2","IndefArt","fee_N","with_Prep","IndefArt","unauthorized_A","perform_V2","DefArt","legal_A","practitioner_N","person_N","for_Prep","legal_A","work_N"],["involve_V2","share_V2","IndefArt","fee_N","with_Prep","IndefArt","unauthorized_A","person_N","for_Prep","legal_A","perform_V2","DefArt","legal_A","practitioner_N","work_N"]]

extractContentWords :: Predicate -> [[String]]
extractContentWords pr = [onlyLex (fg' tree) | tree <- trees pr]
  where
    fg' :: Expr -> GFullPredicate
    fg' = fg

    onlyLex :: Tree a -> [String]
    onlyLex tree = case fromLexicalNode tree of
      Just s -> [s]
      Nothing -> composOpMonoid onlyLex tree



parsePred :: PGF -> [Char] -> Predicate
parsePred gr str = Pred nm (filterHeuristic ts) ar
  where
    nm : _ = splitOn ":" str
    ar = length $ filter (== '>') str
    ts = parseGF gr nm

type MyParseOutput = [Expr] -- [(Expr, BracketedString)]

parseGF :: PGF -> String -> MyParseOutput
parseGF gr str = go wds
  where
    wds = map (trim . map toLower) $ split (startsWithOneOf (['A' .. 'Z']++['0'..'9']) ) str
    lang = head $ languages gr
    cat = startCat gr
    go :: [String] -> MyParseOutput
    go ws = finalParse
      where
        (output, bstring) = parse_ gr lang cat Nothing (unwords ws)
        finalParse = case output of
          ParseOk ts -> ts -- [(t, bstring) | t <- ts]
          ParseFailed n | all isLower (ws !! (n-1)) ->
            go
              [ capWd
                | (ind, w:ord) <- zip [1..] ws,
                  let capWd
                        | ind == n = toUpper w : ord
                        | otherwise = w:ord
              ]
          ParseFailed 1 -> [gf GNoParse] -- , Leaf [])]
          ParseFailed n -> go (take (n-1) ws) ++ [gf (GParseFailedAfterNTokens (GInt n))] -- , Leaf [])]
          ParseIncomplete -> go (init ws)
          _ -> []

-- if we want [(Expr,BracketedString)]
-- filterHeuristic' :: MyParseOutput -> MyParseOutput
-- filterHeuristic' ps = [(t,b) | (t,b) <- ps, not $ ppBeforeAP t]

filterHeuristic :: [Expr] -> [Expr]
filterHeuristic ts = filter (not . ppBeforeAP) (filter filterGerund ts)
  where
    filterGerund
      | any hasGerund ts &&  -- "practicing as lawyer": progressive, pres. part. or gerund
        any hasProgr ts &&
        not (all hasGerund ts) = not . hasProgr
--      | any hasGerund ts && not (all hasGerund ts) = hasGerund
      | otherwise = const True

-- TODO only remove apposition, keep compound noun


hasGerund :: Expr -> Bool
hasGerund = getAny . hasGerund' . (fg :: Expr -> GFullPredicate)
  where
    hasGerund' :: Tree a -> Any
    hasGerund' (GGerundCN _) = Any True
    hasGerund' x = composOpMonoid hasGerund' x

hasProgr :: Expr -> Bool
hasProgr = getAny . hasProgr' . (fg :: Expr -> GFullPredicate)
  where
    hasProgr' :: Tree a -> Any
    hasProgr' (GProgrVP _) = Any True
    hasProgr' (GUseComp (GCompAP (GPresPartAP _))) = Any True
    hasProgr' x = composOpMonoid hasProgr' x

ppBeforeAP :: Expr -> Bool
ppBeforeAP = getAny . ppBeforeAP' . (fg :: Expr -> GFullPredicate)
  where
    ppBeforeAP' :: Tree a -> Any
    ppBeforeAP' (GAdjCN (GPastPartAP _) (GAdjCN _ _)) = Any True
    ppBeforeAP' (GAdjCN (GPastPartAgentAP _ _) (GAdjCN _ _)) = Any True
    ppBeforeAP' x = composOpMonoid ppBeforeAP' x
