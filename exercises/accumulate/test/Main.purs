module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Test.Unit (suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import Data.List (List, fromFoldable)
import Data.String as String
import Accumulate (accumulate)


main :: Eff _ Unit
main = runTest do
  suite "Accumulate.accumulate" do
    test "empty accumulation" $
      let
        emptyList = (fromFoldable [] :: List Int)
      in
        Assert.equal emptyList $
          accumulate square emptyList

    test "accumulate single square" $
      Assert.equal (fromFoldable [4]) $
        accumulate square (fromFoldable [2])

    test "accumulate squares" $
      Assert.equal (fromFoldable [1, 4, 9]) $
        accumulate square (fromFoldable [1, 2, 3])

    test "accumulate upcases" $
      Assert.equal (fromFoldable ["HELLO", "WORLD"]) $
        accumulate String.toUpper (fromFoldable ["hello", "world"])

    test "accumulate length of strings" $
      Assert.equal (fromFoldable [3, 5, 5, 3, 3]) $
        accumulate String.length (fromFoldable ["the", "quick", "brown", "fox", "etc"])


square :: forall a. (Semiring a) => a -> a
square x = x * x
