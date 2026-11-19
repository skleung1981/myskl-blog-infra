module "blog" {
  source = "../../modules/blog"

  providers = {
    aws           = aws
    aws.us_east_1 = aws.us_east_1
  }

  environment   = "dev"
  force_destroy = true

  hosted_zone_name  = "myskl.dev"
  site_domain_names = ["dev.myskl.dev"]
  deployer_principal_arns = ["arn:aws:iam::785139344768:user/jenkins"]
}