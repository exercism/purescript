module Knapsack
  (maximumValue
  , Item
  ) where

import Prelude
import Effect.Exception.Unsafe (unsafeThrow)

type Item = 
  { value  :: Int
  , weight :: Int
  }

maximumValue :: Array Item -> Int -> Int
maximumValue _items _capacity = unsafeThrow "You need to implement this function."
