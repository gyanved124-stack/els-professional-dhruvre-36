# 💻 Client Application (React)

The frontend application built with React and Vite.

---

## 🚀 Quick Start

### 1. Install Dependencies
```bash
npm install
```

### 2. Run Development Server
```bash
npm run dev
```
Access at `http://localhost:5173`

### 3. Build for Production
```bash
npm run build
```

---

## 🐳 Docker

### Build Image
```bash
docker build -t devops-client .
```

### Run Container
```bash
docker run -p 80:80 devops-client
```

---

## 🔧 Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `VITE_API_URL` | URL of the backend API | `http://localhost:1337` |

**How to change:**
1. Create a `.env` file in this directory.
2. Add `VITE_API_URL=http://your-api-url`.

**Docker Build Argument:**
You can pass this during build:
```bash
docker build --build-arg VITE_API_URL=http://api.example.com -t devops-client .
```
