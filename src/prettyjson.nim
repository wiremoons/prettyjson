## Pretty Print Out JSON files (prettyjson)
##
## SOURCE FILE: dbgUtils.nim
##
## Created by Simon Rowe <simon@wiremoons.com> on 29 March 2020
## Source code available from GitHub: https://github.com/wiremoons/prettyjson.git
## 
## Small CLI application to print out JSON file in a readable form.
## 
## Build with:  nimble release
##
## MIT License
## Copyright (c) 2020 Simon Rowe
##
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.

# import Nim modules
import os, json, strformat

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
        echo "ERROR: JSON input filename not found\n"
        usage()
      let jsonData = returnJsonData(jsonfn)
      echo pretty(jsonData)
      debug "execution complete"
      quit 0

# no parameters provided...
usage()
