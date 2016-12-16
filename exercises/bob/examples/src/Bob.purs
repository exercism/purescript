module Bob
  ( hey
  ) where

import Prelude
import Data.String as String
import Data.Either as Either
import Data.String.Regex as Regex
import Data.String.Regex.Flags (noFlags)
import Partial.Unsafe as Partial

hey :: String -> String
hey msg =
  if hasLetters msg && allUppercase msg then
    "Whoachill out!"
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
  $ Partial.unsafePartial
  $ Either.fromRight
  $ Regex.regex patternStr noFlags
