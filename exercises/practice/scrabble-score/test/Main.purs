module Test.Main where

import Prelude

import Test.Unit.Assert as Assert
import Effect (Effect)
import ScrabbleScore (scoreWord)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "ScrabbleScore.scoreWord" do
    test "lowercase letter" do
      Assert.equal 1 (scoreWord "a")

    test "uppercase letter" do
      Assert.equal 1 (scoreWord "A")

    test "valuable letter" do
      Assert.equal 4 (scoreWord "f")

    test "short word" do
      Assert.equal 2 (scoreWord "at")

    test "short, valuable word" do
      Assert.equal 12 (scoreWord "zoo")

    test "medium word" do
      Assert.equal 6 (scoreWord "street")

    test "medium, valuable word" do
      Assert.equal 22 (scoreWord "quirky")

    test "long, mixed-case word" do
      Assert.equal 41 (scoreWord "OxyphenButazone")

    test "english-like word" do
      Assert.equal 8 (scoreWord "pinata")

    test "non-english letter is not scored" do
      Assert.equal 7 (scoreWord "piñata")

    test "empty input" do
      Assert.equal 0 (scoreWord "")
