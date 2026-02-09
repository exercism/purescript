module BinarySearch
  ( find
  ) where

import Prelude
import Data.Array (length, (!!))
import Data.Maybe (Maybe(Just, Nothing))

find :: Int -> Array Int -> Maybe Int
find i a = go 0 (length a - 1)
  where go l h | l > h = Nothing
        go l h =
          let m = l + (h - l) / 2
          in case a !! m of
               Nothing -> Nothing
               Just j | j == i    -> Just m
                      | j < i     -> go (m + 1) h
                      | otherwise -> go l (m - 1)

