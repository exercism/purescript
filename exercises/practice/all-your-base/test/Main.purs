module Test.Main where

import Prelude

import Effect (Effect)
import Data.Maybe (Maybe(..))
import Test.Unit.Assert as Assert
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import AllYourBase (rebase)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "AllYourBase.rebase" do

    test "single bit one to decimal" $
      Assert.equal (Just [1])
                   (rebase 2 10 [1])

    test "binary to single decimal" $
      Assert.equal (Just [5])
                   (rebase 2 10 [1,0,1])

    test "single decimal to binary" $
      Assert.equal (Just [1,0,1])
                   (rebase 10 2 [5])

    test "binary to multiple decimal" $
      Assert.equal (Just [4,2])
                   (rebase 2 10 [1,0,1,0,1,0])

    test "decimal to binary" $
      Assert.equal (Just [1,0,1,0,1,0])
                   (rebase 10 2 [4,2])

    test "trinary to hexadecimal" $
      Assert.equal (Just [2,10])
                   (rebase 3 16 [1,1,2,0])

    test "hexadecimal to trinary" $
      Assert.equal (Just [1,1,2,0])
                   (rebase 16 3 [2,10])

    test "15-bit integer" $
      Assert.equal (Just [6,10,45])
                   (rebase 97 73 [3,46,60])

    test "empty list" $
      Assert.equal Nothing
                   (rebase 2 10 [])

    test "single zero" $
      Assert.equal Nothing
                   (rebase 10 2 [0])

    test "multiple zeros" $
      Assert.equal Nothing
                   (rebase 10 2 [0,0,0])

    test "leading zeros" $
      Assert.equal Nothing
                   (rebase 7 10 [0,6,0])

    test "negative digit" $
      Assert.equal Nothing
                   (rebase 2 10 [1,-1,1,0,1,0])

    test "invalid positive digit" $
      Assert.equal Nothing
                   (rebase 2 10 [1,2,1,0,1,0])

    test "first base is one" $
      Assert.equal Nothing
                   (rebase 1 10 [])

    test "second base is one" $
      Assert.equal Nothing
                   (rebase 2 1 [1,0,1,0,1,0])

    test "first base is zero" $
      Assert.equal Nothing
                   (rebase 0 10 [])

    test "second base is zero" $
      Assert.equal Nothing
                   (rebase 10 0 [7])

    test "first base is negative" $
      Assert.equal Nothing
                   (rebase (-2) 10 [1])

    test "second base is negative" $
      Assert.equal Nothing
                   (rebase 2 (-7) [1])

    test "both bases are negative" $
      Assert.equal Nothing
                   (rebase (-2) (-7) [1])
