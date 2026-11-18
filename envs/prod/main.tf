
module "blog" {
  source = "../../modules/blog"

  providers = {
    aws           = aws
    aws.us_east_1 = aws.us_east_1
  }

  environment = "prod"
  hosted_zone_name  = "myskl.dev"
  site_domain_names = ["myskl.dev", "www.myskl.dev"]
}
