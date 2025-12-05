# SimpleTimeService - Full-Stack Cloud Deployment

This repository contains the **SimpleTimeService** microservice and Terraform code to deploy it on **AWS EKS**.  

The project is structured into two main folders:

- `app/` – Contains the microservice code, Dockerfile, and instructions to build and run the container.
- `terraform/` – Contains Terraform code to provision AWS infrastructure, including VPC, EKS cluster, node groups, and Kubernetes deployment/service for SimpleTimeService.

> **Important:** Please read the folder-level READMEs before executing anything.

---


- Create a **CI/CD pipeline** (GitHub Actions) to:
  - Build the Docker container
  - Push to DockerHub
  - Apply Terraform automatically


So yes — that workflow file is also created for CI/CD implementation for that optional part but make sure to add secrets before executing.
Also the backend.tf is lso created in the directory terraform which is related to optional task.