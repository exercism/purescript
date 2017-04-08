module Isogram
  ( isIsogram
  ) where

import Prelude
import Data.Array (filter, foldl)
import Data.Map (alter, empty, values)
import Data.Maybe (Maybe(..))
import Data.String (toCharArray, toLower)
import Data.Traversable (all)

isIsogram :: String -> Boolean
isIsogram = toLower
            >>> toCharArray
            >>> filter letter
            >>> foldl toMap empty
            >>> values
            >>> all (_ <= 1)
  where letter c = 'a' <= c && c <= 'z'
        toMap m c = alter addChar c m
        addChar Nothing  = Just 1
        addChar (Just c) = Just $ c + 1
