terraform {
  backend "s3" {
    bucket       = "tfstate-785139344768-eu-west-1"
    key          = "myskl-blog/dev/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}