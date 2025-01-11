resource "aws_lambda_function" "gd_function" {
  function_name =  "gd-lambda-function"

  role = var.role
}