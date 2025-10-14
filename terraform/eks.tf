module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0" # Use latest matching version

  cluster_name    = var.cluster_name
  cluster_version = "1.33"
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  enable_irsa         = true
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  eks_managed_node_group_defaults = {
    instance_types = [var.node_instance_type]
  }

  eks_managed_node_groups = {
    default = {
      min_size     = var.node_min_size
      max_size     = var.node_max_size
      desired_size = var.node_desired_size
      subnet_ids   = module.vpc.private_subnets
    }
  }

  # Add-ons
  cluster_addons = {
  coredns = {
    resolve_conflicts_on_update = "NONE"
    # version = omit or ""
  }
  kube_proxy = {
    resolve_conflicts_on_update = "NONE"
  }
  vpc_cni = {
    resolve_conflicts_on_update = "NONE"
  }
  aws_ebs_csi_driver = {
    resolve_conflicts_on_update = "NONE"
  }
}


  tags = {
    Environment = "dev"
    Name        = var.cluster_name
  }
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "node_group_arn" {
  value = module.eks.eks_managed_node_groups["default"].node_group_arn
}
