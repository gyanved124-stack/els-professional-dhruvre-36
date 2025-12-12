# ArgoCD Deployment for Level 4

This directory contains the ArgoCD Application manifest for deploying the complete devops-system.

## What Gets Deployed

**Single Application**: `els-devops-system`
- ✅ Client (React frontend)
- ✅ Server (Strapi CMS with HPA autoscaling)
- ✅ Postgres (Database)

All deployed to `els-devops-system` namespace.

## How It Works (GitOps Flow)

```
GitHub CI/CD → Updates Helm values in Git → ArgoCD detects change → Auto-deploys to cluster
```

**Key Point**: The ArgoCD application does NOT hardcode image tags!

### CI/CD Pipeline Updates Git
When you push code to GitHub, the CI/CD pipeline:
1. Builds Docker images with new tags
2. Pushes images to Docker Hub
3. **Updates `values.yaml` in Git** with new image tags
4. ArgoCD detects the Git change and deploys automatically

### ArgoCD Reads from Git
ArgoCD continuously monitors your Git repository and deploys whatever is in:
- `devops-system/devops/helm/values.yaml`
- `devops-system/devops/helm/client/values.yaml`
- `devops-system/devops/helm/server/values.yaml`

**No manual updates needed!** ✨

## Configuration

### Required Updates (application.yaml)

Only 2 things to update:

1. **Repository URL** (line 10):
   ```yaml
   repoURL: https://github.com/dhruvre/your-repo.git  # Your actual repo
   ```

2. **Branch Name** (line 11):
   ```yaml
   targetRevision: main  # or master, develop, etc.
   ```

## Deployment

### Option 1: Use the Setup Script (Recommended)

```bash
cd /home/dhruv/work-dhruv/testing/system-workflow/level-4/helper/devops/argocd/level-4
./setup-argocd-app.sh
```

The script will:
- ✅ Verify ArgoCD is installed
- ✅ Check for placeholder values
- ✅ Apply the application
- ✅ Show next steps

### Option 2: Manual Apply

```bash
# Update application.yaml first!
nano application.yaml

# Apply to cluster
kubectl apply -f application.yaml
```

## Features

✅ **GitOps**: All changes via Git commits
✅ **Automatic Sync**: Changes to Git auto-deploy
✅ **Self-Healing**: Auto-corrects manual cluster changes  
✅ **Autoscaling**: Server HPA enabled (1-5 pods at 25% CPU)
✅ **Namespace Auto-Creation**: Creates `els-devops-system` if not exists

## CI/CD Integration

Your GitHub Actions workflow (`.github/workflows/`) should:

1. Build and push Docker images
2. Update Helm values with new tags:
   ```bash
   # Example: Update server image tag
   yq eval '.els-server.image.tag = "'$IMAGE_TAG'"' -i devops-system/devops/helm/values.yaml
   git add devops-system/devops/helm/values.yaml
   git commit -m "chore: update server image to $IMAGE_TAG"
   git push
   ```
3. ArgoCD will detect the commit and deploy automatically!

## Verify Deployment

```bash
# Check ArgoCD app status
kubectl get application -n argocd els-devops-system

# Watch sync progress
kubectl get application -n argocd els-devops-system -w

# Check deployed pods
kubectl get pods -n els-devops-system

# Verify HPA
kubectl get hpa -n els-devops-system
```

## Access ArgoCD UI

```bash
# Port-forward ArgoCD
kubectl port-forward svc/argocd-server -n argocd 8080:443

# Get admin password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# Open browser: https://localhost:8080
# Username: admin
# Password: <from command above>
```

## Troubleshooting

**App not syncing?**
- Check repository URL and branch name
- Verify Git credentials configured in ArgoCD
- Check ArgoCD logs: `kubectl logs -n argocd deployment/argocd-application-controller`

**Pods not starting?**
- Ensure CI/CD has pushed images to Docker Hub
- Verify image tags in Git match pushed images
- Check pod logs: `kubectl logs -n els-devops-system <pod-name>`

**Want to trigger manual sync?**
```bash
# Via CLI
argocd app sync els-devops-system

# Or use ArgoCD UI: Click "Sync" button
```
