#!/bin/bash

kubectl cluster-info
kubectl get po --all-namespaces
sleep 5s
kubectl get nodes
