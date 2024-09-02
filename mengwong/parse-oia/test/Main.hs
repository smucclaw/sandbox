{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}

module Main (main) where

import Test.Hspec
import MyLib (parseOPM, Clause(..), Goal(..), Term(..), VariableName(..), var)
import Data.Text (Text)
import Text.RawString.QQ (r)

main :: IO ()
main = hspec $ do
  describe "parseOPM" $ do
    xit "parses a simple OPM clause with if, with embedded and" $ do
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

    xit "parses a simple OPM clause without if, with embedded and" $ do
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

    xit "parses a simple OPM clause with explicit both and and" $ do
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

    xit "parses a simple OPM clause with explicit both, without and" $ do
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
          expected = Right [
            P "the moon is visible" [] :-
               All [ Leaf (P "the time is night" [])
                   , Leaf (P "it is not cloudy" [])]
            ]
      parseOPM input `shouldBe` expected

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


    it "fails if we skip a level" $ do
      let input = [r|
      <html><body><div class=WordSection1>
      <p class=OPM-conclusion>the moon is visible</p>
      <p class=OPM-level2>the time is night</p>
      <p class=OPM-level2>it is not cloudy</p></div></body></html>
      |]
          expected = Left "skipped level"
      parseOPM input `shouldBe` expected

