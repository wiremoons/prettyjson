## Pretty Print Out JSON files (prettyjson)
##
## SOURCE FILE: prettyjson.nim
##
## Created by Simon Rowe <simon@wiremoons.com> on 29 March 2020
## Source code available from GitHub: https://github.com/wiremoons/prettyjson.git
## 
## Small CLI application to print out a JSON file in a clear human readable form.
## 
## Build with:  nimble release
##
## MIT License
## Copyright (c) 2020 Simon Rowe
##

# import Nim modules
import os, json, strformat, terminal

# import own local modules
import dbgUtils, version, getjson, usage

#
#  MAIN STARTS HERE
#
var args = commandLineParams()
var jsonfn = ""

debug fmt"command line arguments: {repr args}"

for arg in args:
  case arg:
    of "-h", "--help":
      usage()
    of "-v", "--version":
      showVersion()
    else:
      debug "checking paramCount()"
      if paramCount() > 0:
        debug fmt"found possible filename parameter: {paramStr(1)}"
        jsonfn = paramStr(1)
      if jsonfn == "":
        debug fmt"No filename parameter: {paramStr(1)}"
        echo "ERROR: JSON input filename not found\n"
        usage()
      # try to obtain JSON input from file or stdin
      debug "Attemping to obtain JSON file data input... calling proc 'returnJsonData()'"
      let jsonData = returnJsonData(jsonfn)
      echo pretty(jsonData)
      debug "execution complete"
      quit 0

# no parameters provided...
# so check if JSON data is via a command line pipe '|' ?
if not isatty(stdin):
  debug fmt"No command line parameters but 'stdin file ID' is: {getFileInfo(stdin).id.file}"
  # try to obtain JSON input from file or stdin
  debug "Attempting to obtain JSON pipe data input... calling proc 'returnJsonData()'"
  let jsonData = returnJsonData(jsonfn)
  echo pretty(jsonData)
  debug "execution complete"
  quit 0

# no usable parameters and no stdin pipe provided...
usage()
