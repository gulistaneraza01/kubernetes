# Kubernetes Ingress Traffic Flow Diagram

## User Request Flow: Browser → Nginx Service

```
┌─────────────────┐
│   User Browser  │
│  http://localhost│
└─────────┬───────┘
          │ HTTP Request
          │ Host: localhost
          ▼
┌─────────────────┐
│   Kind Cluster  │
│   Port 80       │
└─────────┬───────┘
          │
          ▼
┌─────────────────┐
│ NGINX Ingress   │
│ Controller       │
│ (ingress-nginx)  │
└─────────┬───────┘
          │ Routes based on:
          │ - Host: localhost
          │ - Path: /
          │ - ingressClassName: nginx
          ▼
┌─────────────────┐
│   Ingress       │
│   Resource      │
│   (myingress)   │
└─────────┬───────┘
          │ Backend Service:
          │ frontend-service:80
          ▼
┌─────────────────┐
│   Service       │
│ frontend-service│
│ ClusterIP:      │
│ 10.96.64.221    │
└─────────┬───────┘
          │ Load Balances to:
          │ - Pod 1: 10.244.x.x:80
          │ - Pod 2: 10.244.x.x:80
          ▼
┌─────────────────┐
│   Deployment    │
│ frontend-deploy │
│ (2 replicas)    │
└─────────┬───────┘
          │
          ▼
┌─────────────────┐
│   Nginx Pods    │
│ - Pod 1         │
│ - Pod 2         │
│ (nginx:latest)  │
└─────────────────┘
```

## Detailed Component Breakdown:

### 1. User Browser

- User types: `http://localhost`
- Browser sends HTTP request with `Host: localhost` header

### 2. Kind Cluster Port Mapping

- Kind maps host port 80 to cluster port 80
- Traffic enters the Kubernetes cluster

### 3. NGINX Ingress Controller

- Running in `ingress-nginx` namespace
- Listens on port 80
- Processes ingress rules and routes traffic

### 4. Ingress Resource (myingress)

- Defines routing rules:
  - Host: localhost
  - Path: / (all paths)
  - Backend: frontend-service:80
- Uses ingressClassName: nginx

### 5. Service (frontend-service)

- Type: ClusterIP
- Selector: app=frontend-deployment
- Port: 80 → TargetPort: 80
- Load balances between matching pods

### 6. Deployment (frontend-deployment)

- Manages 2 nginx pod replicas
- Pods run nginx:latest image
- Each pod listens on port 80

### 7. Nginx Pods

- Serve the nginx welcome page
- Respond with HTML content

## Key Configuration Files:

1. **kind-ingress.yaml**: Port mapping (80:80, 443:443)
2. **ingress.yaml**: Routing rules and backend service
3. **service.yaml**: Service definition and pod selector
4. **deploy.yaml**: Pod template and replicas

## Traffic Flow Summary:

Browser → Kind Port 80 → Ingress Controller → Ingress Rules → Service → Pods → Nginx Response
