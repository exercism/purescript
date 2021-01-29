module Raindrops
  ( raindrops
  ) where

import Prelude

raindrops :: Int -> String
raindrops n =
  let
    fn = toNoise n
    noises =
      fn 3 "Pling" <>
      fn 5 "Plang" <>
      fn 7 "Plong"
  in
    case noises of
      "" -> show n
      other -> other

toNoise :: Int -> Int -> String -> String
toNoise n factor noise
  | mod n factor == 0 = noise
  | otherwise = ""
