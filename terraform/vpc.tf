module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0" # Use the latest compatible version

  name = "${var.cluster_name}-vpc"
  cidr = var.vpc_cidr

  azs             = [var.availability_zone_a, var.availability_zone_b]
  public_subnets  = [var.public_subnet_a_cidr, var.public_subnet_b_cidr]
  private_subnets = [var.private_subnet_a_cidr, var.private_subnet_b_cidr]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

