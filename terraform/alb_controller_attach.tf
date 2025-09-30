# Attach custom ALB controller policy
resource "aws_iam_role_policy_attachment" "alb_controller_attach" {
  role       = aws_iam_role.alb_ingress.name
  policy_arn = aws_iam_policy.alb_controller.arn

depends_on = [ 
    aws_iam_role.alb_ingress, aws_iam_policy.alb_controller
  ]
}

# Attach AWS-managed ELB full access policy
resource "aws_iam_role_policy_attachment" "alb_controller_elb_attach" {
  role       = aws_iam_role.alb_ingress.name
  policy_arn = "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"

depends_on = [ 
    aws_iam_role.alb_ingress, aws_iam_policy.alb_controller
  ]
}

  
  
