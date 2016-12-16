module Acronym
  ( abbreviate
  ) where

import Prelude
import Data.Foldable (foldl)
import Data.String as String
import Data.Char as Char
import Data.List as List
import Data.List (List)
import Data.Char.Unicode as UChar

abbreviate :: String -> String
abbreviate =
  initials <<< List.fromFoldable <<< String.toCharArray

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
    next Lower Upper c = String.singleton c
    next Space _ c     = String.singleton (Char.toUpper c)
    next _ _ _ = ""

    step { acc, last } c =
      let charClass = classify c
       in { acc: acc <> next last charClass c
          , last: charClass
          }
  in
    _.acc <<< foldl step { acc: "", last: Space }
