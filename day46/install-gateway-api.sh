#!/bin/bash

# Install Gateway API CRDs for nginx-gateway-fabric
# This script provides multiple methods to install the CRDs

set -e

echo "Installing Gateway API CRDs..."

# Method 1: Direct apply from GitHub raw URLs (most reliable)
echo "Method 1: Installing from GitHub raw URLs..."
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/v1.1.0/config/crd/standard/gateway.networking.k8s.io_gatewayclasses.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/v1.1.0/config/crd/standard/gateway.networking.k8s.io_gateways.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/v1.1.0/config/crd/standard/gateway.networking.k8s.io_httproutes.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/v1.1.0/config/crd/standard/gateway.networking.k8s.io_referencegrants.yaml

echo "Gateway API CRDs installed successfully!"

# Alternative Method 2: If you prefer to use kustomize with local clone
# Uncomment the following lines if Method 1 doesn't work:
#
# echo "Cloning repository locally..."
# git clone --depth 1 --branch v1.5.1 https://github.com/nginx/nginx-gateway-fabric.git /tmp/nginx-gateway-fabric
# kubectl kustomize /tmp/nginx-gateway-fabric/config/crd/gateway-api/standard | kubectl apply -f -
# rm -rf /tmp/nginx-gateway-fabric

