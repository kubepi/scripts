#!/bin/bash

sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown "$(id -u)":"$(id -g)" "$HOME/admin.conf"
export KUBECONFIG="$HOME/admin.conf"

curl -sSL https://rawgit.com/coreos/flannel/v0.7.1/Documentation/kube-flannel-rbac.yml | kubectl create -f -
curl -sSL https://rawgit.com/coreos/flannel/v0.7.1/Documentation/kube-flannel.yml | sed "s/amd64/arm/g" | kubectl create -f -

# Run the following on all nodes
sudo iptables -A FORWARD -i cni0 -j ACCEPT
sudo iptables -A FORWARD -o cni0 -j ACCEPT

# Install the load balancer to expose externally
kubectl apply -f https://raw.githubusercontent.com/hypriot/rpi-traefik/master/traefik-k8s-example.yaml
#kubectl apply -f https://raw.githubusercontent.com/containous/traefik/master/examples/k8s/traefik-deployment.yaml
#kubectl delete -f https://raw.githubusercontent.com/containous/traefik/master/examples/k8s/traefik-deployment.yaml

kubectl label node <load balancer-node> nginx-controller=traefik
kubectl label node black-pearl-master nginx-controller=traefik
kubectl label node black-pearl-slave-a nginx-controller=traefik
kubectl label node black-pearl-slave-b nginx-controller=traefik
# kubectl label node black-pearl-slave-a traefik-

kubectl apply -f hypriot-ingress.yaml

echo "10.98.47.167 hypriot" | sudo tee -a /etc/hosts
curl hypriot
