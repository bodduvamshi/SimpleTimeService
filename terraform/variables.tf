# variables.tf
variable "vpc_name" {
  default = "terraform-eks-vpc"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}
variable "ec2_key_name" {
  description = "EC2 Key Pair name for EKS nodes"
  type        = string
}
variable "cluster_name" {
  default = "terraform-eks-cluster"
}

variable "tags" {
  default = { "Project" = "Terraform-EKS" }
}

variable "aws_region" {
  default = "us-east-1"
}
