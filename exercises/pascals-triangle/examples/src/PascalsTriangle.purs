module PascalsTriangle
  (rows
  ) where

import Prelude
import Data.Array (drop, zip, (:))
import Data.Maybe (Maybe(..))
import Data.Tuple (uncurry)

type Row = Array Int
type Mat = Array (Array Int)

rows' :: Row -> Int -> Mat
rows' row 1 = [row]
rows' row n = row : rows' next (n - 1)
  where next = pairSum $ [0] <> row <> [0]
        pairSum r = map (uncurry (+)) (zip r (drop 1 r))

rows :: Maybe Int -> Maybe Mat
rows Nothing = Nothing
rows (Just n)
  | n < 0     = Nothing
  | n == 0    = Just []
  | otherwise = Just $ rows' [1] n
