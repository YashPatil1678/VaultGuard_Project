resource "aws_iam_role_policy_attachment" "alb_controller_attach" { 
  role = aws_iam_role.alb_ingress.name 
  policy_arn = aws_iam_policy.alb_controller.arn 
  
  depends_on = [ 
    aws_iam_role.alb_ingress, aws_iam_policy.alb_controller
  ]
}
