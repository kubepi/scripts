#!/bin/bash

kubectl run hypriot --image=hypriot/rpi-busybox-httpd --replicas=3 --port=80

kubectl expose deployment hypriot --port 80

kubectl get endpoints hypriot