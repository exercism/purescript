module LargestSeriesProduct
  ( largestProduct
  ) where

import Prelude

import Data.Array (drop, length, take, (:))
import Data.Foldable (maximum, product)
import Data.Int (fromString)
import Data.Maybe (Maybe(..))
import Data.String (codePointFromChar, singleton)
import Data.String.CodeUnits (toCharArray)
import Data.Traversable (sequence)

spans :: forall a. Int -> Array a -> Array (Array a)
spans n a
  | length a < n = []
  | otherwise    = take n a : spans n (drop 1 a)

toIntArray :: String -> Maybe (Array Int)
toIntArray = toCharArray
             >>> map (codePointFromChar >>> singleton >>> fromString)
             >>> sequence

largestProduct :: String -> Int -> Maybe Int
largestProduct digits span
  | span == 0 = Just 1
  | span < 0  = Nothing
  | otherwise = do
    is <- toIntArray digits
    spans span is
      # map product
      # maximum
