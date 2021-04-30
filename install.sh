#!/bin/bash

export FISSION_NAMESPACE="fission"
kubectl create namespace $FISSION_NAMESPACE
helm install --debug --namespace $FISSION_NAMESPACE --name-template fission \
    -f `pwd`/resources/values.yaml \
    https://github.com/fission/fission/releases/download/1.12.0/fission-all-1.12.0.tgz

