{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "matching-brackets"
, dependencies =
  [ "console"
  , "datetime"
  , "effect"
  , "either"
  , "enums"
  , "integers"
  , "lists"
  , "ordered-collections"
  , "prelude"
  , "psci-support"
  , "strings"
  , "test-unit"
  , "unicode"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
