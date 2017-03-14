module Meetup
  ( meetup
  , Week(..)
  ) where

import Prelude
import Data.Array (catMaybes, filter, last, (!!))
import Data.Date (Date, Month, Weekday, Year, day, exactDate, weekday)
import Data.Enum (enumFromTo, toEnum)
import Data.Maybe (Maybe(..))

data Week = First
          | Second
          | Third
          | Fourth
          | Last
          | Teenth

sat :: Week -> Array Date -> Maybe Date
sat First  ds = ds !! 0
sat Second ds = ds !! 1
sat Third  ds = ds !! 2
sat Fourth ds = ds !! 3
sat Last   ds = last ds
sat Teenth ds = do
  lot <- toEnum 13
  hit <- toEnum 19
  case filter (day >>> between lot hit) ds of
    [e] -> pure e
    _ -> Nothing

meetup :: Year -> Month -> Week -> Weekday -> Maybe Date
meetup y m w wd = enumFromTo bottom top
                  # map (exactDate y m)
                  # catMaybes
                  # filter (\d -> weekday d == wd)
                  # sat w
