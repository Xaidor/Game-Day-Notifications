resource "aws_secretsmanager_secret" "nfl_api_key" {
  name = "nfl-api-key"
  description = "API key for NFL Sports Data API"
}

resource "aws_secretsmanager_secret_version" "nfl_api_key" {
  secret_id     = aws_secretsmanager_secret.nfl_api_key.id
  secret_string = var.nfl_api_key  # You'll prompt to provide the api key during deployment in the terminal
}