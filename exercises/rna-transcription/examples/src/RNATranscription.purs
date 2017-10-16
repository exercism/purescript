module RNATranscription
  ( toRNA
  ) where

import Prelude
import Data.Array (zip)
import Data.Map (Map, fromFoldable, lookup)
import Data.Maybe (Maybe)
import Data.String (fromCharArray, toCharArray)
import Data.Traversable (traverse)

toRNA :: String -> Maybe String
toRNA s = fromCharArray <$> traverse (_ `lookup` rnaMap) (toCharArray s)

dna :: Array Char
dna = toCharArray "CGAT"

rna :: Array Char
rna = toCharArray "GCUA"

rnaMap :: Map Char Char
rnaMap = fromFoldable $ zip dna rna
