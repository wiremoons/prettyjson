# Package
version       = "1.0.0"
author        = "Simon Rowe"
description   = "CLI utility to pretty print JSON files using the Nim standard library JSON module."
license       = "MIT"
srcDir        = "src"
bin           = @["prettyjson"]
binDir        = "bin"



# Dependencies
requires "nim >= 1.2.0"

# Tasks
task release, "Builds a release version":
  echo("\nRelease Build...\n")
  exec("nimble build -d:release")

task debug, "Builds a debug version":
  echo("\nDebug Build\n")
  exec("nimble build -d:debug --lineDir:on --debuginfo --debugger:native")