variable "sns_arn" {
  description = "The ARN of the SNS topic to be triggered by the scheduler"
  type        = string
  validation {
    condition     = can(regex("^arn:aws:sns:[a-z0-9-]+:[0-9]{12}:", var.sns_arn))
    error_message = "The SNS ARN must be valid and in the correct format."
  }
}
variable "role_arn" {
  description = "The ARN of the IAM role that grants permission to EventBridge to trigger the SNS topic"
  type        = string
  validation {
    condition     = can(regex("^arn:aws:iam::[0-9]{12}:role/.+", var.role_arn))
    error_message = "The role ARN must be valid and in the correct format."
  }
}