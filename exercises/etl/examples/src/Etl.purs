module Etl
  ( transform
  ) where

import Prelude
import Data.Array (foldl)
import Data.Char (toLower)
import Data.Map (Map, insert, empty, toUnfoldable)
import Data.Tuple (Tuple(..))

transform :: Map Int (Array Char) -> Map Char Int
transform = toUnfoldable
            >>> expand
            >>> foldl add empty
  where expand xs = do
          Tuple k ys <- xs
          y <- ys
          pure $ Tuple k y
        add m (Tuple k v) = insert (toLower v) k m

