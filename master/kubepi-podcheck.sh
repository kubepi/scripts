#!/bin/bash

kubectl cluster-info
echo " "
kubectl get po --all-namespaces
echo " "
sleep 5s
kubectl get nodes
echo " "
kubectl get services
echo " "
kubectl get pods
