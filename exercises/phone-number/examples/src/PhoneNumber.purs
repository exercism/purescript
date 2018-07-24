module PhoneNumber
    ( phoneNumber
    )
    where

import Prelude ((==), (<), (>>=), (&&), ($), otherwise)
import Data.Char.Unicode (isDigit)
import Data.Array (filter, head, tail, length, (!!))
import Data.String.CodeUnits (toCharArray, fromCharArray)
import Data.Maybe (Maybe(..), fromMaybe)

clean :: String -> Maybe (Array Char)
clean input = go where
  go
    | len == 10 = Just digits
    | len == 11 && head digits == Just '1' = tail digits
    | otherwise = Nothing
  digits = filter isDigit $ toCharArray input
  len = length digits

check:: Array Char -> Maybe String
check input
  | input !! 0 < Just '2' = Nothing
  | input !! 3 < Just '2' = Nothing
  | otherwise = Just $ fromCharArray input


phoneNumber :: String -> String
phoneNumber input = fromMaybe "None" (clean input >>= check)

