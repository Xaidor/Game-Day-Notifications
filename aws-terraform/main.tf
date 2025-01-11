module "gd-mod-sns-" {
    source = "./modules/sns"
    sub_email = var.subscriber_email
} 

module "mod-iam-sns" {
    source = "./modules/iam-policy"

    gd_arn = module.gd-mod-sns.sns_arn
}
