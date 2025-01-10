resource "aws_iam_policy" "sns_policy" {
  name        = "gd_sns_policy"
  path        = "/TestGameDayPolicy"
  description = "Game Day SNS Policy for Lambda function"

  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sns:Publish",
        Effect   = "Allow",
        Resource = "${var.gd_arn}"
      },
    ]
  })
}