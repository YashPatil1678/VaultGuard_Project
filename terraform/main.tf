provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  region                = var.region
  availability_zones    = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  owner                 = var.owner
}

module "eks" {
  source = "./modules/eks"

  region          = var.region
  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  owner           = var.owner

  node_desired_capacity = 2
  node_min_capacity     = 1
  node_max_capacity     = 3
  node_instance_types   = ["t2.micro"]
}
