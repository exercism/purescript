module BinarySearch
  ( find
  ) where

import Prelude
import Data.Maybe (Maybe)
import Effect.Exception.Unsafe (unsafeThrow)

find :: forall a. Ord a => a -> Array a -> Maybe Int
find = unsafeThrow "You need to implement this function."
