module Knapsack
  (maximumValue
  , Item
  ) where

import Prelude
import Data.Array as Array
import Data.Array(replicate)
import Data.Maybe (Maybe(..))
import Effect.Exception.Unsafe (unsafeThrow)

type Item = 
  { value  :: Int
  , weight :: Int
  }

orThrow :: Maybe Int -> Int
orThrow v = case v of
              Nothing -> unsafeThrow "no value"
              (Just v) -> v

findMaxValue :: Item -> Int -> Array Int -> Int
findMaxValue { value: v, weight: w} cap prevRow 
  | w > cap = orThrow $ Array.index prevRow cap
  | otherwise = let
                  valueWithout = orThrow $ Array.index prevRow cap
                  valueWith = v + (orThrow $ Array.index prevRow (cap - w))
                in
                  if valueWith > valueWithout then
                      valueWith
                  else
                      valueWithout

findMaxValues :: Array Item -> Int -> Array Int -> Int
findMaxValues items index prevRow
  | (Array.length items) <= index = orThrow $ Array.last prevRow
  | otherwise = let
                  item = case Array.index items index of
                            Nothing -> unsafeThrow "no item"
                            (Just i) -> i
                in
                  let 
                    nextRow = Array.mapWithIndex (\i _v -> findMaxValue item i prevRow) prevRow
                  in
                    findMaxValues items (index + 1) nextRow

maximumValue :: Array Item -> Int -> Int
maximumValue [] _capacity = 0
maximumValue items capacity = 
  let
    initial = replicate (capacity + 1) 0
  in
    findMaxValues items 0 initial
