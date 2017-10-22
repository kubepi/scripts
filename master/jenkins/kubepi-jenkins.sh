#!/bin/bash

kubectl create -f jenkins-deployment.yaml

sleep 10s

kubectl get deployments
kubectl get pods

kubectl create -f jenkins-service.yaml

sleep 10s

kubectl get services