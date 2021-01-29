module RNATranscription
  ( toRNA
  ) where

import Prelude
import Data.Maybe (Maybe(..))
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Data.Traversable (traverse)

toRNA :: String -> Maybe String
toRNA dna = fromCharArray <$> traverse complement (toCharArray dna)

complement :: Char -> Maybe Char
complement 'C' = Just 'G'
complement 'G' = Just 'C'
complement 'A' = Just 'U'
complement 'T' = Just 'A'
complement _ = Nothing
