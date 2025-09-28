output "alb_controller_role_arn" {
  description = "ARN of the IAM role for ALB ingress controller"
  value       = aws_iam_role.alb_ingress.arn
}

