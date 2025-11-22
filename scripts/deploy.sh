#!/bin/bash

# Simple deployment script
echo "🚀 Deploying Simple WebApp to Kubernetes..."

# Apply all manifests
kubectl apply -f k8s/configs/
kubectl apply -f k8s/manifests/

# Wait for deployment to complete
echo "⏳ Waiting for deployment to be ready..."
kubectl wait --for=condition=available deployment/webapp-deployment --timeout=60s

# Get deployment status
echo "📊 Deployment Status:"
kubectl get deployment webapp-deployment
kubectl get pods -l app=webapp

echo "✅ Deployment completed!"
echo "🌐 Access your app at: http://$(minikube ip):30007"
