resource "aws_secretsmanager_secret" "nba_api_key" {
  name = "nba-api-key"
  description = "API key for NBA Sports Data API"
}

resource "aws_secretsmanager_secret_version" "nba_api_key" {
  secret_id     = aws_secretsmanager_secret.nba_api_key.id
  secret_string = var.nba_api_key  # You'll provide this securely during deployment
}