# DevOps System - Student Workspace

This is your **main working directory**. You'll copy files here from the helper folders as you progress through the levels.

## 📂 Initial Structure (Empty)

```
devops-system/
├── README.md                    ← You are here
├── .github/workflows/           ← GitHub Actions (copy from level helpers)
├── development/
│   ├── client/                  ← React application code (already exists)
│   │   ├── src/
│   │   ├── package.json
│   │   ├── Dockerfile           ← Copy from level-1/helper
│   │   └── nginx.conf          ← Copy from level-1/helper
│   └── server/                  ← Strapi application code (already exists)
│       ├── src/
│       ├── package.json
│       ├── Dockerfile           ← Copy from level-1/helper
│       └── entrypoint.sh        ← Copy from level-1/helper
└── devops/                      ← All DevOps configs go here
    ├── docker/                  ← Level 1: Copy from level-1/helper
    │   └── docker-compose.yml
    ├── k8s/                     ← Level 2: Copy from level-2/helper
    │   ├── namespace.yaml
    │   ├── postgres.yaml
    │   ├── server.yaml
    │   ├── client.yaml
    │   └── ingress.yaml
    ├── helm/                    ← Level 3: Copy from level-3/helper
    │   ├── client/
    │   ├── server/
    │   └── postgres/
    ├── monitoring/              ← Level 4: Copy from level-4/helper
    │   ├── prometheus/
    │   └── grafana/
    └── argocd/                  ← Levels 2-5: Copy respective argocd configs
        ├── level-2/
        ├── level-3/
        ├── level-4/
        └── level-5/
```

## 🎓 How to Use This Directory

1. **Level 1 (Docker):**
   - Copy Dockerfiles to `development/client/` and `development/server/`
   - Copy docker-compose.yml to `devops/docker/`
   - Test: `docker compose -f devops/docker/docker-compose.yml up`

2. **Level 2 (Kubernetes + ArgoCD Basics):**
   - Copy K8s manifests to `devops/k8s/`
   - Copy ArgoCD Application to `devops/argocd/level-2/`
   - Test: `kubectl apply -f devops/k8s/` OR `kubectl apply -f devops/argocd/level-2/`

3. **Level 3 (Helm + ArgoCD with Helm):**
   - Copy Helm charts to `devops/helm/`
   - Copy ArgoCD Application to `devops/argocd/level-3/`
   - Test: `helm install` OR `kubectl apply -f devops/argocd/level-3/`

4. **Level 4 (Monitoring + ApplicationSet):**
   - Copy monitoring configs to `devops/monitoring/`
   - Copy ApplicationSet to `devops/argocd/level-4/`
   - Test: `kubectl apply -f devops/argocd/level-4/`

5. **Level 5 (Advanced ArgoCD):**
   - Copy Project and App-of-Apps to `devops/argocd/level-5/`
   - Test: `kubectl apply -f devops/argocd/level-5/`

## 🚀 Push to GitHub

After completing each level, push this directory to your GitHub repository:

```bash
git add .
git commit -m "Completed Level X"
git push origin main
```

ArgoCD will automatically detect changes and sync your applications!

## 📝 Important Notes

- **This directory is YOUR workspace** - the helpers are just reference examples
- **Experiment and modify** - break things and learn!
- **Commit often** - track your progress with Git
- **ArgoCD watches this repo** - your commits trigger deployments
