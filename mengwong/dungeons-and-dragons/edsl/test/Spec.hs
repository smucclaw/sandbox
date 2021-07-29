{-# LANGUAGE PackageImports #-}
import Data.Either (isRight)

import Test.Hspec

import "edsl" Lib
import Petri (start_marking, pn_1)
import Petri hiding (main)
-- http://hspec.github.io/

main :: IO ()
main = hspec $ do

  describe "simple example 1" $ do
    it "empty event stream, marking doesn't change" $ do
      play pn_1 (start_marking pn_1) []
        `shouldBe` Right [start_marking pn_1]

    it "bogus event stream, should get an error" $ do
      play pn_1 (start_marking pn_1) [(TL "Bogus",Nothing)]
        `shouldBe` Left "unable to fire TL \"Bogus\": not enabled! (expecting [TL \"middle\"])"

    it "proper event stream, should produce out-marking" $ do
      play pn_1 (start_marking pn_1) [(TL "middle",Just "middle")]
        `shouldBe` Right [end_marking pn_1]

    it "proper event stream, with Case support" $ do
      play pn_1 (start_marking pn_1) [(TL "Choose Race",Just "Dwarf")]
        `shouldBe` Right [end_marking pn_1]

    it "proper event stream, with Case support (safePost)" $ do
      let sp = asPetri safePost
      play sp (start_marking sp) [ (TL "Safe Contract", Nothing), (Case "Safe Contract" "Equity Financing", Nothing) ]
        `shouldSatisfy` isRight
