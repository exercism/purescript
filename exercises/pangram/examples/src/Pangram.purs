module Pangram
  ( isPangram
  ) where

import Prelude
import Data.Set as Set
import Data.String.Common as String
import Data.String.CodeUnits (toCharArray)

isPangram :: String -> Boolean
isPangram str =
  let
    letters =
      charSet $ String.toLower str
  in
    Set.subset alphabet letters


alphabet :: Set.Set Char
alphabet =
  charSet "abcdefghijklmnopqrstuvwxyz"


charSet :: String -> Set.Set Char
charSet =
  toCharArray >>> Set.fromFoldable
