output "alb_controller_role_arn" {
  description = "ARN of the IAM role for ALB ingress controller"
  value       = aws_iam_role.alb_ingress.arn
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value = module.eks.cluster_name
}
