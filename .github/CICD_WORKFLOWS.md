# 🤖 CI/CD Automation

This directory contains GitHub Actions workflows for automating the build, test, and deployment processes.

---

## 📂 Workflows

### `workflows/docker-build.yml`
**Trigger:** Push to `main` or `develop`.
**Actions:**
1. Checks out code.
2. Builds Docker images for Client and Server.
3. Pushes images to Docker Hub.

### `workflows/k8s-deploy.yml` (Level 2+)
**Trigger:** Push to `main`.
**Actions:**
1. Builds & Pushes images.
2. Updates Kubernetes manifests (via Kustomize or Helm).
3. Commits changes to Git (GitOps).

---

## 🔐 Secrets Configuration

To make these workflows run, you must configure **Repository Secrets** in GitHub:

| Secret | Description |
|--------|-------------|
| `DOCKER_NAME` | Your Docker Hub username. |
| `DOCKER_TOKEN` | Your Docker Hub access token. |
| `PAT_TOKEN` | Personal Access Token (for GitOps commits). |

---

## 🚀 How to Enable

1. Go to your repository on GitHub.
2. Navigate to **Settings** > **Secrets and variables** > **Actions**.
3. Add the secrets listed above.
4. Push code to trigger the workflows!
