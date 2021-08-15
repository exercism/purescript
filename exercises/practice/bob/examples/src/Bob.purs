module Bob where

import Prelude

import Data.Either as Either
import Data.String.Common as String
import Data.String.Regex as Regex
import Data.String.Regex.Flags (noFlags)
import Partial.Unsafe (unsafeCrashWith)

hey :: String -> String
hey msg =
  if hasLetters msg && allUppercase msg then
    "Whoa, chill out!"
  else if isQuestion msg then
    "Sure."
  else if isSilence msg then
    "Fine. Be that way!"
  else
    "Whatever."


allUppercase :: String -> Boolean
allUppercase str =
  String.toUpper str == str


isQuestion :: String -> Boolean
isQuestion =
  testRegex "\\?$"


hasLetters :: String -> Boolean
hasLetters =
  testRegex "[a-zA-Z]"


isSilence :: String -> Boolean
isSilence =
  testRegex "^[\\s\\t\\n]*$"


testRegex :: String -> String -> Boolean
testRegex patternStr =
  Regex.test
  $ Either.either (\_ -> unsafeCrashWith "Invalid regex pattern") identity
  $ Regex.regex patternStr noFlags
