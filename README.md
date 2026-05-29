# 100 Days of MLOps @ KodeKloud Challenge

# 100 Days of MLOps

A public repository to document and share solutions for the **100 Days of MLOps** challenge by KodeKloud.

This challenge is a structured, hands-on program built for engineers who want to take their skills into the world of AI and production machine learning. It follows the same spirit as KodeKloud’s earlier community initiatives, including **100 Days of DevOps** launched in August 2025 and **100 Days of Cloud** launched in December 2025, which together have already attracted more than 44,000 engineers from 104 countries.[1]

The goal of this repository is simple: solve tasks consistently, document learning clearly, and build a visible portfolio of practical MLOps work.

## Why this repo exists

MLOps is one of the fastest-growing domains in tech, with the space projected to grow at nearly 37% year over year as companies work to operationalize AI at scale.[1]

While many models get built, far fewer make it to production, and even fewer stay reliable over time as data changes and model drift begins to affect outcomes.[1]

This repository is meant to serve as:

- A day-by-day log of challenge progress.
- A place to store notes, code, configurations, and lessons learned.
- A portfolio of hands-on MLOps work completed in real environments.
- A reference for tools, workflows, and production-minded practices.

## About the challenge

According to KodeKloud, the challenge includes 100 real-world tasks across 12 MLOps domains, 3 skill levels, and 1 end-to-end capstone project.[1]

The program is designed around practical execution rather than passive learning:

- No slides.
- No lectures.
- Real tasks in live environments.
- Clear objectives for each exercise.
- Automated validation to confirm successful completion.[1]

The challenge starts with project structure and environment setup, then progresses through data versioning, training, deployment, and monitoring.[1]

## Tools and technologies

The challenge introduces and applies real-world MLOps tools and platforms, including:[1]

- **DVC** for data versioning.
- **MLflow** for experiment tracking.
- **FastAPI** and **BentoML** for serving models as production APIs.
- **Evidently** for drift detection and monitoring.
- **CI/CD pipelines** for automation.
- **Argo**, **Prefect**, and **Kubernetes** for workflow orchestration and platform operations.[1]

These are positioned as real tools running on real infrastructure rather than simplified simulations.[1]

## Repository structure

```bash
.
├── README.md
├── day-001/
│   ├── notes.md
│   ├── solution/
│   └── artifacts/
├── day-002/
│   ├── notes.md
│   ├── solution/
│   └── artifacts/
├── docs/
├── scripts/
└── resources/
```

Suggested purpose of each folder:

- `day-xxx/` — Daily challenge solutions, notes, and output artifacts.
- `docs/` — Longer explanations, architecture notes, diagrams, and summaries.
- `scripts/` — Helper scripts for setup, automation, or repeated tasks.
- `resources/` — Reference materials, templates, and reusable snippets.

## Progress tracker

Use this section to track daily consistency and completed tasks.

