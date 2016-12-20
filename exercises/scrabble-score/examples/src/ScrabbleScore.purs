module ScrabbleScore
  ( scoreWord
  ) where

import Prelude
import Data.Char (toLower)
import Data.String (toCharArray)
import Data.Foldable (foldl)


scoreWord :: String -> Int
scoreWord =
  let
    addLetterScore acc =
      add acc <<< scoreChar <<< toLower
  in
    foldl addLetterScore 0 <<< toCharArray


scoreChar :: Char -> Int
scoreChar 'a' = 1
scoreChar 'e' = 1
scoreChar 'i' = 1
scoreChar 'o' = 1
scoreChar 'u' = 1
scoreChar 'l' = 1
scoreChar 'n' = 1
scoreChar 'r' = 1
scoreChar 's' = 1
scoreChar 't' = 1
scoreChar 'd' = 2
scoreChar 'g' = 2
scoreChar 'b' = 3
scoreChar 'c' = 3
scoreChar 'm' = 3
scoreChar 'p' = 3
scoreChar 'f' = 4
scoreChar 'h' = 4
scoreChar 'v' = 4
scoreChar 'w' = 4
scoreChar 'y' = 4
scoreChar 'k' = 5
scoreChar 'j' = 8
scoreChar 'x' = 8
scoreChar 'q' = 10
scoreChar 'z' = 10
scoreChar _ = 0
