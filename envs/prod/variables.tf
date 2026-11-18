variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "aws_profile" {
  description = "Local SSO profile. Leave null in Jenkins so it uses its own credentials"
  type        = string
  default     = null
}