| Day | Topic | Status | Notes |
|-----|-------|--------|-------|
| 001 | Day 1: Create a Python Virtual Environment for ML | ☑ | |
| 002 | Day 2: Set Up and Configure Jupyter Notebook Server | ☑ | |
| 003 | Day 3: Fix a Broken uv Lockfile Specification | ☑ | |
| 004 | Day 4: Create a Standard ML Project Structure | ☑ | | 
| 005 | Day 5: Create a Makefile for ML Workflow Automation | ☑ | |
| 006 | Day 6: Set Up Code Quality Tools for ML Code | ☑ | |
| 007 | Day 7: Package an ML Project as Installable Python Package | ☑ | |
| 008 | Day 8: Configure Pre-Commit Hooks for ML Repository | ☑ | |
| 009 | Day 9: Create a Custom ML Project Template with Cookiecutter | ☐ | |
| 010 | Day 10: Install and Initialize DVC in an ML Project | ☐ | |
| 011 | Day 11: Track a Dataset with DVC | ☐ | |
| 012 | Day 12: Configure a DVC Remote Storage | ☐ | |
| 013 | Day 13: Pull DVC-Tracked Data from Remote | ☐ | |
| 014 | Day 14: Create a DVC Pipeline for Data Processing | ☐ | |
| 015 | Day 15: Parameterize a DVC Pipeline | ☐ | |
| 016 | Day 16: Track ML Metrics with DVC | ☐ | |
| 017 | Day 17: Run and Compare DVC Experiments | ☐ | |
| 018 | Day 18: Version Datasets and Models Across Git Branches | ☐ | |
| 019 | Day 19: Build Complete DVC ML Pipeline with Remote Storage and Experiments | ☐ | |
| 020 | Day 20: Install and Start the MLflow Tracking Server | ☐ | |
| 021 | Day 21: Log an ML Experiment to MLflow | ☐ | |
| 022 | Day 22: Create and Organize MLflow Experiments | ☐ | |
| 023 | Day 23: Search and Query MLflow Runs | ☐ | |
| 024 | Day 24: Enable MLflow Autologging | ☐ | |
| 025 | Day 25: Register, Version, and Manage Model Lifecycle | ☐ | |
| 026 | Day 26: Compare Model Runs and Select the Best | ☐ | |
| 027 | Day 27: Load Model from Registry with Custom Preprocessing | ☐ | |
| 028 | Day 28: Fix a Broken MLflow Project and Re-Run It | ☐ | |
| 029 | Day 29: Configure MLflow with Remote Tracking Server and Artifact Store | ☐ | |
| 030 | Day 30: End-to-End MLflow Lifecycle: Train, Register, Serve, Monitor | ☐ | |
| 031 | Day 31: Train a Scikit-Learn Model with Reproducible Script | ☐ | |
| 032 | Day 32: Manage Training Configuration with YAML | ☐ | |
| 033 | Day 33: Evaluate a Trained Model and Generate Classification Report | ☐ | |
| 034 | Day 34: Implement Cross-Validation for Model Selection | ☐ | |
| 035 | Day 35: Hyperparameter Tuning with Optuna | ☐ | |
| 036 | Day 36: Automated Model Selection with FLAML AutoML | ☐ | |
| 037 | Day 37: Distributed Model Training with Joblib Parallelization | ☐ | |
| 038 | Day 38: Build Modular Training Pipeline with Config-Driven Stages | ☐ | |
| 039 | Day 39: Train a PyTorch Model with GPU Support and Checkpointing | ☐ | |
| 040 | Day 40: Production Training System: Tracking, Tuning, and Model Selection | ☐ | |
| 041 | Day 41: Install and Initialize a Feast Feature Store | ☐ | |
| 042 | Day 42: Define Feature Views in Feast | ☐ | |
| 043 | Day 43: Materialize Features to the Online Store | ☐ | |
| 044 | Day 44: Store MLflow's Admin Password in HashiCorp Vault | ☐ | |
| 045 | Day 45: Fix a Broken Vault KV Policy for the MLflow Reader | ☐ | |
| 046 | Day 46: Author Data-Quality Expectations with Great Expectations | ☐ | |
| 047 | Day 47: Debug a Failing Great Expectations Checkpoint | ☐ | |
| 048 | Day 48: Publish Great Expectations Data Docs as a CI Artefact | ☐ | |
| 049 | Day 49: Secrets + Data-Quality Integration Capstone | ☐ | |
| 050 | Day 50: Create Docker Image for ML Training Environment | ☐ | |
| 051 | Day 51: Create Multi-Stage Docker Build for ML Serving | ☐ | |
| 052 | Day 52: Set Up Local ML Dev Environment with Docker Compose | ☐ | |
| 053 | Day 53: Create GPU-Enabled Docker Image for Deep Learning | ☐ | |
| 054 | Day 54: Push ML Model Images to Container Registry | ☐ | |
| 055 | Day 55: Add Health Checks and Graceful Shutdown to ML Containers | ☐ | |
| 056 | Day 56: Automate ML Docker Image Building in CI Pipeline | ☐ | |
| 057 | Day 57: Serve an ML Model with Flask | ☐ | |
| 058 | Day 58: Serve an ML Model with FastAPI | ☐ | |
| 059 | Day 59: Run Batch Predictions on a Dataset | ☐ | |
| 060 | Day 60: Package a Model as a BentoML Service | ☐ | |
| 061 | Day 61: Containerize an ML Model API with Docker | ☐ | |
| 062 | Day 62: Implement A/B Testing for Model Deployment | ☐ | |
| 063 | Day 63: Implement Async Batch Prediction with Task Queue | ☐ | |
| 064 | Day 64: Serve Multiple Models Behind Unified API Gateway | ☐ | |
| 065 | Day 65: Implement Canary Deployment for Model Updates | ☐ | |
| 066 | Day 66: Production Model Serving with Docker Compose | ☐ | |
| 067 | Day 67: Add Prometheus as a Grafana Data Source | ☐ | |
| 068 | Day 68: Generate a Model Performance Report | ☐ | |
| 069 | Day 69: Generate a Data Quality Report | ☐ | |
| 070 | Day 70: Create Automated Tests with Evidently Test Suites | ☐ | |
| 071 | Day 71: Set Up Evidently Monitoring Dashboard | ☐ | |
| 072 | Day 72: Set Up Drift Detection Alerts | ☐ | |
| 073 | Day 73: Automatic Retraining Triggered by Drift Detection | ☐ | |
| 074 | Day 74: Monitor Custom Business Metrics Alongside ML Metrics | ☐ | |
| 075 | Day 75: End-to-End Monitoring: Prometheus, Grafana, Evidently | ☐ | |
| 076 | Day 76: Create CI Pipeline for ML Code Linting and Testing | ☐ | |
| 077 | Day 77: Add Data Validation to CI Pipeline | ☐ | |
| 078 | Day 78: Add Model Validation Tests to CI | ☐ | |
| 079 | Day 79: Generate Model Performance Reports in CI with CML | ☐ | |
| 080 | Day 80: Automate Model Registration in CI/CD | ☐ | |
| 081 | Day 81: Automate Model Deployment with CD Pipeline | ☐ | |
| 082 | Day 82: End-to-End ML CI/CD Pipeline | ☐ | |
| 083 | Day 83: Automated Model Rollback with Health Checks | ☐ | |
| 084 | Day 84: Production ML CI/CD with Multi-Environment Promotion | ☐ | |
| 085 | Day 85: Install Argo Workflows on Kubernetes | ☐ | |
| 086 | Day 86: Create a Basic ML Training Workflow in Argo | ☐ | |
| 087 | Day 87: Pass Data Between Argo Steps with Output Parameters and Branching | ☐ | |
| 088 | Day 88: Create an ML Pipeline with Prefect | ☐ | |
| 089 | Day 89: Parallel Model Training with Argo withItems Fan-Out | ☐ | |
| 090 | Day 90: Automated Retraining with Argo CronWorkflow | ☐ | |
| 091 | Day 91: Production ML Pipeline: Argo Workflows + MLflow on Kubernetes | ☐ | |
| 092 | Day 92: Deploy an ML Model on Kubernetes | ☐ | |
| 093 | Day 93: Configure HPA for ML Serving Deployment | ☐ | |
| 094 | Day 94: Deploy a Model with KServe InferenceService | ☐ | |
| 095 | Day 95: Kubeflow Pipelines - Install and Run a Basic KFP Pipeline | ☐ | |
| 096 | Day 96: GitOps Model Deployment with ArgoCD | ☐ | |
| 097 | Day 97: Capstone (1/4): End-to-End ML System - Train, Register, Serve | ☐ | |
| 098 | Day 98: Capstone (2/4): Monitoring and Automated Retraining | ☐ | |
| 099 | Day 99: Capstone (3/4): Orchestrate the Full MLOps Loop with Argo Workflow | ☐ | |
| 100 | Day 100: Capstone (4/4): Close the Loop with Prometheus + Grafana Observability | ☐ | |

