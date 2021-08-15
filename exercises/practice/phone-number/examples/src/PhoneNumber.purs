module PhoneNumber
    ( phoneNumber
    )
    where

import Data.Array (filter, head, tail, length, (!!))
import Data.CodePoint.Unicode (isDecDigit)
import Data.Maybe (Maybe(..))
import Data.String (codePointFromChar)
import Data.String.CodeUnits (toCharArray, fromCharArray)
import Prelude (otherwise, ($), (&&), (<), (<<<), (==), (>>=))

clean :: String -> Maybe (Array Char)
clean input = go where
  go
    | len == 10 = Just digits
    | len == 11 && head digits == Just '1' = tail digits
    | otherwise = Nothing
  digits = filter (isDecDigit <<< codePointFromChar) $ toCharArray input
  len = length digits

check:: Array Char -> Maybe String
check input
  | input !! 0 < Just '2' = Nothing
  | input !! 3 < Just '2' = Nothing
  | otherwise = Just $ fromCharArray input


phoneNumber :: String -> Maybe String
phoneNumber input = clean input >>= check
