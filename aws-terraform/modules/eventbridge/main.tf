resource "aws_scheduler_schedule" "gd_scheduler" {
  name       = "game-day-scheduler"

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression = "rate(1 hours)"

  target {
    arn      = var.sns_arn
    role_arn = var.role_arn
  }
}