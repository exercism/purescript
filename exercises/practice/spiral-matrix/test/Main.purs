module Test.Main where

import Prelude

import Effect (Effect)
import Data.List (List(Nil), fromFoldable)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)
import Spiral (spiral)

main :: Effect Unit
main = runTest suites

suites :: TestSuite
suites =
  suite "Spiral.spiral" do
    test "empty spiral" $
      equal (Nil :: List (List Int)) $ spiral 0

    test "trivial spiral" $
      equal (to2DList [[1]]) $ spiral 1

    test "spiral of side length 2" $
      equal (to2DList [ [1, 2]
                      , [4, 3]
                      ]) $ spiral 2

    test "spiral of side length 3" $
      equal (to2DList [ [1, 2, 3]
                      , [8, 9, 4]
                      , [7, 6, 5]
                      ]) $ spiral 3

    test "spiral of side length 4" $
      equal (to2DList [ [ 1,  2,  3, 4]
                      , [12, 13, 14, 5]
                      , [11, 16, 15, 6]
                      , [10,  9,  8, 7]
                      ]) $ spiral 4

    test "spiral of side length 5" $
      equal (to2DList [ [ 1,  2,  3,  4, 5]
                      , [16, 17, 18, 19, 6]
                      , [15, 24, 25, 20, 7]
                      , [14, 23, 22, 21, 8]
                      , [13, 12, 11, 10, 9]
                      ]) $ spiral 5

to2DList :: forall a. Array (Array a) -> List (List a)
to2DList = fromFoldable <<< map fromFoldable
