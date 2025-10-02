module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.5" # lock to a recent stable v20 release

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets

  eks_managed_node_groups = {
    default = {
      desired_size = var.node_desired_capacity
      min_size     = var.node_min_capacity
      max_size     = var.node_max_capacity

      instance_types = var.node_instance_types
      disk_size      = 10

      labels = {
        role = "worker"
      }

      tags = {
        "Name" = "${var.cluster_name}-node"
      }
    }
  }

  tags = merge(var.tag_map, {
    "Name" = var.cluster_name
  })
}
