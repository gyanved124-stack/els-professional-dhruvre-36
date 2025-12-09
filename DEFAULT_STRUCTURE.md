# DevOps System - Default Structure

This document shows the **expected folder structure** after copying files from all helper directories. Use this as a reference if you need to verify your setup or restore defaults.

---

## 📂 Complete Folder Structure

```
devops-system/
├── .github/
│   └── workflows/
│       ├── README.md
│       │
│       │   ⚠️ IMPORTANT: Keep only ONE workflow file at a time!
│       │
│       ├── docker-build.yml          # Level 1: From level-1/helper/
│       ├── k8s-deploy.yml            # Level 2: From level-2/helper/ (replaces docker-build.yml)
│       └── release.yml               # Level 3: From level-3/helper/ (replaces k8s-deploy.yml)
│
├── development/
│   ├── client/
│   │   ├── src/                      # React source code
│   │   ├── public/
│   │   ├── Dockerfile                # Level 1: From level-1/helper/
│   │   ├── .dockerignore             # Level 1: From level-1/helper/
│   │   ├── nginx.conf                # Level 1: From level-1/helper/
│   │   ├── package.json
│   │   └── ...
│   │
│   └── server/
│       ├── src/                      # Strapi source code
│       ├── config/
│       ├── Dockerfile                # Level 1: From level-1/helper/
│       ├── .dockerignore             # Level 1: From level-1/helper/
│       ├── entrypoint.sh             # Level 1: From level-1/helper/
│       ├── package.json
│       └── ...
│
├── devops/
│   ├── docker/
│   │   ├── docker-compose.yml        # Level 1: From level-1/helper/
│   │   └── README.md
│   │
│   ├── k8s/
│   │   ├── namespace.yaml            # Level 2: From level-2/helper/
│   │   ├── client.yaml               # Level 2: From level-2/helper/
│   │   ├── server.yaml               # Level 2: From level-2/helper/
│   │   ├── postgres.yaml             # Level 2: From level-2/helper/
│   │   ├── ingress.yaml              # Level 2: From level-2/helper/
│   │   ├── kustomization.yaml        # Level 2: From level-2/helper/
│   │   └── README.md
│   │
│   ├── helm/
│   │   ├── Chart.yaml                # Level 3: From level-3/helper/
│   │   ├── values.yaml               # Level 3: From level-3/helper/
│   │   ├── client/                   # Level 3: From level-3/helper/
│   │   ├── server/                   # Level 3: From level-3/helper/
│   │   ├── postgres/                 # Level 3: From level-3/helper/
│   │   └── README.md
│   │
│   ├── argocd/
│   │   ├── level-2/
│   │   │   └── application.yaml      # Level 2: From level-2/helper/
│   │   ├── level-3/
│   │   │   └── application.yaml      # Level 3: From level-3/helper/
│   │   ├── level-4/                  # Future
│   │   ├── level-5/                  # Future
│   │   └── README.md
│   │
│   ├── monitoring/                   # Future (Level 4+)
│   │   └── README.md
│   │
│   └── INFRASTRUCTURE.md
│
├── testing/
│   └── README.md                     # Level 4+
│
├── CONFIGURATION.md
├── SELECTIVE_BUILDS.md
└── README.md
```

---

## 🔄 How Files Get Copied

### Level 1 - Docker & Containerization
**Source:** `level-1/helper/`

**Copy to devops-system:**
```bash
# Dockerfiles and configs
level-1/helper/development/client/*    → development/client/
level-1/helper/development/server/*    → development/server/

# Docker Compose
level-1/helper/devops/docker/*         → devops/docker/

# GitHub Workflow
level-1/helper/.github/workflows/*     → .github/workflows/
```

> **⚠️ IMPORTANT**: Only keep `docker-build.yml` in workflows/ for Level 1

---

### Level 2 - Kubernetes & ArgoCD
**Source:** `level-2/helper/`

**Copy to devops-system:**
```bash
# Kubernetes manifests
level-2/helper/devops/k8s/*            → devops/k8s/

# ArgoCD config
level-2/helper/devops/argocd/level-2/* → devops/argocd/level-2/

# GitHub Workflow (REPLACE the Level 1 workflow)
level-2/helper/.github/workflows/*     → .github/workflows/
```

