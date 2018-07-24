module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Bob as Bob

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "Bob.hey" do
    test "stating something" do
      Assert.equal "Whatever." $
        Bob.hey "Tom-ay-totom-aaaah-to."

    test "shouting" do
      Assert.equal "Whoa, chill out!" $
        Bob.hey "WATCH OUT!"

    test "asking a question" do
      Assert.equal "Sure." $
        Bob.hey "Does this cryogenic chamber make me look fat?"

    test "asking a numeric question" do
      Assert.equal "Sure." $
        Bob.hey "You arewhat, like 15?"

    test "talking forcefully" do
      Assert.equal "Whatever." $
        Bob.hey "Let's go make out behind the gym!"

    test "using acronyms in regular speech" do
      Assert.equal "Whatever." $
        Bob.hey "It's OK if you don't want to go to the DMV."

    test "forceful questions" do
      Assert.equal "Whoa, chill out!" $
        Bob.hey "WHAT THE HELL WERE YOU THINKING?"

    test "shouting numbers" do
      Assert.equal "Whoa, chill out!" $
        Bob.hey "12, 3 GO!"

    test "only numbers" do
      Assert.equal "Whatever." $
        Bob.hey "12, 3"

    test "question with only numbers" do
      Assert.equal "Sure." $
        Bob.hey "4?"

    test "shouting with special characters" do
      Assert.equal "Whoa, chill out!" $
        Bob.hey "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"

    test "shouting with no exclamation mark" do
      Assert.equal "Whoa, chill out!" $
        Bob.hey "I HATE YOU"

    test "statement containing a question mark" do
      Assert.equal "Whatever." $
        Bob.hey "Ending with ? means a question."

    test "prattling on" do
      Assert.equal "Sure." $
        Bob.hey "Wait! Hang on. Are you going to be OK?"

    test "silence" do
      Assert.equal "Fine. Be that way!" $
        Bob.hey ""

    test "prolonged silence" do
      Assert.equal "Fine. Be that way!" $
        Bob.hey "       "

    test "alternate silences" do
      Assert.equal "Fine. Be that way!" $
        Bob.hey "\t  \n  \t   "

    test "on multiple line questions" do
      Assert.equal "Whatever." $
        Bob.hey "\nDoes this cryogenic chamber make me look fat?\nno"
