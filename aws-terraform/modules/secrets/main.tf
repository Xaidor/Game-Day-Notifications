/* Secrets Manger isn't needed for this small project. 
Typically Secrets Mangaer is used when:

Multiple team members need access to the secret
You have multiple environments (dev, staging, prod)
You need audit trails of secret access
You want automatic secret rotation
You need to share the secret across multiple AWS services
You're building an enterprise application
You need centralized secret management

keep in mind youll need .terraform.tfvars file or have to input your credentials in the CLI

When you destroy a key it takes about 7 days to be destroyed. You'll have to create a new secret if you choose to use this in your infrastructure
*/
resource "aws_secretsmanager_secret" "nfl_api_key" {
  name = "nfl-api-key"
  description = "API key for NFL Sports Data API"
}

resource "aws_secretsmanager_secret_version" "nfl_api_key" {
  secret_id     = aws_secretsmanager_secret.nfl_api_key.id
  secret_string = var.nfl_api_key # You'll prompt to provide the api key during deployment in the terminal
}