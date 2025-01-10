resource "aws_sns_topic" "game_day_sns" {
  name = "game-topic"
}

resource "aws_sns_topic_subscription" "email_updates" {
  topic_arn = aws_sns_topic.game_day_sns.arn
  protocol  = "email"
  endpoint  = "<your-email> 
}