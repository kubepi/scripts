#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard-arm-head.yaml

kubectl -n kube-system delete $(kubectl -n kube-system get pod -o name | grep dashboard)