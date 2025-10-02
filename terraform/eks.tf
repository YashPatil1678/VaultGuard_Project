module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"         # module version - only once here

  name            = local.name
  cluster_version = "1.33"    # Kubernetes version for your cluster

  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.private_subnets

  public_access_cidrs = ["0.0.0.0/0"]  # to enable public access

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

  tags = local.tags
}
