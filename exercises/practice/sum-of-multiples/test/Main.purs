module Test.Main where

import Prelude

import Effect (Effect)
import SumOfMultiples (sumOfMultiples)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "SumOfMultiples.sumOfMultiples" do
    test "multiples of 3 or 5 up to 1" do
      Assert.equal 0 (sumOfMultiples [3, 5] 1)

    test "multiples of 3 or 5 up to 4" do
      Assert.equal 3 (sumOfMultiples [3, 5] 4)

    test "multiples of 3 up to 7" do
      Assert.equal 9 (sumOfMultiples [3] 7)

    test "multiples of 3 or 5 up to 10" do
      Assert.equal 23 (sumOfMultiples [3, 5] 10)

    test "multiples of 3 or 5 up to 100" do
      Assert.equal 2318 (sumOfMultiples [3, 5] 100)

    test "multiples of 3 or 5 up to 1000" do
      Assert.equal 233168 (sumOfMultiples [3, 5] 1000)

    test "multiples of 7, 13 or 17 up to 20" do
      Assert.equal 51 (sumOfMultiples [7, 13, 17] 20)

    test "multiples of 4 or 6 up to 15" do
      Assert.equal 30 (sumOfMultiples [4, 6] 15)

    test "multiples of 5, 6 or 8 up to 150" do
      Assert.equal 4419 (sumOfMultiples [5, 6, 8] 150)

    test "multiples of 5 or 25 up to 51" do
      Assert.equal 275 (sumOfMultiples [5, 25] 51)

    test "multiples of 43 or 47 up to 10000" do
      Assert.equal 2203160 (sumOfMultiples [43, 47] 10000)

    test "multiples of 1 up to 100" do
      Assert.equal 4950 (sumOfMultiples [1] 100)

    test "multiples of an empty list up to 10000" do
      Assert.equal 0 (sumOfMultiples [] 10000)
