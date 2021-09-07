module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Pangram (isPangram)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "Pangram.isPangram" do
    test "empty sentence" do
      Assert.equal false $
        isPangram ""

    test "perfect lower case" do
      Assert.equal true $
        isPangram "abcdefghijklmnopqrstuvwxyz"

    test "only lower case" do
      Assert.equal true $
        isPangram "the quick brown fox jumps over the lazy dog"

    test "missing the letter 'x'" do
      Assert.equal false $
        isPangram "a quick movement of the enemy will jeopardize five gunboats"

    test "missing the letter 'h'" do
      Assert.equal false $
        isPangram "five boxing wizards jump quickly at it"

    test "with underscores" do
      Assert.equal true $
        isPangram "the_quick_brown_fox_jumps_over_the_lazy_dog"

    test "with numbers" do
      Assert.equal true $
        isPangram "the 1 quick brown fox jumps over the 2 lazy dogs"

    test "missing letters replaced by numbers" do
      Assert.equal false $
        isPangram "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"

    test "mixed case and punctuation" do
      Assert.equal true $
        isPangram "\"Five quacking Zephyrs jolt my wax bed.\""

    test "case insensitive" do
      Assert.equal false $
        isPangram "the quick brown fox jumps over with lazy FX"

