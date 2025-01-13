variable "subscriber_email" {
  description = "Subscriber(s) email"
  type        = string
  default     = ""
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "nfl_api_key" {
  description = "API key for NFL service"
  type        = string
  sensitive   = true
}