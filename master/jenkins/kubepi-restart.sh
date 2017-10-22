#!/bin/bash

kubectl replace --force -f jenkins-deployment.yaml
kubectl replace --force -f jenkins-service.yaml