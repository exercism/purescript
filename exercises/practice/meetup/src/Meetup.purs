module Meetup
  ( meetup
  , Week(..)
  ) where

import Data.Date (Date, Month, Weekday, Year)
import Data.Maybe (Maybe)
import Effect.Exception.Unsafe (unsafeThrow)

data Week
  = First
  | Second
  | Third
  | Fourth
  | Last
  | Teenth

meetup :: Year -> Month -> Week -> Weekday -> Maybe Date
meetup = unsafeThrow "You need to implement this function."
