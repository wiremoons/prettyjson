[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE) ![prettyjson](https://github.com/wiremoons/prettyjson/workflows/prettyjson/badge.svg?branch=master) 

# prettyjson

Small Command Line Interface (CLI) application to print out any JSON file in a readable form.


## Program Information

The program `prettyjson` can read the contents of a file containing JSON 
data, and outputs to the screen a formatted version that is much easier to read 
by a person.

Often JSON files received as output from calls to a web API or other computer 
generate sources are minified (ie white space formatting is removed), so when 
viewed using `cat` in a terminal they are hard to read, and the contents are 
all jumbled together in one big long line.

This simple tool `prettyjson` adds white space formatting back into the output 
so the user can have a clear and better formatted view of the JSON data.

The program is written in [Nim](https://nim-lang.org/), and works on Windows, Linux, 
macOS, and other supported Nim platforms.

The program uses the Nim [standard library support for JSON](https://nim-lang.org/docs/json.html), 
so does not required any dependencies other than a working installation of Nim, 
although build management is available via [Nimble](https://github.com/nim-lang/nimble).

Features and benefits summary:

- command line tool available across multiple OS platforms;
- single binary install with no additional dependencies;
- compiled program is built with Nim;
- supports reading JSON from a file;
- supports reading JSON from 'stdin' via a '|' pipe;
- useful to download JSON web data via `curl` and pipe through `prettyjson` in one command;
- fast as Nim compiles single binary as C code by default;
- very small program binary as 'release' file size is less than 120k;
- simple to use with not feature bloat - just does one job well.

## Example Usage

As an example - below is a sample JSON data output:

```json
{"type":"FeatureCollection","metadata":{"generated":1587316361000,"url":"https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.geojson","title":"U
SGS Magnitude 4.5+ Earthquakes, Past Day","status":200,"api":"1.8.1","count":11},"features":[{"type":"Feature","properties":{"mag":5.1,"place":"169km SSE of S
arangani, Philippines","time":1587301770083,"updated":1587315893040,"tz":480,"url":"https://earthquake.usgs.gov/earthquakes/eventpage/us70008zy6","detail":"ht
tps://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/us70008zy6.geojson","felt":null,"cdi":null,"mmi":null,"alert":null,"status":"reviewed"}}]}
```

The same JSON data once printed to the screen using `prettyjson` looks as follows:

```json
{
  "type": "FeatureCollection",
  "metadata": {
    "generated": 1587316361000,
    "url": "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.geojson",
    "title": "USGS Magnitude 4.5+ Earthquakes, Past Day",
    "status": 200,
    "api": "1.8.1",
    "count": 11
  },
  "features": [
    {
      "type": "Feature",
      "properties": {
        "mag": 5.1,
        "place": "169km SSE of Sarangani, Philippines",
        "time": 1587301770083,
        "updated": 1587315893040,
        "tz": 480,
        "url": "https://earthquake.usgs.gov/earthquakes/eventpage/us70008zy6",
        "detail": "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/us70008zy6.geojson",
        "felt": null,
        "cdi": null,
        "mmi": null,
        "alert": null,
        "status": "reviewed"
      }
    }
  ]
}
```

Running `prettyjson` without proving any parameters or when using the `-h` or `--help` options 
displays the following output:

```bash
'./prettyjson' is a small command line utility to pretty
print out a JSON file using the Nim standard JSON module.

  Usage:
    <json_file_name>
    cli-args -h | --help
    cli-args -v | --version

  Options:
    <json_file_name>               JSON file to pretty print
    -h --help                      Show this screen
    -v --version                   Show version
```

Running `prettyjson` when using the `-v` or `--version` options 
displays the following output:

```bash
'./prettyjson' is version: '1.0.0' running on 'linux' (amd64).
Copyright (c) 2020 Simon Rowe.

Compiled on: 2020-04-22 @ 18:30:29.
Build is: release using Nim compiler version: 1.2.0.

For licenses and further information visit:
   - prettyjson application  :  https://github.com/wiremoons/prettyjson/
   - Nim language & compiler :  https://github.com/nim-lang/Nim/

All is well.

```

To read a source JSON file called '*source.json*' and output into a new file a formatted 
version called '*formatted.json*' the following command can be used:

```bash
prettyjson source.json > formatted.json
```

To download a JSON output using `curl` from a web site and pipe the data for better display 
formatting on screen, and example command could be:

```
curl https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.geojson | prettyjson
```


## Building 'prettyjson'

Nim supports many operating systems and hardware platforms.

To build `prettyjson` from source the following steps used:

1. Install the Nim compiler and a C compiler such as gcc or CLang. More 
information on installing Nim can be found here: [Nim Download](https://nim-lang.org/install.html).
2. Once Nim is installed on your system, you can clone this GitHub repo with 
the command: `git clone https://github.com/wiremoons/prettyjson.git`
3. Then in the cloned code directory for `prettyjson` use Nimble to build a 
release version with the command: `nimble release`. Other Nimble build commands 
can be seen by running: `nimble tasks`.
4. The compiled binary of `prettyjson` can now be found in the `./bin` sub 
directory. Just copy it somewhere in you path, and it should work when run.

## Install via Nimble

**TODO**

If you already have Nim and Nimble installed on you system you can install with the command:

```
nimble install prettyjson
```


## License

The application is provided under the MIT open source license. A copy of the 
MIT license file is [here](./LICENSE).

