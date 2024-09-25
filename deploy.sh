#!/bin/bash

source ./config.sh

echo "Creating Backup Namespace '$NAMESPACE'"
kubectl create namespace $NAMESPACE

echo "Creating Backup Secrets"
kubectl create secret generic app-secrets --from-env-file=.env -n $NAMESPACE

