# Creates a counties basemap using counties, cities and road layers

echo 'Getting counties layer ...'
./_get_county_layer.sh && \

echo 'Getting roads layer ...'
./_get_roads_layer.sh && \

echo 'Getting cities ...'
./_get_cities_layer.sh && \

echo 'Combining layers ...'
mapshaper ./mn-counties.json mn-roads.json mn-cities.json snap combine-files \
  -simplify weighted 3% \
  -o mn-counties-basemap.json format=topojson \
  width=400 height=400 bbox force

echo 'Cleaning up ...'
rm mn-counties.json &&
rm mn-roads.json &&
rm mn-cities.json