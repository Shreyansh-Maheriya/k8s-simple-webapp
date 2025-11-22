# Architecture Documentation

## Components

### 1. WebApp Deployment
- **Image**: nginx:1.20.1
- **Replicas**: 2
- **Resources**: 100m CPU, 64Mi Memory requests

### 2. Service
- **Type**: NodePort
- **Port**: 80
- **NodePort**: 30007

### 3. Configuration
- **ConfigMap**: Application settings
- **Probes**: Liveness and readiness checks

## Network Flow
User → Minikube IP:30007 → NodePort Service → Pod (nginx container)

