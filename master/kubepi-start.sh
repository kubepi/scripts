#!/bin/bash

sudo su -

kubeadm reset

sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown "$(id -u)":"$(id -g)" "$HOME/admin.conf"
export KUBECONFIG="$HOME/admin.conf"

kubeadm init --pod-network-cidr 10.244.0.0/16
