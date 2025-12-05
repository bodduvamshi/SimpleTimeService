# Terraform Infrastructure for SimpleTimeService (EKS Deployment)

This repository contains Terraform code to deploy the SimpleTimeService Docker container into a fully managed EKS (Elastic Kubernetes Service) cluster on AWS.

The infrastructure includes:

A VPC (2 public + 2 private subnets)

An EKS cluster running Kubernetes v1.34

A managed node group in private subnets

Kubernetes Deployment & Service for SimpleTimeService

A LoadBalancer to access the service publicly

1. Prerequisites

Before deploying, ensure you have the following installed on your EC2 instance or local machine:

Terraform
sudo yum install -y unzip
wget https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_amd64.zip -O terraform.zip
unzip terraform.zip
sudo mv terraform /usr/local/bin/
terraform -version

AWS CLI
sudo yum install awscli -y
aws --version

kubectl
curl -o kubectl https://amazon-eks.s3.amazonaws.com/1.34.0/2024-09-30/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client

2. AWS Authentication
Create an IAM User (if not already done)

In AWS Console:
IAM → Users → Create User

Enable Programmatic Access and download:

AWS Access Key ID

AWS Secret Access Key

Configure AWS CLI
aws configure


Enter:

AWS Access Key ID: <your-access-key>
AWS Secret Access Key: <your-secret>
Default region: us-east-1
Output: json

3. Repository Structure
SimpleTimeService/

│
├── app/                          # Application Code (Task 1)
│   ├── main.py                   # FastAPI / Flask service
│   ├── Dockerfile                # Docker build file
│   ├── requirements.txt          # Python dependencies
│   └── README.md                 # Task 1 README (Docker build + run instructions)
│
└── terraform/                    # Infrastructure Code (Task 2)
    ├── main.tf                   # Terraform providers & backend
    ├── vpc.tf                    # VPC, subnets, IGW, NAT
    ├── eks.tf                    # EKS cluster + nodegroup
    ├── k8s.tf                    # Kubernetes Deployment + Service
    ├── variables.tf              # Input variable definitions
    ├── terraform.tfvars          # Actual variable values (user-provided)
    ├── outputs.tf                # Output values (LB DNS, cluster details)
    └── README.md                 # Task 2 README (Terraform, AWS, EKS instructions)


4. Terraform Variable Configuration

Edit terraform.tfvars and set your values:

region                      = "us-east-1"
cluster_name                = "simpletime-eks"
eks_kubernetes_version      = "1.34"
container_image             = "vamshiboddu/simpletimeservice:latest"


👉 Replace <your-dockerhub-username> with your actual Docker Hub ID.

5. Deploying the Infrastructure

Move into terraform folder:

cd terraform/

Initialize Terraform
terraform init

Validate the configuration
terraform validate

Generate a Deployment Plan
terraform plan

Apply & Deploy Everything
terraform apply -auto-approve


Terraform will:

Create VPC

Create EKS cluster

Create NodeGroup

Deploy SimpleTimeService container

Create a LoadBalancer in public subnets

6. Get Kubernetes Access

After apply completes:

aws eks update-kubeconfig --region us-east-1 --name simpletime-eks


Verify connection:

kubectl get nodes
kubectl get pods
kubectl get svc

7. Accessing the Application

Find the LoadBalancer URL:

kubectl get svc simpletimeservice


Look for:

simpletimeservice   LoadBalancer   EXTERNAL-IP


Open in browser:

http://<EXTERNAL-IP>:8080/time


You should see the JSON time response.

8. Destroying All Resources

From the terraform folder:

terraform destroy -auto-approve


This will delete:

EKS Cluster

NodeGroup

VPC

Load Balancer

All networking resources

9. Notes 


Terraform state is stored locally on the EC2 instance.

Kubernetes resources (Deployment + Service) are automatically applied by Terraform after cluster creation.

Only terraform plan and terraform apply are required to deploy the entire infra (as per task requirement).