## Pretty Print Out JSON files (prettyjson)
##
## SOURCE FILE: usage.nim
##
## Created by Simon Rowe <simon@wiremoons.com> on 22 Apr 2020
## Source code available from GitHub: https://github.com/wiremoons/prettyjson.git
## 
##
## MIT License
## Copyright (c) 2019 Simon Rowe
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
#

import strformat, os

proc usage*() =
  ##
  ##
  ##
  echo fmt"""

'{paramStr(0)}' is a small command line utility to pretty
print out a JSON file using the Nim standard JSON module.

  Usage:
    <json_file_name>
    cli-args -h | --help
    cli-args -v | --version

  Options:
    <json_file_name>               JSON file to pretty print
    -h --help                      Show this screen
    -v --version                   Show version
  """
  quit 0