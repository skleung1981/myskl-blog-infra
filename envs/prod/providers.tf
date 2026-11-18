provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  default_tags {
    tags = {
      Project   = "myskl-blog"
      Env       = "Prod"
      ManagedBy = "terraform"
    }
  }
}

provider "aws" {
  alias   = "us_east_1"
  region  = "us-east-1"
  profile = var.aws_profile

  default_tags {
    tags = {
      Project   = "myskl-blog"
      Env       = "Prod"
      ManagedBy = "terraform"
    }
  }
}