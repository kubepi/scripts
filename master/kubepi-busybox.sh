#!/bin/bash

kubectl run hypriot --image=hypriot/rpi-busybox-httpd --replicas=3 --port=8090

kubectl expose deployment hypriot --port 8090

kubectl get endpoints hypriot