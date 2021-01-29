module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit.Assert as Assert
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Main (runTest)
import DifferenceOfSquares (differenceOfSquares, squareOfSum, sumOfSquares)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites = do
  suite "Square the sum of the numbers up to the given number" do

    test "square of sum 5" $
      Assert.equal 225 (squareOfSum 5)

    test "square of sum 10" $
      Assert.equal 3025 (squareOfSum 10)

    test "square of sum 100" $
      Assert.equal 25502500 (squareOfSum 100)

  suite "Sum the squares of the numbers up to the given number" do

    test "sum of squares 5" $
      Assert.equal 55 (sumOfSquares 5)

    test "sum of squares 10" $
      Assert.equal 385 (sumOfSquares 10)

    test "sum of squares 100" $
      Assert.equal 338350 (sumOfSquares 100)

  suite "Subtract sum of squares from square of sums" do

    test "difference of squares 0" $
      Assert.equal 0 (differenceOfSquares 0)

    test "difference of squares 5" $
      Assert.equal 170 (differenceOfSquares 5)

    test "difference of squares 10" $
      Assert.equal 2640 (differenceOfSquares 10)

    test "difference of squares 100" $
      Assert.equal 25164150 (differenceOfSquares 100)
