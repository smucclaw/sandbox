{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}

module Main (main) where

import Test.Hspec
import MyLib (parseOPM, Clause(..), Goal(..), Term(..), VariableName(..), var)
import Data.Text (Text)
import Text.RawString.QQ (r)
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "parseOPM" $ do
    it "parses a simple OPM clause with if, with embedded and" $ do
      let input = [r|
      <html><body><div class=WordSection1>
      <p class=OPM-conclusion>the moon is visible if</p>
      <p class=OPM-level1>the time is night and</p>
      <p class=OPM-level1>it is not cloudy</p></div></body></html>
      |]
          expected = Right [
            P "the moon is visible" [] :-
               All [ Leaf (P "the time is night" [])
                   , Leaf (P "it is not cloudy" [])]
            ]
      parseOPM input `shouldBe` expected

    it "parses a simple OPM clause without if, with embedded and" $ do
      let input = [r|
      <html><body><div class=WordSection1>
      <p class=OPM-conclusion>the moon is visible</p>
      <p class=OPM-level1>the time is night and</p>
      <p class=OPM-level1>it is not cloudy</p></div></body></html>
      |]
          expected = Right [
            P "the moon is visible" [] :-
               All [ Leaf (P "the time is night" [])
                   , Leaf (P "it is not cloudy" [])]
            ]
      parseOPM input `shouldBe` expected

    it "parses a simple OPM clause with explicit both and and" $ do
      let input = [r|
      <html><body><div class=WordSection1>
      <p class=OPM-conclusion>the moon is visible if</p>
      <p class=OPM-level1>both</p>
      <p class=OPM-level2>the time is night and</p>
      <p class=OPM-level2>it is not cloudy</p></div></body></html>
      |]
          expected = Right [
            P "the moon is visible" [] :-
               All [ Leaf (P "the time is night" [])
                   , Leaf (P "it is not cloudy" [])]
            ]
      parseOPM input `shouldBe` expected

    it "parses a simple OPM clause with explicit both, without and" $ do
      let input = [r|
      <html><body><div class=WordSection1>
      <p class=OPM-conclusion>the moon is visible if</p>
      <p class=OPM-level1>both</p>
      <p class=OPM-level2>the time is night</p>
      <p class=OPM-level2>it is not cloudy</p></div></body></html>
      |]
          expected = Right [
            P "the moon is visible" [] :-
               All [ Leaf (P "the time is night" [])
                   , Leaf (P "it is not cloudy" [])]
            ]
      parseOPM input `shouldBe` expected

    it "fail to parse a simple OPM clause without both, without and" $ do
      let input = [r|
      <html><body><div class=WordSection1>
      <p class=OPM-conclusion>the moon is visible</p>
      <p class=OPM-level1>the time is night</p>
      <p class=OPM-level1>it is not cloudy</p></div></body></html>
      |]
      parseOPM input `shouldBe` Left "\n* parseLevel 0/1 (3,31): [ERROR] children without any obvious and/or any/all combination.\n[Leaf (P \"the time is night\" []),Leaf (P \"it is not cloudy\" [])]"

    xit "parses nested OPM clauses" $ do
      let input = [r|
      <html><body><div class=WordSection1>
      <p class=OPM-conclusion>isVisible(moon, Time)</p>
      <p class=OPM-level1>isNight(Time)</p>
      <p class=OPM-level1>\\+ isCloudy(Time)</p>
      <p class=OPM-level1>all</p>
      <p class=OPM-level2>isClear(Time)</p>
      <p class=OPM-level2>isDark(Time)</p>
      </div>
      </body>
      </html>
      |]
          expected = Right [P "isVisible" [var "moon", var "Time"] :- All [Leaf (P "isNight" [var "Time"]), Leaf (P "\\+" [var "isCloudy", var "Time"]), All [Leaf (P "isClear" [var "Time"]), Leaf (P "isDark" [var    "Time"])]]]
      parseOPM input `shouldBe` expected

    xit "handles empty input" $ do
      let input = ""
          expected = Left "tagsoup failed to parse tags"
      parseOPM input `shouldBe` expected

    xit "handles input without relevant tags" $ do
      let input = [r|
      <html><body><div class=OtherSection><p class=OPM-conclusion>isVisible(moon, Time)</p></div></body></html>
      |]
          expected = Right []
      parseOPM input `shouldBe` expected


    xit "fails if we skip a level" $ do
      let input = [r|
      <html><body><div class=WordSection1>
      <p class=OPM-conclusion>the moon is visible</p>
      <p class=OPM-level2>the time is night</p>
      <p class=OPM-level2>it is not cloudy</p></div></body></html>
      |]
          expected = Left "skipped level"
      parseOPM input `shouldBe` expected

    xit "flip any" $ do
        let input = [r|
        <html><body><div class=WordSection1>
        <p class=OPM-conclusion>the input screen for business has to be displayed if</p>
        <p class=OPM-level1>for at least one of all instances of the business</p>
        <p class=OPM-level2>the business is currently unknown</p>
        </div></body></html>
        |]
        -- expected = Right [P "" [the input screen for business has to be displayed] :- Leaf (P "anyOf" [Var (VariableName 0 "the business")]), Leaf (P "isCurrentlyUnknown" [ Var (VariableName 0 "the business") ] ) ]
            expected = Right [P "" [Var (VariableName 0 "the input screen for business has to be displayed")] :- Leaf (P "isCurrentlyUnknown" [ Var (VariableName 0 "TheBusiness") ] ) ]
        parseOPM input `shouldBe` expected

    it "same level or" $ do
        let input = [r|
        <html><body><div class=WordSection1>
        <p class=OPM-conclusion>A is true if</p>
            <p class=OPM-level1>B is true</p>
            <p class=OPM-level1>or</p>
            <p class=OPM-level1>all</p>
                <p class=OPM-level2>C is true</p>
                <p class=OPM-level2>and</p>
                <p class=OPM-level2>D is true</p>
        </div></body></html>
        |]
            expected = Right [P "A is true" [] :- Any [Leaf (P "B is true" []),All [Leaf (P "C is true" []),Leaf (P "D is true" [])]]]
        parseOPM input `shouldBe` expected
