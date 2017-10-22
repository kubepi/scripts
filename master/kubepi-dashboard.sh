#!/bin/bash

kubectl create secret generic kubernetes-dashboard-certs --from-file=$HOME/certs -n kube-system

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard-arm-head.yaml

kubectl -n kube-system delete $(kubectl -n kube-system get pod -o name | grep dashboard)