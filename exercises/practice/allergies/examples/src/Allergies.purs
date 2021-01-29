module Allergies
  ( allergicTo
  , list
  ) where

import Prelude
import Data.Array (filter)
import Data.Int.Bits ((.&.))
import Data.Map (fromFoldable, lookup)
import Data.Maybe (fromMaybe)
import Data.Tuple (Tuple(Tuple), fst)

weights :: Array (Tuple String Int)
weights = 
  [ Tuple "eggs"         1
  , Tuple "peanuts"      2
  , Tuple "shellfish"    4
  , Tuple "strawberries" 8
  , Tuple "tomatoes"     16
  , Tuple "chocolate"    32
  , Tuple "pollen"       64
  , Tuple "cats"         128
  ]

allergicTo :: Int -> String -> Boolean
allergicTo score substance = fromMaybe false $ do
  weight <- lookup substance (fromFoldable weights)
  pure $ score .&. weight == weight

list :: Int -> Array String
list score = filter (allergicTo score) (map fst weights)
