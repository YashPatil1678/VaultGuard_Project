module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  cluster_name                   = local.name
  cluster_version                = "1.27"               # Specify your desired Kubernetes version
  cluster_endpoint_public_access = true                 # Enable public access to API server
  cluster_endpoint_private_access = false               # Disable private access (optional)

  # You can restrict API access to specific CIDRs (default is 0.0.0.0/0)
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"] 

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets               # Subnets for EKS worker nodes

  # Optional: Specify the IAM role for cluster if you manage it separately
  # cluster_iam_role_name = "eks-cluster-role"

  # Enable and configure cluster addons
  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  # Defaults applied to all managed node groups
  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["t2.micro"]
    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    default = {
      desired_size = 1
      max_size     = 2
      min_size     = 1

      instance_types = ["t2.micro"]
      capacity_type  = "SPOT"

      tags = {
        Name = "eks-node-group-default"
      }
    }
  }

  # Tags for the cluster and resources
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
