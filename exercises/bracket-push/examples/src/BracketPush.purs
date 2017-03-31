module BracketPush
  ( isPaired
  ) where

import Prelude
import Data.Array (toUnfoldable)
import Data.List (List(..), filter, (:))
import Data.String (toCharArray)

data Bracket = Round | Square | Curly

derive instance eqBracket :: Eq Bracket

data Token = Open Bracket
           | Close Bracket
           | Other

derive instance eqToken :: Eq Token

token :: Char -> Token
token c
  | c == '(' = Open Round
  | c == '[' = Open Square
  | c == '{' = Open Curly
  | c == ')' = Close Round
  | c == ']' = Close Square
  | c == '}' = Close Curly
token _ = Other

walk :: List Token -> List Token -> Boolean
walk Nil Nil = true
walk xs (y@(Open c):ys) = walk (y:xs) ys
walk (Open x:xs) (Close y:ys)
  | x == y    = walk xs ys
  | otherwise = false
walk _ _ = false

isPaired :: String -> Boolean
isPaired = toCharArray
           >>> toUnfoldable
           >>> map token
           >>> filter ((/=) Other)
           >>> walk Nil