> **⚠️ IMPORTANT**: Delete `docker-build.yml` and only keep `k8s-deploy.yml` for Level 2

---

### Level 3 - Helm Charts & Semantic Versioning
**Source:** `level-3/helper/`

**Copy to devops-system:**
```bash
# Helm charts
level-3/helper/devops/helm/*           → devops/helm/

# ArgoCD config
level-3/helper/devops/argocd/level-3/* → devops/argocd/level-3/

# GitHub Workflow (REPLACE the Level 2 workflow)
level-3/helper/.github/workflows/*     → .github/workflows/
```

> **⚠️ IMPORTANT**: Delete `k8s-deploy.yml` and only keep `release.yml` for Level 3

---

## 🔧 Restoring Default Files

If you messed up a file, you can restore it from the helper directories:

### Restore Dockerfiles
```bash
# Client Dockerfile
cp level-1/helper/development/client/Dockerfile devops-system/development/client/

# Server Dockerfile
cp level-1/helper/development/server/Dockerfile devops-system/development/server/
```

### Restore Docker Compose
```bash
cp level-1/helper/devops/docker/docker-compose.yml devops-system/devops/docker/
```

### Restore Kubernetes Manifests
```bash
# Restore all K8s files
cp -r level-2/helper/devops/k8s/* devops-system/devops/k8s/
```

### Restore Helm Charts
```bash
# Restore all Helm charts
cp -r level-3/helper/devops/helm/* devops-system/devops/helm/
```

### Restore GitHub Workflows
```bash
# Level 1 workflow
cp level-1/helper/.github/workflows/docker-build.yml devops-system/.github/workflows/

# Level 2 workflow
cp level-2/helper/.github/workflows/k8s-deploy.yml devops-system/.github/workflows/

# Level 3 workflow
cp level-3/helper/.github/workflows/release.yml devops-system/.github/workflows/
```

---

## ✅ Verification Checklist

Use this to verify your setup is correct:

### After Level 1
- [ ] `development/client/Dockerfile` exists
- [ ] `development/server/Dockerfile` exists
- [ ] `devops/docker/docker-compose.yml` exists
- [ ] `.github/workflows/docker-build.yml` exists

### After Level 2
- [ ] All Level 1 files exist
- [ ] `devops/k8s/namespace.yaml` exists
- [ ] `devops/k8s/client.yaml` exists
- [ ] `devops/k8s/server.yaml` exists
- [ ] `devops/k8s/postgres.yaml` exists
- [ ] `devops/k8s/ingress.yaml` exists
- [ ] `devops/k8s/kustomization.yaml` exists
- [ ] `devops/argocd/level-2/application.yaml` exists
- [ ] `.github/workflows/k8s-deploy.yml` exists

### After Level 3
- [ ] All Level 1 & 2 files exist
- [ ] `devops/helm/Chart.yaml` exists
- [ ] `devops/helm/values.yaml` exists
- [ ] `devops/helm/client/` directory exists with chart files
- [ ] `devops/helm/server/` directory exists with chart files
- [ ] `devops/helm/postgres/` directory exists with chart files
- [ ] `devops/argocd/level-3/application.yaml` exists
- [ ] `.github/workflows/release.yml` exists

---

## 🚨 Common Issues & Solutions

### "I deleted important files!"
**Solution:** Copy from helper directories (see "Restoring Default Files" above)

### "My folder structure is different!"
**Solution:** Compare with this document and copy missing files from helpers

### "Files aren't in the right place!"
**Solution:** 
1. Check the "How Files Get Copied" section
2. Move files to correct locations
3. Or delete and re-copy from helpers

### "I mixed up Level 2 and Level 3 files!"
**Solution:**
1. Delete `devops/k8s/` and `devops/helm/` directories
2. Recreate empty directories
3. Copy files again from appropriate level helpers

---

## 📞 Getting Help

If you're still stuck:
1. **Check lesson guides** - Each lesson has detailed copy instructions
2. **Review helper READMEs** - Each helper directory has a README
3. **Start fresh** - Delete and recreate directories, then copy again

The helper directories are your **source of truth** - you can always restore from them!
