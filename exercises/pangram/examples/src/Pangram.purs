module Pangram
  ( isPangram
  ) where

import Prelude
import Data.Set as Set
import Data.String as String

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
  String.toCharArray >>> Set.fromFoldable
