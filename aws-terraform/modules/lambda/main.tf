resource "aws_lambda_function" "gd_function" {
  function_name    = "gd-lambda-function"
  runtime          = "python3.9"  
  handler          = "gameday.lambda_handler"
  filename         = "${path.module}/function.zip"
  role            = var.role

  environment {
    variables = {
      SNS_TOPIC_ARN = var.sns_env_arn
      NFL_API_KEY = var.nfl_api_key
    }
  }
}