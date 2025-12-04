# 🖥️ Server Application (Strapi)

The backend application built with Strapi (Headless CMS).

---

## 🚀 Quick Start

### 1. Install Dependencies
```bash
npm install
```

### 2. Run Development Server
```bash
npm run develop
```
Access at `http://localhost:1337`

### 3. Build for Production
```bash
npm run build
npm run start
```

---

## 🐳 Docker

### Build Image
```bash
docker build -t devops-server .
```

### Run Container
```bash
docker run -p 1337:1337 devops-server
```

---

## 🔧 Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `NODE_ENV` | Environment (development/production) | `development` |
| `DATABASE_CLIENT` | Database type | `sqlite` (local), `postgres` (prod) |
| `DATABASE_HOST` | Database host | `localhost` |
| `DATABASE_PORT` | Database port | `5432` |
| `DATABASE_NAME` | Database name | `strapi` |
| `DATABASE_USERNAME` | Database user | `strapi` |
| `DATABASE_PASSWORD` | Database password | `strapi` |
| `JWT_SECRET` | Auth secret | (Generated) |
| `API_TOKEN_SALT` | API token salt | (Generated) |

**How to change:**
1. Create a `.env` file in this directory.
2. Add variables (e.g., `DATABASE_CLIENT=postgres`).

**Production Note:**
In production (Docker/K8s), these should be injected via Environment Variables or Secrets.
