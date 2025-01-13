output "secret_nfl_key" {
    value = aws_secretsmanager_secret_version.nfl_api_key.secret_string
}

output "secrets_arn" {
    value = aws_secretsmanager_secret_version.nfl_api_key.arn
    description = "Output secrets arn"
}