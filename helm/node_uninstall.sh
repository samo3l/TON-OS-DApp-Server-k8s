#!/bin/bash

for chart in {"arangodb","kafka","q-server","statsd","ton-node"}; do 
  helm uninstall -n $1 $chart
  echo "=================================="
done

helm uninstall -n $1 grafana
helm uninstall -n $1 graylog
