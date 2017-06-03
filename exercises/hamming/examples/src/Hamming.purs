module Hamming
  ( distance
  ) where

import Prelude
import Data.Maybe (Maybe(Just, Nothing))
import Data.Tuple (Tuple(..))
import Data.String (uncons)

distance :: String -> String -> Maybe Int
distance dna1 dna2 = case Tuple (uncons dna1) (uncons dna2) of
  Tuple (Just {head: h1, tail: t1}) (Just {head: h2, tail: t2}) -> (if h1 /= h2 then ((+) 1) else id) <$> distance t1 t2
  Tuple Nothing Nothing -> Just 0
  Tuple _ _ -> Nothing