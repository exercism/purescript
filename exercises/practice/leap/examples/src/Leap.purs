module Leap where

import Prelude

isLeapYear :: Int -> Boolean
isLeapYear year =
  mod year 4 == 0 &&
  mod year 100 /= 0 ||
  mod year 400 == 0
