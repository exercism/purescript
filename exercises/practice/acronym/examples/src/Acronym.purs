module Acronym
  ( abbreviate
  ) where

import Prelude

import Data.Char.Unicode as UChar
import Data.Foldable (foldl)
import Data.List (List)
import Data.List as List
import Data.String (codePointFromChar)
import Data.String as String
import Data.String.CodeUnits (toCharArray)

abbreviate :: String -> String
abbreviate =
  initials <<< List.fromFoldable <<< toCharArray

data CharType
  = Upper
  | Lower
  | Space
  | Other


classify :: Char -> CharType
classify '-' = Space
classify ' ' = Space
classify c
  | UChar.isUpper c = Upper
  | UChar.isLower c = Lower
  | otherwise = Other


initials :: List Char -> String
initials =
  let
    next Lower Upper = String.singleton <<< codePointFromChar
    next Space _     = String.toUpper <<< String.singleton <<< codePointFromChar
    next _     _     = const ""

    step { acc, last } c =
      let charClass = classify c
       in { acc: acc <> next last charClass c
          , last: charClass
          }
  in
    _.acc <<< foldl step { acc: "", last: Space }
