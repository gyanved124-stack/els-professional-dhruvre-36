# 🐳 Docker Compose Configuration

This directory contains Docker Compose files for **Level 1** deployment.

---

## 📄 What's in This Directory

### `docker-compose.yml`
The main Docker Compose configuration that orchestrates:
- **Client** (React Frontend)
- **Server** (Strapi Backend)
- **Postgres** (Database)

---

## 🎯 Purpose

Docker Compose allows you to:
- Run all services with **one command** (`docker compose up`)
- Define service dependencies (server waits for database)
- Configure networking between containers
- Set environment variables
- Mount volumes for data persistence

---

## 🚀 Usage

### Start All Services
```bash
cd devops-system/devops/docker
docker compose up
```

### Start in Background
```bash
docker compose up -d
```

### Stop All Services
```bash
docker compose down
```

### View Logs
```bash
docker compose logs -f
```

### Rebuild Images
```bash
docker compose up --build
```

---

## 📦 Services Defined

### 1. Client (React Frontend)
- **Image**: Built from `../../development/client/Dockerfile`
- **Port**: 3000
- **Depends on**: Server

### 2. Server (Strapi Backend)
- **Image**: Built from `../../development/server/Dockerfile`
- **Port**: 1337
- **Depends on**: Postgres
- **Environment**: Connected to database

### 3. Postgres (Database)
- **Image**: `postgres:15-alpine`
- **Port**: 5432
- **Volume**: Data persists in `postgres-data` volume

---

## 🔧 Configuration

### Environment Variables
Defined in `docker-compose.yml`:
- `DATABASE_HOST=postgres`
- `DATABASE_PORT=5432`
- `DATABASE_NAME=strapi`
- `DATABASE_USERNAME=strapi`
- `DATABASE_PASSWORD=strapi`

### Networks
All services run on the `devops-network` to communicate with each other.

---

## 📚 Learning Objectives (Level 1)

By using this file, you learn:
- ✅ How to orchestrate multiple containers
- ✅ Service dependencies (`depends_on`)
- ✅ Container networking
- ✅ Volume management for data persistence
- ✅ Environment variable configuration
- ✅ Port mapping between host and containers

---

## 🔄 From Helper Directory

This file was copied from:
```
level-1/helper/devops/docker/docker-compose.yml
```

To restore the default:
```bash
cp level-1/helper/devops/docker/docker-compose.yml devops-system/devops/docker/
```

---

## 🚀 Next Steps

After mastering Docker Compose (Level 1), you'll move to:
- **Level 2**: Kubernetes for production-grade orchestration
- **Level 3**: Helm charts for templated deployments

For now, focus on understanding how Docker Compose makes multi-container apps easy!
