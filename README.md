# 🚀 DevOps System Workspace

Welcome to the main workspace! This is where the real work happens. You will use this directory to build, containerize, and deploy the application as you progress through the levels.

---

## 📂 Project Structure

```
devops-system/
├── development/           # 💻 Application Source Code
│   ├── client/            # React Frontend
│   └── server/            # Strapi Backend
│
├── devops/                # ☁️ Infrastructure Configuration
│   ├── docker/            # Level 1: Docker Compose files
│   ├── k8s/               # Level 2: Kubernetes Manifests
│   └── helm/              # Level 3: Helm Charts
│
└── .github/               # 🤖 CI/CD Automation
    └── workflows/         # GitHub Actions
```

---

## 🎓 How to Use This Workspace

This workspace evolves as you learn.

### Level 1: Docker Fundamentals
- **Goal:** Containerize the apps.
- **Where to work:**
  - `development/client/Dockerfile`
  - `development/server/Dockerfile`
  - `devops/docker/docker-compose.yml`
- **Guide:** [Level 1 README](../level-1/README.md)

### Level 2: Kubernetes Orchestration
- **Goal:** Deploy to a cluster.
- **Where to work:**
  - `devops/k8s/` (Create Deployment, Service, Ingress manifests)
- **Guide:** [Level 2 README](../level-2/README.md)

### Level 3: Helm & Advanced Deployment
- **Goal:** Package and automate.
- **Where to work:**
  - `devops/helm/` (Create Helm Charts)
  - `.github/workflows/` (Setup CI/CD)
- **Guide:** [Level 3 README](../level-3/README.md)

---

## 🛠️ Quick Setup

### 1. Install Dependencies
```bash
# Client
cd development/client
npm install

# Server
cd ../server
npm install
```

### 2. Run Locally
```bash
# Client
npm run dev

# Server
npm run develop
```

---

## 📚 Documentation

- [**Client Guide**](development/client/CLIENT_GUIDE.md) - Frontend setup & config.
- [**Server Guide**](development/server/SERVER_GUIDE.md) - Backend setup & config.
- [**Infrastructure Guide**](devops/INFRASTRUCTURE.md) - Infrastructure details.
- [**CI/CD Guide**](.github/CICD_WORKFLOWS.md) - Workflow automation.
