#! /bin/bash
docker container stop overpass_container
docker container rm overpass_container
rm planet.osm.bz2
cp brsu.osm planet.osm
bzip2 planet.osm
docker build -t overpass .
docker run --name overpass_container -d -p 8000:80 overpass:latest
