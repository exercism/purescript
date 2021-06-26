let conf = ./spago.dhall

in conf // {
  sources = [ "examples/src/*.purs", "test/**/*.purs" ],
}
