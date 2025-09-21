locals {
  region = "ap-south-1"
  name   = "VaultGuard-cluster"
  vpc_cidr = "10.0.0.0/16"
  azs      = ["ap-south-1a", "ap-south-1b"]
  public_subnets  = ["10.0.0.0/20", "10.0.16.0/20"]
  private_subnets = ["10.0.32.0/19", "10.0.64.0/19"]
  tags = {
    Project = local.name
    Owner   = "yash_patil"
  }
}

provider "aws" {
  region = "ap-south-1"
}
