let conf = ./spago.dhall

in conf // {
  sources = [ ".meta/*.purs", "test/**/*.purs" ],
}
