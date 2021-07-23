
import Test.Hspec
import Petri (start_marking, pn_1)
import Petri hiding (main)
-- http://hspec.github.io/

main :: IO ()
main = hspec $ do

  describe "basic math" $ do

    it "two plus two equals four" $ do
      2 + 2 `shouldBe` 4

    it "three + 3 = six" $ do
      3 + 3 `shouldBe` 6


  describe "simple example 1" $ do
    it "empty event stream, marking doesn't change" $ do
      play pn_1 start_marking []
        `shouldBe` Right start_marking
