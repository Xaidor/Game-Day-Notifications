module "gd-mod-sns" {
  source    = "./modules/sns"
  sub_email = var.subscriber_email
}

module "gd_secrets" {
  source      = "./modules/secrets"
  nfl_api_key = var.nfl_api_key
}

module "mod-iam-sns" {
  source      = "./modules/iam-policy"
  gd_arn      = module.gd-mod-sns.sns_arn
  nfl_secrets = module.gd_secrets.secrets_arn
}

module "lambda-function-mod" {
  source = "./modules/lambda"
  role   = module.mod-iam-sns.Lambda_role_arn

  sns_env_arn = module.gd-mod-sns.sns_arn
  nfl_api_key = var.nfl_api_key
}

module "EventBridge" {
  source   = "./modules/eventbridge"
  sns_arn  = module.gd-mod-sns.sns_arn
  role_arn = module.mod-iam-sns.Lambda_role_arn
}