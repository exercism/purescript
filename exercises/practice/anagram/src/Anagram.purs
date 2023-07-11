module Anagram
  ( anagramsFor
  ) where

import Effect.Exception.Unsafe (unsafeThrow)

anagramsFor :: String -> Array String -> Array String
anagramsFor word candidates = unsafeThrow "You need to implement this function."
