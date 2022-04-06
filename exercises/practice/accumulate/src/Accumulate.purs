module Accumulate
  ( accumulate
  ) where

import Data.List (List)
import Effect.Exception.Unsafe (unsafeThrow)

accumulate :: forall a b. (a -> b) -> List a -> List b
accumulate = unsafeThrow "You need to implement this function."
