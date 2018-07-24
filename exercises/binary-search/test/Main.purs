module Test.Main where

import Prelude

import Effect (Effect)
import Data.Maybe (Maybe(..))
import Test.Unit.Assert as Assert
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import BinarySearch (find)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "BinarySearch.find" do

    test "finds a value in an array with one element" $
      Assert.equal (Just 0)
                   (find 6 [6])

    test "finds a value in the middle of an array" $
      Assert.equal (Just 3)
                   (find 6 [1,3,4,6,8,9,11])

    test "finds a value at the beginning of an array" $
      Assert.equal (Just 0)
                   (find 1 [1,3,4,6,8,9,11])

    test "finds a value at the end of an array" $
      Assert.equal (Just 6)
                   (find 11 [1,3,4,6,8,9,11])

    test "finds a value in an array of odd length" $
      Assert.equal (Just 9)
                   (find 144 [1,3,5,8,13,21,34,55,89,144,233,377,634])

    test "finds a value in an array of even length" $
      Assert.equal (Just 5)
                   (find 21 [1,3,5,8,13,21,34,55,89,144,233,377])

    test "identifies that a value is not included in the array" $
      Assert.equal Nothing
                   (find 7 [1,3,4,6,8,9,11])

    test "a value smaller than the array's smallest value is not included" $
      Assert.equal Nothing
                   (find 0 [1,3,4,6,8,9,11])

    test "a value larger than the array's largest value is not included" $
      Assert.equal Nothing
                   (find 13 [1,3,4,6,8,9,11])

    test "nothing is included in an empty array" $
      Assert.equal Nothing
                   (find 1 [])
