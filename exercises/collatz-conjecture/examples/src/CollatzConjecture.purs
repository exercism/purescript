module CollatzConjecture
  ( collatz
  ) where

import Prelude
import Data.Int (even)
import Data.Maybe (Maybe(..))

collatzHelper :: Int -> Int -> Int
collatzHelper acc x | x == 1    = acc
                    | even x    = collatzHelper (acc + 1) (x / 2)
                    | otherwise = collatzHelper (acc + 1) (x * 3 + 1)

collatz :: Int -> Maybe Int
collatz x = if x <= 0 then Nothing else Just $ collatzHelper 0 x
