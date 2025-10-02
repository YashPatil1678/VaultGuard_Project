module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name    = local.name                   # Was cluster_name before
  version = "1.33"                      # Kubernetes version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Public access configuration (note different name)
  public_access_cidrs = ["0.0.0.0/0"]  # Allow all IPs public access

  # Managed node group(s)
  node_groups = {
    default = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1
      instance_types   = ["t2.micro"]
      capacity_type    = "SPOT"
      tags = {
        Name = "eks-node-group-default"
      }
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
