module Test.Main where

import Prelude

import Acronym (abbreviate)
import Effect (Effect)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "Acronym.abbreviate" do
    test "acronyms from title case" $
      Assert.equal
        "PNG" $
        abbreviate "Portable Networks Graphic"

    test "acronyms from lower case" $
      Assert.equal
        "ROR" $
        abbreviate "Ruby on Rails"

    test "acronyms from inconsistent case" $
      Assert.equal
        "HTML" $
        abbreviate "HyperText Markup Language"

    test "punctuation is ignored" $
      Assert.equal
        "FIFO" $
        abbreviate "First in, First out"

    test "acronyms ignoring punctuation and casing" $
      Assert.equal
        "CMOS" $
        abbreviate "Complementary Metal-Oxide semiconductor"
