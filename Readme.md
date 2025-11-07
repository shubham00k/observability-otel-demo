# 🚀 Observability Stack using OpenTelemetry, Helm & Kubernetes

## 📖 Overview
This project demonstrates a complete **Observability Stack** deployed on **Kubernetes** using **Helm**.  
It implements distributed tracing, metrics, and visualization using **OpenTelemetry**, **Grafana**, and **Jaeger**.

The goal of this project is to understand and implement **end-to-end observability** — tracing requests across microservices, monitoring metrics, and visualizing system health in real time.

---

## 🧩 Stack Components

| Tool | Purpose |
|------|----------|
| **OpenTelemetry Collector** | Collects telemetry (metrics, traces, logs) from app services |
| **Jaeger** | Distributed tracing visualization |
| **Prometheus** | Metrics scraping & storage |
| **Grafana** | Visualization dashboard for metrics |
| **Helm** | Deployment & version management on Kubernetes |
| **Kubernetes** | Container orchestration platform |

---

## ⚙️ Architecture
```plaintext
[Microservices / Demo App]
        ↓
 [OpenTelemetry Collector]
        ↓
 ┌───────────────────────────┐
 │         Backends          │
 │  • Jaeger (Traces)        │
 │  • Prometheus (Metrics)   │
 └───────────────────────────┘
        ↓
     Grafana UI
🛠 Deployment Setup


🛠 Deployment Setup
🔹 Prerequisites

Kubernetes cluster (Minikube / Kind / EKS)

Helm installed

kubectl configured

Ports open for local access (e.g. 3000, 16686)

🔹 Step 1: Clone the Repository
git clone https://github.com/<your-github-username>/observability-otel-demo.git
cd observability-otel-demo

🔹 Step 2: Create Namespace
kubectl create namespace observability

🔹 Step 3: Deploy using Helm
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update

helm install otel-demo open-telemetry/opentelemetry-demo -n observability


This installs the complete OpenTelemetry Demo application along with its dependencies and collector.

🔹 Step 4: Verify Installation
helm list -n observability
kubectl get all -n observability


Make sure all pods are in Running state before proceeding.

🔹 Step 5: Access Jaeger UI

Jaeger shows distributed traces across services.

kubectl port-forward svc/jaeger 16686:16686 -n observability


Open browser → http://localhost:16686

You can now:

Track request paths between services

Measure latency & trace spans

Identify slow services or errors

🔹 Step 6: Access Grafana UI

Grafana visualizes metrics collected by Prometheus.

kubectl port-forward svc/grafana 3000:3000 -n observability


Open browser → http://localhost:3000

Default login (if not changed):

User: admin

Password: prom-operator

You can:

View CPU, memory, network metrics

Observe request rates, error counts, and latency

Correlate Grafana panels with Jaeger traces

📊 Key Observability Features

Distributed Tracing: See the full journey of a request through microservices.

Metrics Dashboard: System-level insights for services & cluster health.

Correlation: Link traces → metrics → logs for faster debugging.

Scalable Deployment: Easily reproducible using Helm.

K8s Native Setup: All deployed in Kubernetes for real-world DevOps workflows.

🧹 Cleanup

To delete everything created by Helm:

helm uninstall otel-demo -n observability
kubectl delete namespace observability


💡 If PVCs (PersistentVolumeClaims) remain:

kubectl delete pvc --all -n observability

📂 Folder Structure
observability-otel-demo/
│
├── README.md
├── values.yaml               # Custom Helm values (if modified)
├── collector-config.yaml     # OpenTelemetry collector config
└── manifests/                # Additional manifests if any

🧠 Learnings

How to deploy OpenTelemetry Demo via Helm on K8s

How to access & use Jaeger for tracing

How to visualize metrics using Grafana

Understanding Helm release management in a production-like setup