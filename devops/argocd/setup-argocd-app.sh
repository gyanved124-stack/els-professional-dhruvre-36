#!/bin/bash

# ArgoCD Application Setup Script for Level 4
# This script initializes and applies the ArgoCD application

set -e

echo "🚀 Setting up ArgoCD Application for Level 4..."
echo ""

# Check if ArgoCD is installed
if ! kubectl get namespace argocd &>/dev/null; then
    echo "❌ Error: ArgoCD namespace not found!"
    echo "Please install ArgoCD first:"
    echo "  kubectl create namespace argocd"
    echo "  kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"
    exit 1
fi

echo "✅ ArgoCD namespace found"

# Check if application.yaml exists
if [ ! -f "application.yaml" ]; then
    echo "❌ Error: application.yaml not found in current directory"
    echo "Please run this script from: level-4/helper/devops/argocd/level-4/"
    exit 1
fi

echo "✅ application.yaml found"

# Check if user has updated the repo URL
if grep -q "YOUR_USERNAME/YOUR_REPO" application.yaml; then
    echo ""
    echo "⚠️  WARNING: application.yaml still contains placeholder values!"
    echo ""
    echo "Please update the following in application.yaml:"
    echo "  - repoURL: Your GitHub repository URL"
    echo "  - targetRevision: Your branch name (e.g., main)"
    echo ""
    read -p "Continue anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting. Please update application.yaml and run again."
        exit 1
    fi
fi

# Apply the ArgoCD application
echo ""
echo "📦 Applying ArgoCD Application..."
kubectl apply -f application.yaml

echo ""
echo "✅ ArgoCD Application created successfully!"
echo ""

# Wait a moment for the application to be created
sleep 2

# Check application status
echo "📊 Application Status:"
kubectl get application -n argocd els-devops-system

echo ""
echo "🎯 Next Steps:"
echo ""
echo "1. View in ArgoCD UI:"
echo "   kubectl port-forward svc/argocd-server -n argocd 8080:443"
echo "   Then open: https://localhost:8080"
echo ""
echo "2. Get ArgoCD admin password:"
echo "   kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath=\"{.data.password}\" | base64 -d"
echo ""
echo "3. Watch application sync:"
echo "   kubectl get application -n argocd els-devops-system -w"
echo ""
echo "4. Check deployed resources:"
echo "   kubectl get all -n els-devops-system"
echo ""
echo "5. Monitor HPA (autoscaling):"
echo "   kubectl get hpa -n els-devops-system -w"
echo ""

echo "✨ Setup complete! Your application will auto-deploy from Git."
