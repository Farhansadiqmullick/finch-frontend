# Docker Containerization Documentation

## Overview
This document explains the Docker setup for the Buy-It frontend application.

## Dockerfile Structure

### Multi-stage Build
1. **Builder Stage**:
   - Uses `node:18-alpine` as base
   - Installs all dependencies
   - Creates production build

2. **Production Stage**:
   - Uses `nginx:alpine` as base
   - Copies only built artifacts from builder
   - Configures Nginx server

### Key Optimizations
- **Small Base Images**: Uses Alpine Linux variants
- **Layer Caching**: Separate `COPY package*.json` for dependency caching
- **Minimal Final Image**: Only includes production artifacts
- **Security**: Non-root user in production (handled by nginx image)


## Building the Image

### Locally
```bash
docker buildx build --platform linux/amd64,linux/arm64 -t farhanmullick/buy-it-frontend:latest .
```
