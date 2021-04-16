module Main where

import ParsePred

main :: IO ()
main = do
    print $ parsePred "MateriallyInterferesWithAvailability : ExecutiveAppointment -> LegalPractitioner -> Boolean"