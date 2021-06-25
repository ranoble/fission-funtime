#!/bin/bash

helm repo add kedacore https://kedacore.github.io/charts
helm repo update
kubectl create namespace keda
helm install --name keda kedacore/keda --namespace keda --version 2.2.0
