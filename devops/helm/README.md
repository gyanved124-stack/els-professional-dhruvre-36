# Helm Charts

This directory will contain your Helm charts for Level 3.

## 📂 Structure

```
helm/
├── client/           # React application chart
├── server/           # Strapi application chart
└── postgres/         # Database chart
```

## 🎓 How to Use

In Level 3, you will copy the charts from `level-3/helper/devops/helm/` into this directory.

Then you can install them using:
```bash
helm install client ./client
helm install server ./server
```
