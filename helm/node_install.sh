#!/bin/bash

kubectl create ns $1 || true

for chart in {"arangodb","kafka","q-server","statsd","ton-node"}; do 
  helm install -n $1 $chart ./charts/$chart
  echo "=================================="
done

helm repo add stable https://kubernetes-charts.storage.googleapis.com

helm install -n $1 grafana stable/grafana
helm install -n $1 graylog stable/graylog
