module DifferenceOfSquares
  ( differenceOfSquares
  , squareOfSum
  , sumOfSquares
  ) where

import Prelude
import Data.Array (range)
import Data.Foldable (sum)
import Data.Int (pow)

squareOfSum :: Int -> Int
squareOfSum n = sum (range 1 n) `pow` 2

sumOfSquares :: Int -> Int
sumOfSquares n = map (_ `pow` 2) (range 1 n) # sum

differenceOfSquares :: Int -> Int
differenceOfSquares n = squareOfSum n - sumOfSquares n
