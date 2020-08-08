## Pretty Print Out JSON files (prettyjson)
##
## SOURCE FILE: getjson.nim
##
## Created by Simon Rowe <simon@wiremoons.com> on 22 Apr 2020
## Source code available from GitHub: https://github.com/wiremoons/prettyjson.git
## 
##
## MIT License
## Copyright (c) 2019 Simon Rowe
##

# import Nim standard modules
import json, strformat, dbgUtils, os

proc returnJsonData*(jsonfn: string): JsonNode =
  ##
  ## open and read the json file into a JSON node object
  ##

  # if no filename - but receiving data from a stdin pipe?
  if jsonfn == "" :
    debug "Attempting read JSON input data from 'stdin' pipe"
    # read the data from stdin and parse as JSON
    try:
      result = parseJson(readAll(stdin))
      return result
    except JsonParsingError:
      let
        e = getCurrentException()
        msg = getCurrentExceptionMsg()
      echo "Got parsing 'stdin' exception ", repr(e), " with message ", msg
    except:
      echo "Unknown exception!"
      quit 1

  debug fmt"executing proc 'returnJsonData() with filename: '{jsonfn}'"

  #make sure the json file exists or we have data from stdin pipe first
  if not fileExists(jsonfn):
    echo fmt"ERROR: unable to locate JSON file: '{jsonfn}'"
    debug fmt"aborting execution as file '{jsonfn}' does not exist."
    quit()

  # read the data from the jsonfn file into the JObject called jsonData
  try:
    result = parseFile(jsonfn)
  except JsonParsingError:
    let
      e = getCurrentException()
      msg = getCurrentExceptionMsg()
    echo "Got JSON exception ", repr(e), " with message ", msg
  except:
    echo "Unknown exception!"
    quit 1