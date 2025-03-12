# Infrastructure Automation with Terraform & Kubernetes

## Overview

This project demonstrates **Infrastructure as Code (IaC)** automation using **Terraform** to provision and manage a **Kubernetes cluster** running on **Kind**. The goal is to deploy **redundant web application servers** that serve a simple static page, dynamically directing traffic across available pods.

## Project Components

- **Kind Kubernetes Cluster**: A local Kubernetes cluster running inside Docker.
- **Terraform Configuration**: Automates the provisioning of Kubernetes resources.
- **Web Application Deployment**: Deploys N replicas of a web app that responds with its pod name/IP.
- **Service Exposure**:
  - **NodePort Service**: Exposes the web app on a fixed port (`32080`).


### How to Run
```hcl
terraform init
terraform apply
```

### Access the Web Application
```kubectl
kubectl port-dorward svc/web-app-service 8080:80
```
Since the web app runs on a container that runs Kind cluster, we should forward the traddic to our computer

Then open the browser and go to:
http://localhost:8080

### Cleanup
```hcl
terraform destroy
