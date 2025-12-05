module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "21.10.1"

  cluster_name    = "simpletime-eks"
  cluster_version = "1.34"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  # Managed Node Group
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
    Project     = "SimpleTimeService"
  }
}
