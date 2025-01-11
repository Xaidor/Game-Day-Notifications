resource "aws_lambda_function" "gd_function" {
  function_name =  "gd-lambda-function"
  runtime = python #grab python version 
  handler = "gameday.lambda_handler"
  filename = "${aws-terraform/modules/lambda/gameday.py}/function.zip"
  source_code_hash = filebase64sha256("${aws-terraform/modules/lambda/gameday.py}/function.zip")
  
  role = var.role
}