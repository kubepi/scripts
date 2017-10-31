#!/bin/bash
# Run as a regular user

cp /etc/kubernetes/admin.conf $HOME/
chown "$(id -u)":"$(id -g)" "$HOME/admin.conf"
export KUBECONFIG="$HOME/admin.conf"