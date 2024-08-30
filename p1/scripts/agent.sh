#!/bin/bash

sudo -i
apk add curl

export K3S_TOKEN_FILE=/shared/token
export K3S_URL="https://$SERVER_IP:6443"
export INSTALL_K3S_EXEC="--flannel-iface=eth1"

while [ ! -f "$K3S_TOKEN_FILE" ]; do
    echo "Agent: Waiting for k3s to start and generate necessary files..."
    sleep 1
done

curl -sfL https://get.k3s.io | sh -
