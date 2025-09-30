variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "owner" {
  description = "Owner tag"
  type        = string
}

variable "node_desired_capacity" {
  description = "Desired capacity of node group"
  type        = number
  default     = 2
}

variable "node_min_capacity" {
  description = "Minimum capacity of node group"
  type        = number
  default     = 1
}

variable "node_max_capacity" {
  description = "Maximum capacity of node group"
  type        = number
  default     = 3
}

variable "node_instance_types" {
  description = "Instance types for node group"
  type        = list(string)
  default     = ["t2.micro"]
}

variable "key_name" {
  description = "EC2 key pair name for SSH access (optional)"
  type        = string
  default     = ""
}
