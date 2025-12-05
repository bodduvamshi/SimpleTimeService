variable "aws_region" {
  default     = "us-east-1"
  description = "AWS region to deploy resources"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC CIDR block"
}

variable "public_subnets" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "Public subnet CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
  description = "Private subnet CIDRs"
}

variable "eks_cluster_name" {
  default     = "simpletime-eks"
  description = "EKS Cluster Name"
}

variable "eks_node_group_name" {
  default     = "simpletime-eks-nodes"
}

variable "container_image" {
  description = "Docker Hub image for the service"
  default     = "vamshiboddu/simpletimeservice:latest"
}
