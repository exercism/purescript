module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert

import Anagram (anagramsFor)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "Anagram.anagramsFor" do
    test "No matches" do
      Assert.equal [] $
        anagramsFor "diaper" ["hello", "world", "zombies", "pants"]

    test "Detects two anagrams" do
      Assert.equal ["lemons", "melons"] $
        anagramsFor "solemn" ["lemons", "cherry", "melons"]

    test "Does not detect anagram subsets" do
      Assert.equal [] $
        anagramsFor "good" ["dog", "goody"]

    test "Detects anagram" do
      Assert.equal ["inlets"] $
        anagramsFor "listen" ["enlists", "google", "inlets", "banana"]

    test "Detects three anagrams" do
      Assert.equal ["gallery", "regally", "largely"] $
        anagramsFor "allergy" ["gallery", "ballerina", "regally", "clergy", "largely", "leading"]

    test "Detects multiple anagrams with different case" do
      Assert.equal ["Eons", "ONES"] $
        anagramsFor "nose" ["Eons", "ONES"]

    test "Does not detect non-anagrams with identical checksum" do
      Assert.equal [] $
        anagramsFor "mass" ["last"]

    test "Detects anagrams case-insensitively" do
      Assert.equal ["Carthorse"] $
        anagramsFor "Orchestra" ["cashregister", "Carthorse", "radishes"]

    test "Detects anagrams using case-insensitive subject" do
      Assert.equal ["carthorse"] $
        anagramsFor "Orchestra" ["cashregister", "carthorse", "radishes"]

    test "Detects anagrams using case-insensitive possible matches" do
      Assert.equal ["Carthorse"] $
        anagramsFor "orchestra" ["cashregister", "Carthorse", "radishes"]

    test "Does not detect an anagram if the original word is repeated" do
      Assert.equal [] $
        anagramsFor "go" ["go Go GO"]

    test "Anagrams must use all letters exactly once" do
      Assert.equal [] $
        anagramsFor "tapper" ["patter"]

    test "Words are not anagrams of themselves" do
      Assert.equal [] $
        anagramsFor "BANANA" ["BANANA"]

    test "Words are not anagrams of themselves even if letter case is partially different" do
      Assert.equal [] $
        anagramsFor "BANANA" ["Banana"]

    test "Words are not anagrams of themselves even if letter case is completely different" do
      Assert.equal [] $
        anagramsFor "BANANA" ["banana"]

    test "Words other than themselves can be anagrams" do
      Assert.equal ["Silent"] $
        anagramsFor "LISTEN" ["LISTEN", "Silent"]
