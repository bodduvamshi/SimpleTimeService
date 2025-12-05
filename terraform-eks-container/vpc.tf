module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 4.0.0"

  name = "simpletime-vpc"
  cidr = var.vpc_cidr

  azs             = ["${var.region}a", "${var.region}b"]
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Project = "SimpleTimeService"
  }
}
