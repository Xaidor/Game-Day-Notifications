module "gd-mod-sns" {
    source = "./modules/sns"
    sub_email = var.subscriber_email
} 

module "mod-iam-sns" {
    source = "./modules/iam-policy"
    gd_arn = module.gd-mod-sns.sns_arn
}

module "lambda-function-mod" {
    source = "./modules/lambda"
    role = module.mod-iam-sns.Lambda_role_arn
}

module "EventBridge" {
    source = "./modules/eventbridge"
    sns_arn = module.gd-mod-sns.sns_arn
    role_arn = module.mod-iam-sns.Lambda_role_arn
}