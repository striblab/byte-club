# Creates a topojson layer of major Minnesota cities, based on cities.csv

# Questions: chase.davis@gmail.com

mapshaper cities.csv \
  -points x=LONG y=LAT \
  -proj albersusa from=longlat \
  -o mn-cities.json format=topojson