# GitHub Actions Workflows

Students copy workflow files here from the helper folders as they progress through levels.

## Structure

```
.github/workflows/
├── README.md              ← You are here
└── docker-build.yml       ← Copy from level-1/helper/.github/workflows/
```

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
