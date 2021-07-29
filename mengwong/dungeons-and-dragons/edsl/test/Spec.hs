{-# LANGUAGE PackageImports #-}
import Data.Either (isRight)

import Test.Hspec

import "edsl" Lib
import Petri (start_marking, pn_1)
import Petri hiding (main)
import Data.Map (fromList)
-- http://hspec.github.io/

main :: IO ()
main = hspec $ do

  let ccsimple = asPetri ccSimple

  describe "simple example 1" $ do
    it "empty event stream, marking doesn't change" $ do
      play pn_1 (Right $ start_accumulator pn_1) []
        `shouldBe` (Right $ start_accumulator pn_1)

    it "bogus event stream, should get an error" $ do
      play pn_1 (Right $ start_accumulator pn_1) [(TL "Bogus",Nothing)]
        `shouldBe` Left "unable to fire TL \"Bogus\": not enabled! (expecting [TL \"middle\"])"

    it "proper event stream, should produce out-marking" $ do
      play pn_1 (Right $ start_accumulator pn_1) [(TL "middle",Just "middle")]
        `shouldBe` Right (Acc { mp = end_marking pn_1
                              , st = fromList [("middle",Just "middle")]})

    it "proper event stream, pending Case" $ do
      play ccsimple (Right $ start_accumulator ccsimple) [(TL "Choose Ability Scores",Just "100")]
        `shouldBe` Right (Acc { mp = fromList [(PL "Awaiting Choose Race",1),(PL "Decided Choose Ability Scores",1)]
                              , st = fromList [("Choose Ability Scores",Just "100")]})

    it "proper event stream, chose Dwarf" $ do
      play ccsimple (Right $ start_accumulator ccsimple) [(TL "Choose Ability Scores",Just "100"),(TL "Choose Race", Just "Dwarf")]
        `shouldBe`
        Right (Acc { mp = fromList [(PL "Awaiting Choose Dwarf Sub-Race",1),(PL "Decided Choose Ability Scores",1)]
                   , st = fromList [("Choose Ability Scores",Just "100"),("Choose Race",Just "Dwarf")]})

    it "proper event stream, chose Dwarf sub-race" $ do
      play ccsimple (Right $ start_accumulator ccsimple) [(TL "Choose Ability Scores",Just "100")
                                                         ,(TL "Choose Race", Just "Dwarf")
                                                         ,(TL "Choose Dwarf Sub-Race", Just "Mountain Dwarf")]
        `shouldBe`
        Right (Acc { mp = fromList [(PL "End Character Creation",1)]
                   , st = fromList [("Choose Ability Scores",Just "100")
                                   ,("Choose Dwarf Sub-Race",Just "Mountain Dwarf")
                                   ,("Choose Race",Just "Dwarf")]})

  describe "(safePost)" $ do
    it "with Case support" $ do
      let sp = asPetri safePost
      play sp (Right $ start_accumulator sp) [ (TL "Safe Contract", Just "Equity Financing") ]
        `shouldSatisfy` isRight


