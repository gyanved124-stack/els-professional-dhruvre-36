# GitHub Actions Workflows

Students copy workflow files here from the helper folders as they progress through levels.

## ⚠️ CRITICAL: One Workflow at a Time!

**Only keep ONE workflow file in this directory at any time!**

When moving to a new level, **DELETE the old workflow** before copying the new one.

## Structure

```
.github/workflows/
├── README.md              ← You are here
└── [ONE workflow file]    ← Level 1, 2, OR 3 (not all at once!)
```

### Level 1: `docker-build.yml`
### Level 2: `k8s-deploy.yml` (delete docker-build.yml first!)
### Level 3: `release.yml` (delete k8s-deploy.yml first!)

---

## Usage

### Level 1: Docker Build Workflow
Copy `level-1/helper/.github/workflows/docker-build.yml` to this directory.

This workflow automatically:
- Detects changes to client/server code
- Builds Docker images
- Pushes to Docker Hub
- Tags with version

### Setup Required:

Add these secrets in your GitHub repository (Settings → Secrets → Actions):
- `DOCKER_NAME` - Your Docker Hub username
- `DOCKER_TOKEN` - Your Docker Hub access token

## Progressive CI/CD

As you complete more levels, you can add more workflows:
- Level 2: K8s manifest validation
- Level 3: Helm chart linting and packaging
- Level 4: Monitoring config validation
- Level 5: ArgoCD sync automation

**Note:** With ArgoCD from Level 2 onwards, the workflows mainly validate manifests. ArgoCD handles the actual deployments automatically via GitOps!
