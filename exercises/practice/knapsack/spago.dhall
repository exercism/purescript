{ name = "knapsack"
, dependencies =
  [ "arrays"
  , "console"
  , "datetime"
  , "effect"
  , "either"
  , "enums"
  , "exceptions"
  , "foldable-traversable"
  , "integers"
  , "lists"
  , "math"
  , "maybe"
  , "ordered-collections"
  , "partial"
  , "prelude"
  , "psci-support"
  , "strings"
  , "test-unit"
  , "tuples"
  , "unfoldable"
  , "unicode"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
