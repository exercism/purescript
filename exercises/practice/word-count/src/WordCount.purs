module WordCount
  ( wordCount
  ) where

import Data.Map (Map)
import Effect.Exception.Unsafe (unsafeThrow)

wordCount :: String -> Map String Int
wordCount = unsafeThrow "You need to implement this function."
