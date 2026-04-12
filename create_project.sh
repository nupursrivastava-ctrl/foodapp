#!/usr/bin/env bash
set -e
echo "Creating project files..."

Write root package.json
cat > package.json <<'JSON'
{
  "name": "food-calorie-webapp",
  "version": "0.1.0",
  "private": true,
  "workspaces": [
    "frontend",
    "backend"
  ],
  "scripts": {
    "dev": "concurrently \"yarn workspace frontend dev\" \"yarn workspace backend dev\"",
    "start": "yarn workspace frontend start & yarn workspace backend start",
    "build": "yarn workspace frontend build && yarn workspace backend build",
    "lint": "yarn workspace frontend lint && yarn workspace backend lint"
  },
  "devDependencies": {
    "concurrently": "^8.0.0"
  }
}
JSON

cat > .gitignore <<'GITIGNORE'
node_modules
.env
.env.local
/.venv
/dist
/.cache
/.next
*.pyc
pycache/
.DS_Store
GITIGNORE

cat > .env.example <<'ENV'
NEXT_PUBLIC_API_URL=https://api.example.com
NEXT_PUBLIC_DISABLE_TELEMETRY=true
NEXTAUTH_URL=https://app.example.com
NEXTAUTH_SECRET=changeme

BACKEND_HOST=0.0.0.0
BACKEND_PORT=8000
HF_API_KEY=your_huggingface_api_key
REPLICATE_API_TOKEN=your_replicate_api_token
S3_ENDPOINT=
S3_ACCESS_KEY=
S3_SECRET_KEY=
S3_BUCKET=
USDA_API_KEY=your_usda_api_key

DATABASE_URL=sqlite:///./data.db
ENV

cat > README.md <<'MD'

Food Photo Calorie Tracker — Web PWA (MVP)
This repo contains a Next.js frontend and FastAPI backend.

Quick local run:

Install dependencies: yarn
Start dev: yarn dev
Frontend at http://localhost:3000, backend at http://localhost:8000 MD
Minimal frontend scaffold (will be extended later)
mkdir -p frontend/pages frontend/components frontend/lib frontend/styles frontend/public

cat > frontend/package.json <<'JSON'
{
  "name": "frontend",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev -p 3000",
    "build": "next build",
    "start": "next start -p 3000"
  },
  "dependencies": {
    "next": "13.4.7",
    "react": "18.2.0",
    "react-dom": "18.2.0",
    "axios": "^1.4.0"
  }
}
JSON

cat > frontend/pages/index.tsx <<'TS'
export default function Home() {
  return (
    <div style={{padding:20,fontFamily:"sans-serif"}}>
      

Food Photo Calorie Tracker
Frontend scaffold created. Finish deployment steps in the guide.

) } TS
Minimal backend scaffold
mkdir -p backend/app
cat > backend/pyproject.toml <<'TOML'
[tool.poetry]
name = "backend"
version = "0.1.0"
description = "FastAPI backend"
authors = ["You you@example.com"]

[tool.poetry.dependencies]
python = "^3.10"
fastapi = "^0.97.0"
uvicorn = {extras = ["standard"], version = "^0.22.0"
}
TOML

cat > backend/app/main.py <<'PY'
from fastapi import FastAPI
app = FastAPI()
@app.get("/ping")
def ping():
    return {"ok": True}
PY

echo "Script created."