## Learning goals

This repository is focused on building practical skill in areas such as:

- Structuring ML projects correctly.
- Versioning datasets and pipelines.
- Tracking experiments and model iterations.
- Serving models through APIs.
- Monitoring production systems for drift and quality issues.
- Automating delivery with CI/CD.
- Running MLOps workflows on Kubernetes-oriented platforms.[1]

By the end of the challenge, the expected outcome is not just theoretical familiarity with MLOps, but hands-on experience using tools and workflows similar to those used by production teams.[1]

## How to use this repository

1. Create one folder per day or challenge task.
2. Add a short `notes.md` file explaining the problem, approach, and lessons learned.
3. Store code, configs, manifests, and pipeline definitions inside the corresponding day folder.
4. Keep commits small and consistent to show progress over time.
5. Update the progress tracker after every completed task.

## Portfolio value

KodeKloud states that learners who complete the challenge will build a portfolio of real work and earn a badge backed by 100 completed tasks.[1]

That makes this repository useful not only as a learning log, but also as a proof-of-work artifact for recruiters, collaborators, clients, or future consulting opportunities.

## Notes

- The challenge is described as **100% free**.
- KodeKloud states that environments are provisioned for learners, so there is no cloud bill or local setup requirement to get started.[1]

## Attribution

Challenge source: KodeKloud, *100 Days of MLOps Challenge is LIVE [Free Program]*.[1]

***

### Citation source

[1] Based on the transcript and description of the KodeKloud video page: “[100 Days of MLOps Challenge is LIVE [Free Program]](https://www.youtube.com/watch?v=EKhcRdjAKvA)”. 

