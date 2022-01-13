module Etl
  ( transform
  ) where

import Data.Map (Map)
import Effect.Exception.Unsafe (unsafeThrow)

transform :: Map Int (Array Char) -> Map Char Int
transform = unsafeThrow "You need to implement this function."
