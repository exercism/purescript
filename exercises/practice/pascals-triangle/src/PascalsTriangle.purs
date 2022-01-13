module PascalsTriangle (rows) where

import Data.Maybe (Maybe)
import Effect.Exception.Unsafe (unsafeThrow)

rows :: Maybe Int -> Maybe (Array (Array Int))
rows = unsafeThrow "You need to implement this function."
