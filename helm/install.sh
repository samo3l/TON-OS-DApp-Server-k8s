#!/bin/bash

kubectl create ns $1 || true

for chart in {"arangodb","kafka","q-server","statsd","ton-node"}; do 
  helm install -n $1 $chart ./$chart
  echo "=================================="
done
