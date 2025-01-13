variable "nfl_api_key" {
    description = "API key for NFL Sports Data API"
    type        = string
    sensitive   = true # This marks the variable as sensitive in Terraform logs
}
