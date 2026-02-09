module Spiral
  ( spiral
  ) where

import Prelude

import Data.List ( List(Nil)
                 , fromFoldable
                 , take
                 , drop
                 , transpose
                 , reverse
                 , range
                 , (:)
                 )
import Data.Tuple (Tuple(Tuple))

spiral :: Int -> List (List Int)
spiral n = generateSpiral (range 1 (n * n)) n n

generateSpiral :: forall a. List a -> Int -> Int -> List (List a)
generateSpiral _ _ 0 = Nil
generateSpiral xs m n = ys : rotateRight (generateSpiral zs n $ m - 1)
                        where Tuple ys zs = splitAt n xs

rotateRight :: forall a. List (List a) -> List (List a)
rotateRight = transpose <<< reverse

splitAt :: forall a. Int -> List a -> Tuple (List a) (List a)
splitAt n xs = Tuple (take n xs) (drop n xs)
