{ name = "halogen-project"
, dependencies =
  [ "console", "effect", "halogen", "halogen-formless", "psci-support" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
