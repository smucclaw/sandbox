{-# LANGUAGE GADTs #-}

module ParsePred where

import Data.Char (toLower, toUpper, isLower)
import Data.List.Extra (trim)
import Data.List.Split
import Data.Monoid (Any (..))
import GF
import PGF hiding (Tree)
import Parse
import System.Environment (withArgs)
import Text.Printf (printf)

--x = Parse.GAdAP _ _

{- the predicates look like

MateriallyInterferesWithAvailability : ExecutiveAppointment -> LegalPractitioner -> Boolean


-}

data Predicate = Pred {name :: String, trees :: [PGF.Expr], arity :: Int} deriving (Eq)

instance Show Predicate where
  show (Pred nm [] ar) = printf "%s\narity %d, no parses" nm ar
  show (Pred nm ts ar) = printf "%s\narity %d\nparses\n%s" nm ar exprs
    where
      exprs = unlines $ map (showExpr []) ts

--exprs = unlines $ map show $ toTrie $ map toATree ts

parsePred :: PGF -> String -> Predicate
parsePred gr str = Pred nm ts ar
  where
    nm : _ = splitOn ":" str
    ar = length $ filter (== '>') str
    ts = filterHeuristic $ parseGF gr nm

parseGF :: PGF -> String -> [Expr]
parseGF gr str = go wds
  where
    wds = map (trim . map toLower) $ split (startsWithOneOf (['A' .. 'Z']++['0'..'9']) ) str
    -- TODO: try to capitalise words if getting parse errors
    lang = head $ languages gr
    cat = startCat gr
    go ws = finalParse
      where
        (output, _) = parse_ gr lang cat Nothing (unwords ws)
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
          _ -> []

filterHeuristic :: [Expr] -> [Expr]
filterHeuristic ts = filter filterGerund ts
  where
    filterGerund
      | any hasGerund ts && not (all hasGerund ts) = hasGerund
      | otherwise = const True

hasGerund :: Expr -> Bool
hasGerund = getAny . hasGerund' . (fg :: Expr -> GFullPredicate)

hasGerund' :: Tree a -> Any
hasGerund' (GGerundCN _) = Any True
hasGerund' x = composOpMonoid hasGerund' x

--------------------------
-- GF stuff

grName :: String
grName = "Parse"

mkAbsName, mkCncName, mkPGFName :: String -> String
mkAbsName = printf "grammars/%s.gf"
mkCncName = printf "grammars/%sEng.gf"
mkPGFName = printf "/tmp/%s.pgf"

createPGF :: IO PGF.PGF
createPGF = do
  withArgs
    [ "-make",
      "--output-dir=/tmp",
      "--gfo-dir=/tmp",
      "-v=0",
      mkCncName grName
    ]
    GF.main
  PGF.readPGF $ mkPGFName grName
