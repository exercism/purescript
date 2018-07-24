module Test.Main where

import Prelude

import Effect (Effect)
import Data.Maybe (Maybe(..))
import Test.Unit.Assert as Assert
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import LargestSeriesProduct (largestProduct)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "LargestSeriesProduct.largestProduct" do

    test "finds the largest product if span equals length" $
      Assert.equal (Just 18)
                   (largestProduct "29" 2)

    test "can find the largest product of 2 with numbers in order" $
      Assert.equal (Just 72)
                   (largestProduct "0123456789" 2)

    test "can find the largest product of 2" $
      Assert.equal (Just 48)
                   (largestProduct "576802143" 2)

    test "can find the largest product of 3 with numbers in order" $
      Assert.equal (Just 504)
                   (largestProduct "0123456789" 3)

    test "can find the largest product of 3" $
      Assert.equal (Just 270)
                   (largestProduct "1027839564" 3)

    test "can find the largest product of 5 with numbers in order" $
      Assert.equal (Just 15120)
                   (largestProduct "0123456789" 5)

    test "can get the largest product of a big number" $
      Assert.equal (Just 23520)
                   (largestProduct "73167176531330624919225119674426574742355349194934" 6)

    test "reports zero if the only digits are zero" $
      Assert.equal (Just 0)
                   (largestProduct "0000" 2)

    test "reports zero if all spans include zero" $
      Assert.equal (Just 0)
                   (largestProduct "99099" 3)

    test "rejects span longer than string length" $
      Assert.equal Nothing
                   (largestProduct "123" 4)

    test "reports 1 for empty string and empty product (0 span)" $
      Assert.equal (Just 1)
                   (largestProduct "" 0)

    test "reports 1 for nonempty string and empty product (0 span)" $
      Assert.equal (Just 1)
                   (largestProduct "123" 0)

    test "rejects empty string and nonzero span" $
      Assert.equal Nothing
                   (largestProduct "" 1)

    test "rejects invalid character in digits" $
      Assert.equal Nothing
                   (largestProduct "1234a5" 2)

    test "rejects negative span" $
      Assert.equal Nothing
                   (largestProduct "12345" (-1))
