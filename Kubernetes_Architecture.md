
## Kubernetes Architecure Documentation

## 🧱 Architecture Overview

- **Deployment Type**: Stateless, replicated frontend app.
- **Cluster**: Local Kubernetes (Kind or Docker Desktop)
- **Pod Count**: 2 replicas for high availability
- **Load Balancing**: Kubernetes `Service` (type: NodePort)
- **Port Exposure**: Accessible via NodePort on host machine (`localhost:30080`)

---

## 📊 Resource Allocation

| Resource | Value |
|---------|-------|
| **CPU Limit** | `500m` (half a core per pod) |
| **CPU Request** | `250m` |
| **Memory Limit** | `256Mi` |
| **Memory Request** | `128Mi` |

This ensures efficient usage of cluster resources while maintaining performance.

---

## 🔁 Scaling Strategy

- **Initial Replicas**: 2
- **Manual Scaling**: via `kubectl scale`
- **Future-Proofing**: Can be extended with `HorizontalPodAutoscaler` for CPU-based scaling.

```bash
kubectl scale deployment buy-it-frontend --replicas=4
```