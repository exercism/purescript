{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "booleans"
, dependencies = [ "console", "effect", "prelude", "psci-support", "test-unit" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
