module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Test.Unit.Assert as Assert
import Test.Unit (suite, test)
import Test.Unit.Main (runTest)
import Isogram (isIsogram)

main :: Eff _ Unit
main = runTest do
  suite "Isogram.transform" do

    test "empty string" $
      Assert.equal true
                   (isIsogram "")

    test "isogram with only lower case characters" $
      Assert.equal true
                   (isIsogram "isogram")

    test "word with one duplicated character" $
      Assert.equal false
                   (isIsogram "eleven")

    test "longest reported english isogram" $
      Assert.equal true
                   (isIsogram "subdermatoglyphic")

    test "word with duplicated character in mixed case" $
      Assert.equal false
                   (isIsogram "Alphabet")

    test "hypothetical isogrammic word with hyphen" $
      Assert.equal true
                   (isIsogram "thumbscrew-japingly")

    test "isogram with duplicated non letter character" $
      Assert.equal true
                   (isIsogram "Hjelmqvist-Gryb-Zock-Pfund-Wax")

    test "made-up name that is an isogram" $
      Assert.equal true
                   (isIsogram "Emily Jung Schwartzkopf")
