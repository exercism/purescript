module Anagram
  ( anagramsFor
  ) where

import Prelude
import Data.Array (filter, sort)
import Data.String.Common (toLower)
import Data.String.CodeUnits (toCharArray)

anagramsFor :: String -> Array String -> Array String
anagramsFor word candidates = filter (isAnagram word) candidates

isAnagram :: String -> String -> Boolean
isAnagram word candidate = lowerWord /= lowerCandidate && sortedWord == sortedCandidate
  where
    lowerWord = toLower word
    lowerCandidate = toLower candidate
    sortedWord = sort $ toCharArray lowerWord
    sortedCandidate = sort $ toCharArray lowerCandidate
