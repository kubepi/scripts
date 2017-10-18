#!/bin/bash

kubeadm reset
kubeadm init --pod-network-cidr 10.244.0.0/16

sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown "$(id -u)":"$(id -g)" "$HOME/admin.conf"
export KUBECONFIG="$HOME/admin.conf"

curl -sSL https://rawgit.com/coreos/flannel/v0.7.1/Documentation/kube-flannel-rbac.yml | kubectl create -f -
curl -sSL https://rawgit.com/coreos/flannel/v0.7.1/Documentation/kube-flannel.yml | sed "s/amd64/arm/g" | kubectl create -f -