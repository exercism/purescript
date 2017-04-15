module Diamond
   (rows
   ) where

import Prelude
import Data.Array (drop, replicate, reverse)
import Data.Char (toCharCode)
import Data.Enum (enumFromTo)
import Data.String (fromCharArray, singleton)

spaces :: Int -> String
spaces width = fromCharArray $ replicate width ' '

mkRow :: Int -> Char -> String
mkRow width 'A' = spaces width <> "A" <> spaces width
mkRow width ch = spaces side
                 <> singleton ch
                 <> spaces mid
                 <> singleton ch
                 <> spaces side
  where depth = toCharCode ch - toCharCode 'A'
        side = width - depth
        mid = 2 * depth - 1

rows :: Char -> Array String
rows end = map (mkRow width) chars
  where width = toCharCode end - toCharCode 'A'
        top = enumFromTo 'A' end
        chars = top <> (reverse top # drop 1)
