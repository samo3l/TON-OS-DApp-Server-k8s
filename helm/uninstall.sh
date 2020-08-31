#!/bin/bash

for chart in {"arangodb","kafka","q-server","statsd","ton-node"}; do 
  helm uninstall -n $1 $chart
  echo "=================================="
done
