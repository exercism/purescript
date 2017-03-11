module WordCount
  ( wordCount
  ) where

import Prelude
import Data.Array (foldl)
import Data.Maybe (Maybe(Just), maybe)
import Data.StrMap (StrMap, alter, empty)
import Data.String (Pattern(..), split, toLower, trim)
import Data.String.Regex (replace)
import Data.String.Regex.Flags (global)
import Data.String.Regex.Unsafe (unsafeRegex)

prepare :: String -> Array String
prepare = whitePunc
          >>> remQuot
          >>> aggWhite
          >>> trim
          >>> toLower
          >>> split (Pattern " ")
  where whitePunc = replace (unsafeRegex "[,\n:!&@$%^&.]" global) " "
        remQuot = replace (unsafeRegex "'(\\w+)'" global) "$1"
        aggWhite = replace (unsafeRegex " +" global) " "

freq :: Array String -> StrMap Int
freq = foldl mupd empty
  where mupd acc word = alter cupd word acc
        cupd = maybe 1 ((+) 1) >>> Just

wordCount :: String -> StrMap Int
wordCount = prepare >>> freq
