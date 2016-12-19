module Test.Main where

import Prelude
import Test.Unit.Assert as Assert
import Acronym (abbreviate)
import Control.Monad.Eff (Eff)
import Test.Unit (suite, test)
import Test.Unit.Main (runTest)


main :: Eff _ Unit
main = runTest do
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
