# Satellites and raster data (Jan. 31, 2019)

Today's Byte Club will focus on finding and manipulating satellite and raster data using open source tools. Specifically we'll be looking at three examples:

  * [An animation of the Polar Vortex](https://twitter.com/chasedavis/status/1090729970706591744) using NOAA forecast models ([code here](https://github.com/cjdd3b/polar-vortex))

  * [An animation of U.S. snowfall totals](https://twitter.com/chasedavis/status/1086224515343024128) using NOAA snowfall totals ([code here](https://github.com/cjdd3b/snowfall-montage))

  * And a true-color animation of [Winter Storm Eboni](https://twitter.com/chasedavis/status/1078655411333541889) from the GOES-16 satellite ([code here](https://github.com/cjdd3b/goes16-eboni)).

Creating all three generally requires using the same tools.

## Tools

To work with satellite and raster data from the command line, you'll need a few tools:

  * [Homebrew](https://brew.sh/): Install command-line packages on your Mac.
  * [gdal2](https://www.gdal.org/): Command-line tool for manipulating raster data. Best to use [these installation instructions](https://varunpant.com/posts/gdal-2-on-mac-with-homebrew).
  * [wget](https://www.gnu.org/software/wget/): Not a map tool, but a super useful command-line downloader you should probably have on your machines anyway.
  * [imagemagick](https://www.imagemagick.org/): Manipulate images programmatically from the command line.
  * The Python libraries outlined [here](https://github.com/cjdd3b/goes16-eboni/blob/master/_plot_image.py) for manipulating NetCDF files.
  * [ffmpeg](https://www.ffmpeg.org/) for creating movie files.

Photoshop and GIS software like QGIS can also be helpful.

## Raster data vs. vector data

In [mapping](https://gisgeography.com/spatial-data-types-vector-raster/), vector data is basically polygons represented by shapefiles, GeoJSON files, etc. Raster data is generally images with embedded geographic information, represented in formats like GeoTIFFs and NetCDF files.

Because they contain geographic information, raster files can generally be treated in much the same way as more familiar vector files. They can be transformed via projection, queried, analyzed, or even mashed up with vector files. Data is just stored at a pixel-by-pixel level rather than in defined shapes.

For our purposes, satellite data is represented as raster files — as are other types of data we might find useful.

## Sources of satellite data

Long story short, there are two sources for satellite data: the government, which is free, or companies like [DigitalGlobe](https://www.digitalglobe.com/) or [Descartes Labs](https://www.descarteslabs.com/), which are not.

Generally private imagery is cleaner, easier to use and often higher-res than public imagery. But it's also more expensive. Since we work at a newspaper, though, we'll just stick to the public stuff.

There are a few common satellites worth knowing about:

  * **Landsat 8**: The [Landsat proggram](https://landsat.usgs.gov/landsat-8) has been around a long time. Landsat 8 is the most recent version, which launched in 2013, crosses every point on Earth about [once every 16 days](https://landsat.usgs.gov/what-acquisition-schedule-landsat). **Good for**: Month- or year-scale comparisons of points on Earth (as long as there are no clouds); time-insensitive imagery; remote sensing.

  * **Sentinel**: Basically European Landsat, except high-res imagery doesn't require [pansharpening](https://blog.mapbox.com/pansharpening-satellite-imagery-for-easier-tracing-into-openstreetmap-79a0db1c35cb). **Good for**: The same kinds of things as Landsat.

  * **GOES-16**: A next-generation weather satellite that covers the Western hemisphere and — unlike Landsat — takes readings every 15 minutes. Its Japanese cousin, [Himawari-8](https://www.ssd.noaa.gov/jma/japan.html), does something similar in the Eastern Hemisphere. Descriptions of where to find the data and some special cleaning procedures required to work with it are [here](https://github.com/cjdd3b/goes16-eboni). **Good for**: Dramatic images of storms, remote sensing.

  * **VIIRS, MODIS, etc.**: The U.S. also operates a number of older-generation weather satellites like VIIRS and [MODIS](https://developers.google.com/earth-engine/datasets/catalog/modis), which have slightly different instrumentation and acquisition schedules. **Good for**: Checking when you need imagery that other options don't have, remote sensing.

  * **NAIP and other aerial images**: The government also operates several aerial imagery collection programs that use planes, not satellites, and are capable of gathering much higher-resolution imagery — at the unfortunate cost of time. The [National Agriculture Imagery Program](https://www.fsa.usda.gov/programs-and-services/aerial-photography/imagery-programs/naip-imagery/), for instance, collects [extremely high-res data](https://developers.google.com/earth-engine/datasets/catalog/USDA_NAIP_DOQQ) of the U.S. on a five-year cycle. **Good for**: Non-time-sensitive imagery.

Conveniently, data from most of these sources is available on [Google Earth Engine](https://developers.google.com/earth-engine/) which makes it (relatively) easy to explore and download their imagery.

## Notes on working with satellite data

Satellite data can be inscrutable, but there are a few high-level points worth keeping in mind if you're working with it.

In news, there are generally two reasons to use satellite data:

  1. You want to see pictures of a thing from space (a chunk of land, a storm, etc.)

  2. You want to do fancy remote sensing analyses.

You're already working well beyond the scope of this session if you're doing remote sensing. So we'll focus on the first one:

Getting a true-color image from a satellite isn't straightforward. Satellites aren't like cameras. They take readings across a series of spectral bands, which vary based on the satellite and need to be combined to create images humans would recognize.

Generally most satellites will capture a red, green and blue band, which can be combined to create a true-color image. These images often present as three separate files, which can be merged together using a tutorial like [this](https://docs.mapbox.com/help/tutorials/processing-satellite-imagery/), [this](https://blog.mapbox.com/processing-landsat-8-using-open-source-tools-d1c40d442263) or [this](https://blog.mapbox.com/putting-landsat-8s-bands-to-work-631c4029e9d1).

Combining the red, green and blue bands should get you an image that looks (sorta) like real life. But it'll probably be washed out due to atmospheric effects and possibly covered in clouds and dust.

Further processing can be done to sharpen an image, and most high-quality standalone images you see other news organizations publish are also toned by hand in Photoshop.

Bands can also be combined to create [false-color images](https://en.wikipedia.org/wiki/False_color) that make it possible to highlight and analyze things like vegetation, snow cover, active wildfires and much more.

**Takeaway**: Land cover pictures aren't that hard to process, but they also aren't very deadline-friendly. A given satellite might only over a single patch of land once every few weeks, and some of those passes will inevitably be on cloudy days. Long-term comparisons of land use, visualizing storms or clouds, or just grabbing neat but not time-sensitive aerial images are all good use of true-color imagery in our field.

## Other raster data

The [Polar Vortex]((https://github.com/cjdd3b/polar-vortex)) and [snowfall montage]((https://github.com/cjdd3b/snowfall-montage)) projects referenced above don't use satellite imagery — but they do use raster data from other sources: namely [weather forecasts](https://www.ncdc.noaa.gov/data-access/model-data/model-datasets/global-forcast-system-gfs) and [snowfall estimates](https://www.nohrsc.noaa.gov/snowfall/). Mapping this data is similar to mapping satellite imagery, except it doesn't require combining multiple bands.

## Examples

Here's a few for inspiration:

  * [Some of the coldest air in the world is descending on the Midwest](https://www.washingtonpost.com/graphics/2019/national/polar-vortex-globe/?utm_term=.47adb92c8518): Uses NOAA GFS forecast models of minimum temperatures.
  * [Watching Hurricanes Irma, Jose and Katia from 22,000 miles above Earth](https://www.nytimes.com/interactive/2017/09/12/us/hurricane-irma-satellite-images.html): Uses projected and toned GOES-16 readings with a nighttime mask for 24-hour coverage.
  * [How the Islamic State is using scorched earth tactics as it retreats](https://www.washingtonpost.com/graphics/world/islamic-state-oil-fire/): Uses imagery from Landsat, MODIS and elsewhere to show changes in land cover over time.
  * [A Matter of Miles](http://www.tampabay.com/projects/2017/hurricane-irma/matter-of-miles/): The rare example of a regional news organization using satellite imagery (GOES-16).
  * [A Giant Picture of Snow Across the United States](https://www.nytimes.com/interactive/2015/03/05/us/one-giant-picture-of-all-the-snow-across-the-us.html): In which the NYT creates a massive composite of U.S. snow cover using MODIS imagery.
  * [We have some good news on the California drought. Take a look.](https://www.nytimes.com/interactive/2017/03/22/us/california-measuring-snowpack.html): The NYT uses high-res satellite imagery to show changes in the Sierra Nevada snowpack over time.
  * [Billions of Birds Migrate](https://www.nationalgeographic.com/magazine/2018/03/bird-migration-interactive-maps/): Striking visual story by National Geographic that takes advantage of GOES-16 imagery and other data to visualize the migration patterns of birds.
  * [This map shows every inch of snow that fell in the lower 48 this year](https://www.washingtonpost.com/graphics/2018/national/snow-accumulation/): WaPo uses NOAA snowfall accumulation data and satellite imagery to tell a fun story about snow in 2018.
  * [Tim Wallace's Instagram](https://www.instagram.com/_tim.wallace_/): Former cartographer for the NYT, known for his awesome data art using satellite images.
  * [Borderline](https://www.washingtonpost.com/graphics/2018/national/us-mexico-border-flyover/): WaPo uses Sentinel data to help reconstruct the U.S./Mexico border fence area.

## Other resources

In no particular order:

  - [How to make a true color Landsat-8 image](https://earthobservatory.nasa.gov/blogs/elegantfigures/2013/10/22/how-to-make-a-true-color-landsat-8-image/)
  - [NICAR 18 Landsat tutorial](https://github.com/yanofsky/nicar18-landsat) (with [data](https://www.dropbox.com/sh/c5c5nfcyzus1bmg/AADWW5lMhwRc8QA3oJl_NPZda/Creating_your_first_satellite_image_1187?dl=0))
  - [This amazing code from OCC](https://github.com/occ-data/goes16-play)
  - [GOES-16 band reference guide](https://www.weather.gov/media/crp/GOES_16_Guides_FINALBIS.pdf)
  - [Manipulated GOES-16 data with GDAL](http://edc.occ-data.org/goes16/gdal)
  - [GOES-16 S3 explorer](https://noaa-goes16.s3.amazonaws.com/index.html)
  - [Conquering the Earth with cron](https://hackaday.com/2018/06/25/conquering-the-earth-with-cron/)
  - [GOES-16 Product Manipulation Using Free Software Tools](https://geonetcast.wordpress.com/2017/02/08/goes-16-product-manipulation-using-free-software-tools/)
  - [Mapping GOES-16 data (notebook)](https://github.com/blaylockbk/pyBKB_v2/blob/master/BB_goes16/mapping_GOES16_data.ipynb)
  - [GOES imagery viewer](https://www.ssec.wisc.edu/data/geo/#/about?satellite=goes-16&end_datetime=latest&n_images=1&coverage=conus&channel=02&image_quality=gif&anim_method=javascript)
  - [Source: How we made Billions of Birds Migrate](https://source.opennews.org/articles/how-we-made-billions-birds-migrate/)
  - [NICAR 18 data blitz](https://github.com/jmuyskens/nicar18-data-blitz-goes-16)
  - [Manipulating GOES-16 data with Python](https://geonetcast.wordpress.com/2017/08/18/geonetclass-manipulating-goes-16-data-with-python-part-vii/)
  - [Some useful stuff from Iowa State](https://mesonet.agron.iastate.edu/GIS/goes.phtml)

## Questions?

Contact Chase: chase.davis@startribune.com