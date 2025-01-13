variable "role" {
    description = "sns policy filler"
}

variable "sns_env_arn" {
    description = "SNS_TOPIC_ARN var to input into script"
}

variable "nfl_api_key" {
  description = "API key for NFL_API_KEY Sports.oi Data API"
  type        = string
  sensitive   = true
}