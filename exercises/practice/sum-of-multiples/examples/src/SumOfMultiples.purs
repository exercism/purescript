module SumOfMultiples
  ( sumOfMultiples
  ) where

import Prelude
import Data.Array ((..), filter)
import Data.Foldable (any, sum)

sumOfMultiples :: Array Int -> Int -> Int
sumOfMultiples factors limit = sum $ filter (any isMultiple factors) rangeToCheck
  where
    rangeToCheck :: Array Int
    rangeToCheck = 1..(limit - 1)

    isMultiple :: Int -> Int -> Boolean
    isMultiple factor x = x `mod` factor == 0
