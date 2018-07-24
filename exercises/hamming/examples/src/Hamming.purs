module Hamming
  ( distance
  ) where

import Prelude
import Data.Maybe (Maybe(Just, Nothing))
import Data.String (uncons)

distance :: String -> String -> Maybe Int
distance dna1 dna2 =
  case uncons dna1, uncons dna2 of
    Just {head: h1, tail: t1}, Just {head: h2, tail: t2} ->
      (if h1 /= h2 then ((+) 1) else identity) <$> distance t1 t2
    Nothing, Nothing ->
      Just 0
    _, _ ->
      Nothing
