resource "aws_scheduler_schedule" "gd_scheduler" {
  name       = "game-day-scheduler"

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression = "cron(0 */5 * * ? *)" #or use "rate(5 hours)"

  target {
    arn      = var.sns_arn
    role_arn = var.role_arn
  }
}