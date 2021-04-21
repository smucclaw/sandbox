{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}

module ParsePred where

import Data.Char (toLower, toUpper, isLower)
import Data.List.Extra (trim, sort, transpose, allSame)
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

data Predicate = Pred {name :: String, parsetrees :: [BracketedString], trees :: [PGF.Expr], arity :: Int}

instance Show Predicate where
  show (Pred nm _ [] ar) = printf "%s\narity %d, no parses" nm ar
  show (Pred nm pts ts ar) = printf "%s\narity %d\nparses\n%s\n%s" nm ar exprs (unwords $ map showBracketedString pts)
    where
      exprs = unlines $ map (showExpr []) ts

type Question = [String]

step1 :: Predicate -> [Question]
step1 pr | length (trees pr) <= 1 = []
         | otherwise = mkQuestion (extractContentWords pr)

-- $setup
-- >>> gr <- getPGF

-- |
-- >>> mkQuestion $ extractContentWords (parsePred gr "InvolvesSharingFeesWithUnauthorizedPersonsForLegalWorkPerformedByTheLegalPractitioner")
-- [["sharing_N","share_V2","sharing_N","sharing_N","sharing_N","sharing_N","share_V2","share_V2","share_V2"]]
-- >>> mkQuestion $ extractContentWords (parsePred gr "SoleIndependent")
-- [["independent_N","independent_A","independent_N","independent_N"],["sole_V2","sole_N","sole_A","sole_N"]]
-- >>> (parsePred gr "SoleIndependent")
-- SoleIndependent
-- arity 0
-- parses
-- FullPred PresIndPl PosPol (ComplVP (ComplSlash (SlashV2a sole_V2) (MassNP (UseN independent_N))))
-- PredAP PosPol (NPAP (MassNP (UseN sole_N)) (PositA independent_A))
-- PredNP PosPol (MassNP (AdjCN (PositA sole_A) (UseN independent_N)))
-- PredNP PosPol (MassNP (ApposCN (UseN sole_N) (MassNP (UseN independent_N))))

-- (FullPredicate:623 sole independent)

-- TODO: use the information from position and function to ask proper questions:
-- "is sole a verb or a noun"
-- and that makes other options impossible
-- Ask first the most discriminating questions
mkQuestion :: [[String]] -> [Question]
mkQuestion = differingItems

differingItems :: (Ord a) => [[a]] -> [[a]]
differingItems = filter (not . allSame) . transpose . map sort


-- $setup
-- >>> gr <- getPGF

-- | Gives a list of content words for each possible parse
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
parsePred gr str = Pred nm pts (filterHeuristic ts) ar
  where
    nm : _ = splitOn ":" str
    ar = length $ filter (== '>') str
    (ts, pts) = parseGF gr nm

parseGF :: PGF -> String -> ([Expr], [BracketedString])
parseGF gr str = (go wds, [parsetree])
  where
    wds = map (trim . map toLower) $ split (startsWithOneOf (['A' .. 'Z']++['0'..'9']) ) str
    lang = head $ languages gr
    cat = startCat gr
    (_, parsetree) = parse_  gr lang cat Nothing (unwords wds)
    go :: [String] -> [Expr]
    go ws = finalParse
      where
        (output, parsetree) = parse_ gr lang cat Nothing (unwords ws)
        finalParse = case output of
          ParseOk ts -> ts
          ParseFailed n | all isLower (ws !! (n-1)) ->
            go
              [ capWd
                | (ind, w:ord) <- zip [1..] ws,
                  let capWd
                        | ind == n = toUpper w : ord
                        | otherwise = w:ord
              ]
          -- TODO: find out where infinite loop happens
          -- ParseFailed 1 -> [gf GNoParse]
          -- ParseFailed n -> go (take (n-1) ws) ++ [gf (GParseFailedAfterNTokens (GInt n))]
          -- ParseIncomplete -> go (init ws)
          _ -> []

filterHeuristic :: [Expr] -> [Expr]
filterHeuristic ts = filter (not . ppBeforeAP) ts -- (filter filterGerund ts)
  where
    filterGerund
      | any hasGerund ts && not (all hasGerund ts) = hasGerund
      | otherwise = const True

-- TODO only remove apposition, keep compound noun
hasGerund :: Expr -> Bool
hasGerund = getAny . hasGerund' . (fg :: Expr -> GFullPredicate)
  where
    hasGerund' :: Tree a -> Any
    hasGerund' (GGerundCN _) = Any True
    hasGerund' x = composOpMonoid hasGerund' x


ppBeforeAP :: Expr -> Bool
ppBeforeAP = getAny . ppBeforeAP' . (fg :: Expr -> GFullPredicate)
  where
    ppBeforeAP' :: Tree a -> Any
    ppBeforeAP' (GAdjCN (GPastPartAP _) (GAdjCN _ _)) = Any True
    ppBeforeAP' (GAdjCN (GPastPartAgentAP _ _) (GAdjCN _ _)) = Any True
    ppBeforeAP' x = composOpMonoid ppBeforeAP' x


