{ name = "halogen-project"
, dependencies =
  [ "console"
  , "effect"
  , "halogen"
  , "strings"
  , "maybe"
  , "prelude"
  , "web-html"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
