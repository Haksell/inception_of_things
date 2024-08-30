#!/bin/bash

sudo -i
apk add curl

TOKEN_FILE="/var/lib/rancher/k3s/server/token"
KUBECONFIG_FILE="/etc/rancher/k3s/k3s.yaml"
SHARED_FOLDER="/shared"

export INSTALL_K3S_EXEC="--bind-address=$SERVER_IP --node-external-ip=$SERVER_IP --flannel-iface=eth1"

curl -sfL https://get.k3s.io | sh -

while [ ! -f "$TOKEN_FILE" ] || [ ! -f "$KUBECONFIG_FILE" ]; do
    echo "Waiting for k3s to start and generate necessary files..."
    sleep 1
done

cp "$TOKEN_FILE" "$SHARED_FOLDER"
cp "$KUBECONFIG_FILE" "$SHARED_FOLDER"
