# 📊 Monitoring Setup with Grafana, Loki, and Prometheus on Kind Kubernetes

This document outlines how to set up a full observability stack for a Vue.js frontend application deployed on a **Kind cluster** using **Docker Desktop** on macOS (Apple Silicon). It includes:

- Real-time **log aggregation** with **Loki + Promtail**
- **Grafana dashboards** for visualizing logs and metrics
- **Prometheus** for scraping metrics and feeding them into Grafana
- Dockerized frontend from Docker Hub

---

## 🧱 Architecture Overview

| Component   | Role                                 |
|-------------|--------------------------------------|
| **Vue App** | Deployed as a Docker image in Kind   |
| **Loki**    | Collects and stores logs             |
| **Promtail**| Reads logs from containers/nodes     |
| **Prometheus** | Scrapes metrics (including Loki) |
| **Grafana** | Visualizes logs and metrics          |

---

## 🚀 Deployment Stack

### 🔹 Vue.js Frontend App

- Built from image: `farhanmullick/buy-it-frontend:latest`
- Deployed with a Kubernetes `Deployment` and exposed via `NodePort` or `Ingress`
- Example port: `http://localhost:30080`

### 🔹 Kind Kubernetes Cluster

- Created with Docker Desktop on macOS
- Supports local port mapping, ingress controllers, and storage for development


## 📦 Tooling & Installation

### 1. Install Helm (if not yet)
```bash
brew install helm
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm upgrade --install loki grafana/loki-stack \
  --namespace monitoring \
  --create-namespace \
  --set grafana.enabled=true \
  --set promtail.enabled=true \
  --set loki.persistence.enabled=false \
  --set grafana.persistence.enabled=false
```
This installs:
	•	Grafana dashboard
	•	Loki log database
	•	Promtail log shipper for pods
	•	Default dashboards pre-loaded


### 2. Deploy Prometheus for Metric Collection
```bash
helm install prometheus prometheus-community/prometheus \
helm upgrade --install prometheus prometheus-community/prometheus \
  --namespace monitoring
```
This will deploy Prometheus to scrape metrics (including Loki’s internal metrics).

### 🛠 Configure Data Sources in Grafana

🔸 Loki (for Logs)
	•	URL: http://loki:3100

🔸 Prometheus (for Metrics)
	•	URL: http://localhost:9090

These services are internal to the Kubernetes cluster. Use port-forwarding or Ingress for external access.