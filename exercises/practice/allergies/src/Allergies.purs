module Allergies
  ( allergicTo
  , list
  ) where

import Effect.Exception.Unsafe (unsafeThrow)

allergicTo :: Int -> String -> Boolean
allergicTo = unsafeThrow "You need to implement this function."

list :: Int -> Array String
list = unsafeThrow "You need to implement this function."
