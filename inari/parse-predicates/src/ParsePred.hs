module ParsePred where

import Data.List.Split
import Data.List.Extra (trim)
import Data.Char (toLower)
import PGF
import Parse


--x = Parse.GAdAP _ _


{- the predicates look like

MateriallyInterferesWithAvailability : ExecutiveAppointment -> LegalPractitioner -> Boolean


-}

data Predicate = Pred {name :: [String] , arity :: Int} deriving (Show,Eq)

parsePred :: String -> Predicate
parsePred str = Pred (normalize nm) ar
    where 
        nm:_ = splitOn ":" str
        ar = length $ filter (=='>') str

normalize :: String -> [String]
normalize = map (trim . map toLower) . split (startsWithOneOf ['A'..'Z'])