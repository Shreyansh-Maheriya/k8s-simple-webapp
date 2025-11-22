#!/bin/bash

echo "🧪 Running Test Scenarios..."

# Test 1: Check all pods are running
echo "1. Checking pod status..."
kubectl get pods -l app=webapp

# Test 2: Test service connectivity
echo "2. Testing service connectivity..."
curl -s http://$(minikube ip):30007 | head -n 5

# Test 3: Check HPA status
echo "3. Checking HPA status..."
kubectl get hpa

# Test 4: Simulate pod failure
echo "4. Testing resilience..."
kubectl delete pod -l app=webapp --wait=false
sleep 10
kubectl get pods -l app=webapp

echo "✅ Test scenarios completed!"
