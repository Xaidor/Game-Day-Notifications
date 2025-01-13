resource "aws_lambda_function" "gd_function" {
  function_name    = "gd-lambda-function"
  runtime          = "python3.9"  
  handler          = "gameday.lambda_handler"
  filename         = "${path.module}/function.zip"
  source_code_hash = filebase64sha256("${path.module}/function.zip")
  role            = var.role
}