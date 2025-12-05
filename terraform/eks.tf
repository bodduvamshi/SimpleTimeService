odule "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.24.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.32"

  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      desired_size   = 2
      max_size       = 3
      min_size       = 1
    }
  }
}
