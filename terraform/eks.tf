module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.0.0"

  cluster_name    = var.eks_cluster_name
  cluster_version = "1.27"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    simpletime_nodes = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
  }

  tags = {
    Environment = "dev"
  }
}
