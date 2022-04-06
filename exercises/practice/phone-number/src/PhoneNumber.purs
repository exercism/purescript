module PhoneNumber
  ( phoneNumber
  ) where

import Data.Maybe (Maybe)
import Effect.Exception.Unsafe (unsafeThrow)

phoneNumber :: String -> Maybe String
phoneNumber = unsafeThrow "You need to implement this function."
