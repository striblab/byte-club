# Command-line cartography (Oct. 11, 2018)

Today's Byte Club will focus on using command-line tools to make consistent, repeatable, high-quality maps — both with data and without.

Specifically, we'll be looking at how to create [this basemap of Minnesota counties, cities and roads](https://beta.observablehq.com/@cjdd3b/minnesota-counties-basemap) (the same one we used for our [primary election results](http://www.startribune.com/2018-minnesota-national-state-primary-election-results/489884831/)).

Scripting map operations from the command line, rather than doing them in a graphical tool like QGIS, comes with a number of advantages. It lays out your process in a self-documenting way that is easy to review and audit. It creates a clear, explicit process that can be followed and adapted for future maps. And it makes it easier for other people to step in and work on your project.

## Tools

To jump in, you're going to need a number of tools. A couple have nothing to do with maps:

  * [Homebrew](https://brew.sh/): Install command-line packages on your Mac.
  * [node.js](https://nodejs.org/en/): A Javascript runtime environment for your computer.
  * [wget](https://www.gnu.org/software/wget/): Not a map tool, but a super useful command-line downloader you should probably have on your machines anyway.
  * [csv2json](https://www.npmjs.com/package/csv2json): Does exactly what you think it does.

And several do:

  * [Mapshaper](https://github.com/mbloch/mapshaper): A tool created by Matt Bloch at The New York Times, which is really a collection of useful utilities for processing map data. Also has [this handy site](https://mapshaper.org/) for previewing and manipulating map files.
  * [shapefile](https://github.com/mbostock/shapefile): A command-line utility that exposes useful commands like `shp2json`
  * [topojson](https://github.com/topojson/topojson): A set of tools for working with topojson, which is a multi-layered and more efficient cousin of geojson.
  * [ndjson-cli](https://github.com/mbostock/ndjson-cli/): A command-line interface for working with newline-delimited JSON, which is a key format for command-line cartography.
  * [d3-geo](https://github.com/d3/d3-geo): Probably the most useful d3 package for this application, though several others can also be helpful.

Most of those tools are just node modules with command-line interfaces. It takes a while to get everything installed but shouldn't be too bad once you get rolling.

## Other resources

It doesn't cover all the same things we will, but the best guide out there to command-line cartography is [this one](https://medium.com/@mbostock/command-line-cartography-part-1-897aa8f8ca2c) by Mike Bostock ([part 2](https://medium.com/@mbostock/command-line-cartography-part-2-c3a82c5c0f3), [part 3](https://medium.com/@mbostock/command-line-cartography-part-3-1158e4c55a1e), [part 4](https://medium.com/@mbostock/command-line-cartography-part-4-82d0d26df0cf))

## Questions?

Contact Chase: chase.davis@startribune.com
