module AllYourBase
  ( rebase
  ) where

import Data.Maybe (Maybe)
import Effect.Exception.Unsafe (unsafeThrow)

rebase :: Int -> Int -> Array Int -> Maybe (Array Int)
rebase = unsafeThrow "You need to implement this function."
