# ☁️ DevOps Infrastructure

This directory contains the infrastructure configuration for the system, organized by complexity level.

---

## 📂 Structure

### 🐳 `docker/` (Level 1)
Contains **Docker Compose** files for running the application locally or on a single server.
- **Use for:** Local development, simple deployments.
- **Key Files:** `docker-compose.yml`

### ☸️ `k8s/` (Level 2)
Contains **Kubernetes Manifests** (YAML) for deploying to a cluster.
- **Use for:** Production, scaling, high availability.
- **Key Files:** `deployment.yaml`, `service.yaml`, `ingress.yaml`.
- **Tools:** `kubectl`, `kustomize`.

### 📦 `helm/` (Level 3)
Contains **Helm Charts** for packaging the application.
- **Use for:** Advanced deployment, versioning, complex dependencies.
- **Key Files:** `Chart.yaml`, `values.yaml`, `templates/`.
- **Tools:** `helm`.

---

## 🔄 Workflow

1. **Start with Docker:** Get the app running in containers.
2. **Move to K8s:** Write manifests to orchestrate those containers.
3. **Package with Helm:** Template your manifests for reusability.
