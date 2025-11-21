# Kubernetes Learning Repository (k8s-1)

A comprehensive Kubernetes learning repository containing hands-on examples, configurations, and documentation covering various Kubernetes concepts from basics to advanced topics.

## 📚 Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Repository Structure](#repository-structure)
- [Getting Started](#getting-started)
- [Day-by-Day Learning Path](#day-by-day-learning-path)
- [Kind Cluster Configurations](#kind-cluster-configurations)
- [Example Applications](#example-applications)
- [Documentation](#documentation)
- [Tools and Scripts](#tools-and-scripts)

## Overview

This repository contains a structured learning path for Kubernetes, organized by days. Each day focuses on specific Kubernetes concepts with practical examples, YAML manifests, and configurations. The repository includes:

- **Day-by-day learning modules** covering core Kubernetes concepts
- **Kind cluster configurations** for local development
- **CNI configurations** (Calico, Cilium)
- **Example applications** (Voting App)
- **Helm charts** (ArgoCD)
- **Ingress documentation** and flow diagrams
- **Gateway API** installation scripts

## Prerequisites

Before using this repository, ensure you have:

- **Docker** installed and running
- **kubectl** installed ([Installation Guide](https://kubernetes.io/docs/tasks/tools/))
- **Kind** (Kubernetes in Docker) installed ([Installation Guide](https://kind.sigs.k8s.io/docs/user/quick-start/#installation))
- **Helm** (for some examples) ([Installation Guide](https://helm.sh/docs/intro/install/))
- Basic understanding of YAML and containerization

## Repository Structure

```
k8s-1/
├── day14-day46/          # Learning modules organized by day
├── k8s/                  # Core Kubernetes examples
├── example-voting-app/   # Complete voting application example
├── project/              # Project-specific configurations
├── volume/               # Volume-related examples
├── kind-*.yaml          # Kind cluster configurations
└── *.md                 # Documentation files
```

## Getting Started

### 1. Create a Kind Cluster

Choose a configuration based on your needs:

**Basic Cluster:**

```bash
kind create cluster --config kind-config.yaml
```

**Cluster with Ingress Support:**

```bash
kind create cluster --config kind-ingress.yaml
```

**Cluster with Calico CNI:**

```bash
kind create cluster --config kindCalico.yaml
# Then install Calico CNI
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
```

**Cluster with Cilium CNI:**

```bash
kind create cluster --config kindCilium.yaml
# Then install Cilium CNI
helm repo add cilium https://helm.cilium.io/
helm install cilium cilium/cilium --version 1.14.0
```

### 2. Verify Cluster

```bash
kubectl cluster-info
kubectl get nodes
```

### 3. Start Learning

Navigate to the specific day directory and follow the examples:

```bash
cd day33
kubectl apply -f ingress.yaml
```

## Day-by-Day Learning Path

### Day 14 - Affinity and Anti-Affinity

**Location:** `Day14-affinite/`, `k8s/Day14/`

- Pod affinity and anti-affinity rules
- Node affinity configurations
- Examples: `nginx-affinity.yaml`, `nginx-aff-prefer.yaml`

### Day 16 - Resource Management

**Location:** `day16/`

- Resource requests and limits
- CPU and memory constraints
- Examples: `resource.yaml`, `matrix-server.yaml`

### Day 17 - Autoscaling

**Location:** `day17/`

- Horizontal Pod Autoscaler (HPA)
- Vertical Pod Autoscaler (VPA)
- Examples: `harozontal.yaml`, `vertical.yaml`

### Day 18 - Health Checks

**Location:** `day18/`

- Liveness probes
- Readiness probes
- Startup probes
- Examples: `livenessHttp.yaml`, `livenessTcp.yaml`, `liveCmd.yaml`

### Day 19 - ConfigMaps

**Location:** `day19/`

- ConfigMap creation and usage
- Mounting ConfigMaps as volumes
- Examples: `config.yaml`, `nginx.yaml`

### Day 21 - Certificates and TLS

**Location:** `day21/`

- Certificate Signing Requests (CSR)
- TLS certificates
- Certificate management
- Examples: `cetificate.yaml`, `csr.yaml`, `issuecert.yaml`

### Day 22 - RBAC (Role-Based Access Control)

**Location:** `day22/`

- Roles and RoleBindings
- ClusterRoles and ClusterRoleBindings
- Service accounts
- Examples: `role.yaml`, `binding.yaml`, `context.yaml`

### Day 24 - Cluster Roles

**Location:** `Day24/`

- ClusterRole definitions
- ClusterRoleBinding configurations
- Examples: `clusterrole.yml`, `clusterRoleBinding.yml`

### Day 25 - Service Accounts

**Location:** `day25/`

- Service account creation
- Token management
- RBAC integration
- Examples: `seviceAccount.yaml`, `token.yaml`, `role.yaml`, `rolebinding.yaml`

### Day 26 - Network Policies

**Location:** `day26/`

- Network policy definitions
- Ingress and egress rules
- Pod selectors
- Examples: `networkpolicy.yaml`, `manifest.yaml`

### Day 29 - Persistent Volumes

**Location:** `Day29/`

- PersistentVolume (PV) and PersistentVolumeClaim (PVC)
- Storage classes
- Volume mounting
- Examples: `pv.yaml`, `pvc.yaml`, `redis.yaml`

### Day 30

**Location:** `day30/`

_(Content to be added)_

### Day 32 - Multi-Container Pods

**Location:** `day32/`

- Sidecar patterns
- Multi-container deployments
- Examples: `nginx1.yaml`, `nginx2.yaml`

### Day 33 - Ingress

**Location:** `day33/`

- Ingress resources
- Ingress controllers
- Path-based routing
- Examples: `ingress.yaml`, `deploy.yaml`, `service.yaml`, `pod.yaml`
- Documentation: `detailed-ingress-flow.md`, `ingress-flow-diagram.md`

### Day 34 - Rolling Updates

**Location:** `day34/`

- Deployment strategies
- Rolling updates
- Rollback procedures
- Examples: `rollingupdate.yaml`

### Day 35 - Backup

**Location:** `day35/`

- Backup strategies
- Volume snapshots
- Examples: `backup.yaml`

### Day 36

**Location:** `day36/`

_(Content to be added)_

### Day 40 - JSON and YAML

**Location:** `day40/`

- JSON to YAML conversion
- Manifest formatting
- Examples: `nginx.json`, `nginx.yaml`, `ip.json`

### Day 41 - Helm and ArgoCD

**Location:** `day41/`

- Helm chart creation
- ArgoCD deployment
- GitOps workflows
- Examples: `argo-cd/` (Helm chart), `demo/` (sample chart)

### Day 42 - Kustomize

**Location:** `day42/`

- Kustomize base and overlays
- Environment-specific configurations
- Examples: `kustomized/base/`, `kustomized/overlays/dev/`, `kustomized/overlays/test/`

### Day 45 - Storage Classes

**Location:** `day45/`

- Storage class definitions
- Dynamic provisioning
- Volume management
- Examples: `storageclass.yaml`, `volume.yaml`, `service.yaml`

### Day 46 - Gateway API

**Location:** `day46/`

- Gateway API CRDs
- Priority classes
- Installation scripts
- Examples: `install-gateway-api.sh`, `priority-high.yaml`, `priority-mid.yaml`, `priority-low.yaml`

## Kind Cluster Configurations

### `kind-config.yaml`

Basic Kind cluster with 1 control-plane and 2 worker nodes.

### `kind-ingress.yaml`

Kind cluster configured with port mappings for ingress:

- Port 80 → 80 (HTTP)
- Port 443 → 443 (HTTPS)
- Port 8000 → 31000
- Port 8001 → 31001

### `kindCalico.yaml`

Kind cluster configured for Calico CNI:

- Disables default CNI
- Sets pod subnet to 192.168.0.0/16

### `kindCilium.yaml`

Kind cluster configured for Cilium CNI:

- Disables default CNI and kube-proxy
- Sets pod subnet to 10.244.0.0/16

### `kindCNF.yaml`

Additional CNI configuration file.

## Example Applications

### Voting App

**Location:** `example-voting-app/`

A complete distributed application demonstrating:

- Multi-container architecture
- Service communication
- Persistent storage
- Load balancing

**Components:**

- **Vote**: Python web app (port 8080)
- **Redis**: Message queue
- **Worker**: .NET worker service
- **Postgres**: Database
- **Result**: Node.js results app (port 8081)

**Deploy to Kubernetes:**

```bash
cd example-voting-app
kubectl create -f k8s-specifications/
```

**Access:**

- Vote app: `http://localhost:31000`
- Results app: `http://localhost:31001`

See `example-voting-app/README.md` for detailed instructions.

## Documentation

### Ingress Flow Documentation

- **`detailed-ingress-flow.md`**: Comprehensive explanation of ingress traffic flow
- **`ingress-flow-diagram.md`**: Visual diagrams of ingress routing

These documents explain:

- How requests flow from browser to pods
- Ingress controller processing
- Service resolution and load balancing
- Network path visualization

## Tools and Scripts

### Gateway API Installation

**Location:** `day46/install-gateway-api.sh`

Installs Gateway API CRDs for nginx-gateway-fabric:

```bash
chmod +x day46/install-gateway-api.sh
./day46/install-gateway-api.sh
```

Installs:

- GatewayClasses
- Gateways
- HTTPRoutes
- ReferenceGrants

## Core Kubernetes Examples

**Location:** `k8s/`

Contains fundamental Kubernetes examples:

- Pods (`pod.yaml`)
- Deployments (`nginx-deploy.yaml`)
- Services (`service-nginx.yaml`)
- Replication Controllers (`replication.yaml`)
- Namespaces (`namespace1.yaml`)
- Jobs and CronJobs (`cornjb.yaml`)
- DaemonSets (`demonsetDemo.yaml`)
- Init Containers (`init.yaml`)

## Project-Specific Configurations

**Location:** `project/`

Contains project-specific resources:

- Authentication secrets
- TLS certificates
- Deployments
- Services
- Volumes
- Registry configurations

## Common Commands

### Cluster Management

```bash
# Create cluster
kind create cluster --config kind-config.yaml

# Delete cluster
kind delete cluster

# Get cluster info
kubectl cluster-info

# Get all resources
kubectl get all --all-namespaces
```

### Resource Management

```bash
# Apply manifest
kubectl apply -f <file.yaml>

# Delete resources
kubectl delete -f <file.yaml>

# Get resources
kubectl get <resource-type>

# Describe resource
kubectl describe <resource-type> <name>

# Logs
kubectl logs <pod-name>
```

### Port Forwarding

```bash
# Forward port to local machine
kubectl port-forward <pod-name> <local-port>:<pod-port>

# Forward service port
kubectl port-forward svc/<service-name> <local-port>:<service-port>
```

## Best Practices

1. **Always use namespaces** to organize resources
2. **Set resource limits** on all containers
3. **Use ConfigMaps and Secrets** for configuration
4. **Implement health checks** (liveness and readiness probes)
5. **Use labels and selectors** consistently
6. **Follow the principle of least privilege** with RBAC
7. **Use persistent volumes** for data that needs to survive pod restarts
8. **Implement network policies** for security
9. **Use Helm or Kustomize** for complex deployments
10. **Document your configurations** with comments

## Troubleshooting

### Cluster Issues

```bash
# Check node status
kubectl get nodes

# Check pod status
kubectl get pods --all-namespaces

# Check events
kubectl get events --sort-by='.lastTimestamp'
```

### Common Problems

**Pods in Pending state:**

- Check node resources: `kubectl describe node`
- Check resource requests/limits
- Check node selectors and affinity rules

**Pods in CrashLoopBackOff:**

- Check logs: `kubectl logs <pod-name>`
- Check previous logs: `kubectl logs <pod-name> --previous`
- Verify image and configuration

**Service not accessible:**

- Verify service selector matches pod labels
- Check endpoints: `kubectl get endpoints <service-name>`
- Verify port mappings

## Contributing

This is a learning repository. Feel free to:

- Add more examples
- Improve documentation
- Fix errors
- Add new day modules

## Resources

- [Kubernetes Official Documentation](https://kubernetes.io/docs/)
- [Kind Documentation](https://kind.sigs.k8s.io/)
- [Helm Documentation](https://helm.sh/docs/)
- [Gateway API Documentation](https://gateway-api.sigs.k8s.io/)
- [Calico Documentation](https://docs.projectcalico.org/)
- [Cilium Documentation](https://docs.cilium.io/)
