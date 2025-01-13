resource "aws_scheduler_schedule" "gd_scheduler" {
  name       = "game-day-scheduler"

  flexible_time_window {
    mode = "OFF" # setting the mode to off means it will run exactly at the scheduled time specified 
  }

  schedule_expression = "cron(0 5 * * ? *)" #or use "rate(5 hours)" cron starts at 1am every 5 hours 

  target {
    arn      = var.sns_arn
    role_arn = var.role_arn
  }
}
