
data "aws_caller_identity" "current" {}

locals {
  prefix      = "myskl-blog-${var.environment}"
  bucket_name = "${local.prefix}-site-${data.aws_caller_identity.current.account_id}"
}

locals {
  use_custom_domain = length(var.site_domain_names) > 0
}