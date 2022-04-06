module AtbashCipher
  ( decode
  , encode
  ) where

import Data.Maybe (Maybe)
import Effect.Exception.Unsafe (unsafeThrow)

decode :: String -> Maybe String
decode = unsafeThrow "You need to implement `decode`."

encode :: String -> Maybe String
encode = unsafeThrow "You need to implement `encode`."
