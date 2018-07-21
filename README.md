# docker-overpass-api

OpenStreetMap Docker for [Overpass API](http://wiki.openstreetmap.org/wiki/Overpass_API).

## Data file for populating database

Download an indoor OSM file in XML format compressed in bzip format and save as `planet.osm.bz2`. 
Some example files are available under https://git.ropod.org/ropod/wm/openstreetmap-indoor-modelling/tree/master/examples

## To build overpass container
`docker build -t overpass .` 

## Running the Docker image

`docker run -d -p <localhost port>:80 overpass:latest`

## Example
`docker run -d -p 5000:80 overpass:latest`

## Testing
http://localhost:5000/api/interpreter?data=%5Bout:json%5D%5Btimeout:25%5D;

## To update database

### Copy new planet.osm.bz2 file from host to container
`docker cp planet.osm.bz2 <container name>:/usr/src/app/planet.osm.bz2`

### Login to container bash
`docker exec -it <container name> bash`

## kill overpass dispatcher
`ps aux`
Find process with overpass dispatcher and kill it

### Update database by executing following command
sh /srv/osm3s/bin/init_osm3s.sh /usr/src/app/planet.osm.bz2  "$DB_DIR" "$EXEC_DIR"   && rm -f /usr/src/app/planet.osm.bz2

### Quit and restart the docker container!