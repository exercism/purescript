module RnaTranscription
  ( toRNA
  ) where

import Data.Maybe (Maybe)
import Effect.Exception.Unsafe (unsafeThrow)

toRNA :: String -> Maybe String
toRNA = unsafeThrow "You need to implement this function."
