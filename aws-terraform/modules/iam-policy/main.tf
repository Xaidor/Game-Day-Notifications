data "aws_iam_policy_document" "secrets_policy" {
  statement {
    effect = "Allow"
    actions = [
      "secretsmanager:GetSecretValue"
    ]
    resources = [
      aws_secretsmanager_secret.nba_api_key.arn
    ]
  }
}
resource "aws_iam_policy" "sns_policy" {
  name        = "gd_sns_policy"
  path        = "/test-game-day-policy/" #A great way to keep things organized for multi-environment setups, Not really needed for smaller projects. 
  description = "Game Day SNS Policy for Lambda function"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "sns:Publish"
        Effect   = "Allow"
        Resource = var.gd_arn 
      }
    ]
  })
}

resource "aws_iam_role" "lambda_role" {
  name = "test_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com" 
        }
        Action = "sts:AssumeRole" 
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "sns_publish_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.sns_policy.arn
}
resource "aws_iam_role_policy_attachment" "basic_execution_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole" 
}

