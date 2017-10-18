#!/bin/bash

kubectl run jenkins --image=docker pull wouterds/rpi-jenkins --replicas=2 --port=80

kubectl expose deployment jenkins --port 80

kubectl get endpoints jenkins