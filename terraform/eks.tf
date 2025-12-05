module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.10.1"

  # Cluster name and Kubernetes version
  name    = var.eks_cluster_name
  version = var.eks_kubernetes_version

  # VPC and subnets
  vpc_id     = module.vpc.vpc_id
  subnets    = module.vpc.private_subnets

  # Cluster endpoint access
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  # Managed node groups
  eks_managed_node_groups = {
    simpletime_nodes = {
      desired_size   = var.node_desired
      min_size       = 1
      max_size       = 2
      instance_types = [var.node_instance_type]
      subnet_ids     = module.vpc.private_subnets
    }
  }

  tags = {
    Environment = "dev"
    Project     = "SimpleTimeService"
  }
}
