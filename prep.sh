#!/usr/bin/env bash

sqlite-utils insert data/wildlife.db occurrence data/occurrence.csv --csv --delimiter=$'\t'
sqlite-utils data/wildlife.db -t "select species, decimalLatitude, decimalLongitude from occurrence limit 2"

sqlite-utils transform data/wildlife.db occurrence \
  --rename decimalLatitude latitude \
  --rename decimalLongitude longitude \
  --drop eventDate \
  --drop institutionCode \
  --drop collectionCode \
  --drop catalogNumber \
  --drop recordNumber \
  --drop basisOfRecord \
  --drop identifiedBy \
  --drop recordedBy \
  --drop occurrenceStatus \
  --pk id

datasette install datasette-cluster-map
datasette data/wildlife.db