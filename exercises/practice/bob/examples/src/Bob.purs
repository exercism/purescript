module Bob
  ( hey
  ) where

import Prelude
import Data.String.Common as String
import Data.Either as Either
import Data.String.Regex as Regex
import Data.String.Regex.Flags (noFlags)
import Partial.Unsafe as Partial

hey :: String -> String
hey msg =
  if isYell msg && isQuestion msg then
    "Calm down, I know what I'm doing!"
  else if isQuestion msg then
    "Sure."
  else if isYell msg then
    "Whoa, chill out!"
  else if isSilence msg then
    "Fine. Be that way!"
  else
    "Whatever."

isQuestion :: String -> Boolean
isQuestion =
  testRegex "\\?$"

isYell :: String -> Boolean
isYell str = hasLetter str && allUpper str
  where
  hasLetter = testRegex "[a-zA-Z]"
  allUpper s = String.toUpper s == s

isSilence :: String -> Boolean
isSilence =
  testRegex "^[\\s\\t\\n]*$"

testRegex :: String -> String -> Boolean
testRegex patternStr =
  Regex.test
  $ Partial.unsafePartial
  $ Either.fromRight
  $ Regex.regex patternStr noFlags
