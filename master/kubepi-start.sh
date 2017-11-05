#!/bin/bash
# Run as sudo

# The following is required to prevent hanging issue with --apiserver-advertise-address=192.168.1.1
# sudo nano /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
# --fail-swap-on=false in kubelet. Update the following line to include the parameter:
# Environment="KUBELET_KUBECONFIG_ARGS=--bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --fail-swap-on=false"

systemctl daemon-reload && systemctl restart kubelet

kubeadm reset
# IP address below is kube-dns server address
# --apiserver-advertise-address=<wifi-ip-address>
#kubeadm init --pod-network-cidr 10.244.0.0/16 --apiserver-advertise-address=0.0.0.0
kubeadm init --pod-network-cidr 10.244.0.0/16