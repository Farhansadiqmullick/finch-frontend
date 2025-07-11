# CI/CD Pipeline Documentation

## Overview
This document describes the CI/CD pipeline setup for the Buy-It frontend application using GitHub Actions.

## Pipeline Architecture

### Tools
- **CI/CD Tool**: GitHub Actions
- **Package Registry**: npm (for dependencies)
- **Container Registry**: Docker Hub (for Docker images)

### Pipeline Stages

1. **Linting and Code Quality Check**
   - Runs ESLint based on project configuration
   - Ensures code follows consistent style and best practices
   - Triggered on every push and pull request

2. **Build Stage**
   - Installs all dependencies
   - Creates production-ready build artifacts
   - Only runs after successful linting
   - Stores build output as workflow artifact

3. **Docker Image Build & Push (Phase 2)**
   - Builds multi-architecture Docker images (amd64 + arm64)
   - Pushes images to Docker Hub
   - Only triggers on pushes to main branch or version tags

## Pipeline Triggers

- **Automatic Triggers**:
  - Push to `main` branch
  - Pull requests targeting `main`
  - Git tags matching `v*.*.*` pattern (for Docker builds)

- **Manual Triggers**:
  Available through GitHub Actions UI by clicking "Run workflow"

## Monitoring

1. **Pipeline Status**:
   - Visible in GitHub repository's "Actions" tab
   - Status badges can be added to README.md

2. **Notifications**:
   - Configured through GitHub repository settings
   - Can send emails or Slack notifications on failure

3. **Artifacts**:
   - Production build artifacts available for download
   - Docker images available in Docker Hub

## Access Requirements

- **GitHub**:
  - Write access to repository to trigger manual builds
  - Read access to view pipeline status

- **Docker Hub**:
  - Credentials stored as GitHub secrets
  - Proper permissions to push to container registry