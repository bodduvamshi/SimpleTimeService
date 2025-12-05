
# Terraform EKS Container Deployment

## Overview
This repository contains Terraform scripts to provision an **AWS VPC**, **EKS Cluster**, and deploy a **sample web application** on Kubernetes.  
The deployment is automated via Terraform and requires minimal manual steps.

---

## Prerequisites

- Terraform >= 1.5.0
- AWS CLI configured with credentials
- Optional: EC2 instance in the same VPC if using private-only EKS endpoints

---

## AWS Authentication

Terraform requires access to your AWS account. Do **NOT commit AWS keys** to the repo.

### Options:

1. Configure AWS CLI:

```bash
aws configure


Or use environment variables:

export AWS_ACCESS_KEY_ID=<your-access-key>
export AWS_SECRET_ACCESS_KEY=<your-secret-key>
export AWS_DEFAULT_REGION=us-east-1

How to Deploy

Initialize Terraform:

terraform init


Validate configuration:

terraform validate


See the plan:

terraform plan


Apply the infrastructure and deploy application:

terraform apply


Only terraform plan and terraform apply are required. No manual steps needed if public endpoint is enabled.

EKS Cluster Endpoint Access

By default, this EKS cluster is configured with:

Public endpoint: enabled

Private endpoint: enabled

If the cluster is private-only:

You must run Terraform from an EC2 instance inside the same VPC.

Ensure the EC2 instance has port 443 access to the EKS API.

Verifying Deployment

Check cluster status:

aws eks describe-cluster --name terraform-eks-cluster --query 'cluster.status'


Check Kubernetes resources:

kubectl get pods -n app
kubectl get svc -n app
kubectl port-forward svc/my-app-lb 8080:80 -n app
curl http://localhost:8080/



The web application should be accessible via the LoadBalancer created in kubernetes_service.

Variables

All variables are defined in variables.tf with defaults provided in terraform.tfvars.
You can modify them as needed:

aws_region

cluster_name

vpc_cidr

subnet_ids

Node group sizes and instance types

Notes

Only Terraform commands (plan and apply) are needed to deploy everything.

Public endpoint is recommended for reviewers to avoid EKS API access issues.

Code follows Terraform best practices and is modularized.


