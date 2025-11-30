# Kubernetes Manifests

This directory will contain your Kubernetes manifests for Level 2.

## 📂 Structure

```
k8s/
├── namespace.yaml    # Namespace definition
├── postgres.yaml     # Database StatefulSet
├── server.yaml       # Strapi Deployment
├── client.yaml       # React Deployment
└── ingress.yaml      # Ingress rules
```

## 🎓 How to Use

In Level 2, you will copy the manifests from `level-2/helper/devops/k8s/` into this directory.

Then you can deploy them using:
```bash
kubectl apply -f .
```
