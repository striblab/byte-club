# Creates a topojson layer of major Minnesota roads

# Questions: chase.davis@gmail.com

wget https://www2.census.gov/geo/tiger/TIGER2015/PRISECROADS/tl_2015_27_prisecroads.zip && \
  unzip tl_2015_27_prisecroads.zip  && \
  shp2json tl_2015_27_prisecroads.shp | \
  mapshaper - -filter "RTTYP == 'I' || RTTYP == 'U'" -quiet -proj albersusa -o ./tl_2015_27_prisecroads.json format=geojson && \
  cat tl_2015_27_prisecroads.json | \
  geo2topo roads=- | \
  toposimplify -f -p 0.05 | \
  topoquantize 1e5 > ./mn-roads.json
  rm tl_2015_27_prisecroads.*