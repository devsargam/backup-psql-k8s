#!/bin/bash

source ./config.sh

kubectl delete secret app-secrets -n $NAMESPACE
kubectl create secret generic app-secrets --from-env-file=.env -n $NAMESPACE
