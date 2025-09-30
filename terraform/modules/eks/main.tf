module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.26"
  subnet_ids      = var.private_subnets
  vpc_id          = var.vpc_id

  eks_managed_node_groups = {
    default = {
      desired_size = var.node_desired_capacity
      min_size     = var.node_min_capacity
      max_size     = var.node_max_capacity
      instance_types = var.node_instance_types
      key_name     = var.key_name
    }
  }

  tags = {
    Owner = var.owner
  }
}
