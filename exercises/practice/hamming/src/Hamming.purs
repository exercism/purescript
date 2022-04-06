module Hamming
  ( distance
  ) where

import Data.Maybe (Maybe)
import Effect.Exception.Unsafe (unsafeThrow)

distance :: String -> String -> Maybe Int
distance = unsafeThrow "You need to implement this function."
