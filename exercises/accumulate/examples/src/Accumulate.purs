module Accumulate
  ( accumulate
  ) where


import Data.List (List(Nil), (:), reverse)


accumulate :: forall a b . (a -> b) -> List a -> List b
accumulate =
  let
    accumulate' acc f Nil    = reverse acc
    accumulate' acc f (v:vs) = accumulate' (f v:acc) f vs
  in
    accumulate' Nil
