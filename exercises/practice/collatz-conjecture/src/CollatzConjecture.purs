module CollatzConjecture
  ( collatz
  ) where

import Data.Maybe (Maybe)
import Effect.Exception.Unsafe (unsafeThrow)

collatz :: Int -> Maybe Int
collatz = unsafeThrow "You need to implement this function."
