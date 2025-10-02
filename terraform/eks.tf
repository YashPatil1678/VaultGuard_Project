module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.private_subnets

  node_groups = {
    managed_nodes = {
      desired_capacity = var.node_desired_capacity
      min_capacity     = var.node_min_capacity
      max_capacity     = var.node_max_capacity

      instance_types = var.node_instance_types
      disk_size      = 10

      additional_tags = {
        "Name" = "${var.cluster_name}-node"
      }
    }
  }

  manage_aws_auth = true

  tags = merge(var.tag_map, {
    "Name" = var.cluster_name
  })

  write_kubeconfig = true
  kubeconfig_path  = "${path.module}/kubeconfig_${var.cluster_name}"
}
