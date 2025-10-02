variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "vaultguard-eks"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones to use"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "cluster_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.33"
}

variable "node_instance_types" {
  description = "Instance types for the managed node group"
  type        = list(string)
  default     = ["t2.micro"]
}

variable "node_desired_capacity" {
  description = "Desired node count"
  type        = number
  default     = 1
}

variable "node_min_capacity" {
  description = "Minimum nodes"
  type        = number
  default     = 1
}

variable "node_max_capacity" {
  description = "Maximum nodes"
  type        = number
  default     = 2
}

variable "tag_map" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Owner   = "yash"
    Project = "VaultGuard"
  }
}
