# Detailed Kubernetes Ingress Traffic Flow

## Real IP Addresses and Connections:

```
User Browser (localhost:80)
         │
         ▼
┌─────────────────────────────────────┐
│ Kind Cluster Port Mapping           │
│ Host Port 80 → Cluster Port 80      │
└─────────────────┬───────────────────┘
                  │
                  ▼
┌─────────────────────────────────────┐
│ NGINX Ingress Controller            │
│ Namespace: ingress-nginx            │
│ Pod: ingress-nginx-controller-*    │
└─────────────────┬───────────────────┘
                  │ Matches Rule:
                  │ Host: localhost
                  │ Path: /
                  ▼
┌─────────────────────────────────────┐
│ Ingress Resource: myingress         │
│ Class: nginx                        │
│ Address: localhost                  │
│ Backend: frontend-service:80        │
└─────────────────┬───────────────────┘
                  │
                  ▼
┌─────────────────────────────────────┐
│ Service: frontend-service           │
│ Type: ClusterIP                     │
│ IP: 10.96.64.221                    │
│ Port: 80 → TargetPort: 80           │
│ Selector: app=frontend-deployment   │
└─────────────────┬───────────────────┘
                  │ Load Balances to:
                  │
                  ├─► Pod 1: 10.244.1.4:80
                  │   (cluster-worker2)
                  │
                  └─► Pod 2: 10.244.2.5:80
                      (cluster-worker)
```

## Step-by-Step Request Flow:

### 1. **User Request**

```
GET http://localhost/
Host: localhost
```

### 2. **Kind Port Forwarding**

- Host port 80 → Kind cluster port 80
- Traffic enters the Kubernetes network

### 3. **Ingress Controller Processing**

- NGINX Ingress Controller receives the request
- Checks ingress rules for matching host and path
- Finds `myingress` with host: localhost, path: /

### 4. **Service Resolution**

- Ingress forwards to `frontend-service:80`
- Service IP: `10.96.64.221`
- Service uses selector `app=frontend-deployment`

### 5. **Pod Selection**

- Service load balances between matching pods:
  - Pod 1: `10.244.1.4:80` (on cluster-worker2)
  - Pod 2: `10.244.2.5:80` (on cluster-worker)

### 6. **Nginx Response**

- Selected pod serves nginx welcome page
- Response flows back through the same path

## Key Configuration Details:

### Ingress Configuration:

```yaml
spec:
  ingressClassName: nginx
  rules:
    - host: "localhost"
      http:
        paths:
          - pathType: Prefix
            path: "/"
            backend:
              service:
                name: frontend-service
                port:
                  number: 80
```

### Service Configuration:

```yaml
spec:
  selector:
    app: frontend-deployment
  ports:
    - port: 80
      targetPort: 80
```

### Deployment Configuration:

```yaml
spec:
  selector:
    matchLabels:
      app: frontend-deployment
  template:
    metadata:
      labels:
        app: frontend-deployment
```

## Network Flow Summary:

```
Browser → localhost:80 → Kind Cluster → Ingress Controller →
Ingress Rules → Service (10.96.64.221:80) →
Pod (10.244.1.4:80 or 10.244.2.5:80) → Nginx Response
```
