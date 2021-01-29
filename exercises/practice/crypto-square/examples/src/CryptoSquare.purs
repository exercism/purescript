module CryptoSquare
  ( normalizedPlaintext
  , plaintextSegments
  , encoded
  , ciphertext
  ) where

import Prelude
import Data.Array as A
import Data.Array (filter, fromFoldable, replicate, toUnfoldable, (:))
import Data.Char.Unicode (isAlphaNum)
import Data.Foldable (maximum)
import Data.Int (ceil, toNumber)
import Data.List (transpose)
import Data.Maybe (fromMaybe)
import Data.String (drop, joinWith, length, take)
import Data.String.Common (toLower)
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Math (sqrt)

normalizedPlaintext :: String -> String
normalizedPlaintext
  = toCharArray
    >>> filter isAlphaNum
    >>> fromCharArray
    >>> toLower

plaintextSegments :: String -> Array String
plaintextSegments str = toSquare norm
  where norm = normalizedPlaintext str
        cols = sqrt (length norm # toNumber) # ceil
        toSquare "" = []
        toSquare s  = take cols s : toSquare (drop cols s)

transposeArray :: forall a. Array (Array a) -> Array (Array a)
transposeArray
  = toUnfoldable
    >>> map toUnfoldable
    >>> transpose
    >>> map fromFoldable
    >>> fromFoldable

encoded :: String -> String
encoded = plaintextSegments
          >>> map toCharArray
          >>> transposeArray
          >>> map fromCharArray
          >>> joinWith ""

spaces :: Int -> Array Char
spaces n = replicate n ' '

equalPad :: Array (Array Char) -> Array (Array Char)
equalPad arr = map pad arr
  where width = fromMaybe 0 (maximum $ map A.length arr)
        pad el = el <> spaces (width - A.length el)

ciphertext :: String -> String
ciphertext = plaintextSegments
             >>> map toCharArray
             >>> transposeArray
             >>> equalPad
             >>> map fromCharArray
             >>> joinWith " "

