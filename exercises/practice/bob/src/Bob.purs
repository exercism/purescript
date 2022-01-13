module Bob
  ( hey
  ) where

import Effect.Exception.Unsafe (unsafeThrow)

hey :: String -> String
hey = unsafeThrow "You need to implement this function."
