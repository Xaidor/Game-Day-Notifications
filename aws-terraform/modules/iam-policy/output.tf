output "sns_policy" {
  value = aws_iam_policy.sns_policy.policy
}

output "Lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}