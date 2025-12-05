
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "21.0.1"

  cluster_name    = var.cluster_name
  cluster_version = "1.28"

  vpc_id     = module.vpc.vpc_id
  subnets    = module.vpc.private_subnets

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
      key_name      = var.ec2_key_name
    }
  }

  tags = var.tags
}
