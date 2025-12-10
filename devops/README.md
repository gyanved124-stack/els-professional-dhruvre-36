# DevOps System - Production Configuration

This folder contains production-ready DevOps configurations used across all levels. Students learn concepts in `level-X/` folders and apply them here.

## Folder Structure

```
devops/
├── argocd/          # GitOps deployment configurations
├── helm/            # Kubernetes Helm charts
│   ├── client/      # React frontend chart
│   ├── server/      # Strapi backend chart
│   └── postgres/    # PostgreSQL database chart
└── k8s/             # Raw Kubernetes manifests (Level 2)
```

## Usage

### Level 2: Kubernetes Basics
Uses `k8s/` folder with raw YAML manifests.

### Level 3: Helm & CI/CD
Uses `helm/` folder with Helm charts.

### Level 4: Monitoring & Performance
Uses `helm/` folder + adds monitoring stack (Grafana, Prometheus).

### Level 5: GitOps with ArgoCD
Uses `argocd/` folder for continuous deployment.

## Notes

- All learning guides are in `level-X/` folders
- This folder contains only working configuration files
- Configurations are progressively enhanced across levels
- Secrets should be externalized (see `.env` files)

## Service Names

All services use `els-` prefix:
- `els-client` - Frontend
- `els-server` - Backend API
- `els-postgres` - Database
