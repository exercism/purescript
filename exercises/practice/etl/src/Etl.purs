module Etl
  ( transform
  ) where

import Prelude

import Data.Array (foldl, head)
import Data.Map (Map, insert, empty, toUnfoldable)
import Data.Maybe (fromMaybe)
import Data.String (codePointFromChar, singleton, toLower)
import Data.String.CodeUnits (toCharArray)
import Data.Tuple (Tuple(..))

transform :: Map Int (Array Char) -> Map Char Int
transform = toUnfoldable
            >>> expand
            >>> foldl add empty
  where expand xs = do
          Tuple k ys <- xs
          y <- ys
          pure $ Tuple k y
        add m (Tuple k v) = insert (fromMaybe v $ head $ toCharArray $ toLower $ singleton $ codePointFromChar v) k m

