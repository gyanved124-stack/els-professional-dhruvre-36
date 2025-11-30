# ArgoCD Configurations

This directory contains ArgoCD configurations for all levels (2-5).

Students copy the appropriate level configurations here as they progress through the curriculum.

## Structure

```
argocd/
├── level-2/           # Basic Application (K8s manifests)
│   └── application.yaml
├── level-3/           # Helm Application
│   └── application.yaml
├── level-4/           # ApplicationSet (multi-environment)
│   └── applicationset.yaml
└── level-5/           # Advanced (Projects, App-of-Apps)
    ├── project.yaml
    ├── root-app.yaml
    └── apps/
```

## Usage

Copy the respective level folder from `level-X/helper/devops/argocd/level-X/` to this directory.
