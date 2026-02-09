module AllYourBase
  ( rebase
  ) where

import Prelude
import Data.Array (all, any, length, range, reverse, take, zipWith)
import Data.Foldable (sum)
import Data.Int (pow)
import Data.Maybe (Maybe(Just, Nothing))
import Data.Tuple (Tuple(..))
import Data.Unfoldable (unfoldr)

rebase' :: Int -> Int -> Array Int -> Array Int
rebase' inb oub ind =
  zipWith (*) ind pows
  # sum
  # unfoldr fromDec
  # reverse
  where pows = map (pow inb) (range (length ind - 1) 0)
        fromDec 0 = Nothing
        fromDec n = Just $ Tuple (n `mod` oub) (n / oub)

rebase :: Int -> Int -> Array Int -> Maybe (Array Int)
rebase inb oub ind
  | all (_ == 0) (take 1 ind)       = Nothing
  | any ((_ < 0) || (inb <= _)) ind = Nothing
  | inb < 2 || oub < 2              = Nothing
  | otherwise                       = Just $ rebase' inb oub ind
