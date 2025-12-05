variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "eks_cluster_name" {
  type    = string
  default = "simpletime-eks"
}

variable "eks_kubernetes_version" {
  type    = string
  default = "1.34"
}

variable "container_image" {
  type        = string
  description = "Docker Hub image"
}

variable "node_instance_type" {
  type    = string
  default = "t3.medium"
}

variable "node_desired" {
  type    = number
  default = 1
}
