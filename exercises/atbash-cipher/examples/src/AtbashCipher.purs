module AtbashCipher
  ( decode
  , encode
  ) where

import Prelude
import Data.Array (drop, filter, take, zip, (:))
import Data.Char.Unicode (isPunctuation, isSpace)
import Data.Map (Map, fromFoldable, lookup)
import Data.Maybe (Maybe)
import Data.String (fromCharArray, joinWith, toCharArray, toLower)
import Data.Traversable (traverse)

plain :: Array Char
plain = toCharArray "abcdefghijklmnopqrstuvwxyz0123456789"

cipher :: Array Char
cipher = toCharArray "zyxwvutsrqponmlkjihgfedcba0123456789"

decMap :: Map Char Char
decMap = fromFoldable (zip cipher plain)

encMap :: Map Char Char
encMap = fromFoldable (zip plain cipher)

decode :: String -> Maybe String
decode s = fromCharArray <$> dec (toCharArray s)
  where dec = filter ((/=) ' ')
              >>> traverse (_ `lookup` decMap)

chunks :: forall a. Int -> Array a -> Array (Array a)
chunks n [] = []
chunks n a = take n a : chunks n (drop n a)

encode :: String -> Maybe String
encode s = group <$> enc (toLower s # toCharArray)
  where enc = filter (not (isPunctuation || isSpace))
              >>> traverse (_ `lookup` encMap)
        group = chunks 5
                >>> map fromCharArray
                >>> joinWith " "
