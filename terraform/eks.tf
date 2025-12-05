module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">= 20.0.0"

  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  eks_managed_node_groups = {
    simpletime_nodes = {
      desired_size   = var.node_desired
      min_size       = 1
      max_size       = 2
      instance_types = [var.node_instance_type]
      subnets        = module.vpc.private_subnets
    }
  }

  tags = {
    Environment = "dev"
    Project     = "SimpleTimeService"
  }
}
