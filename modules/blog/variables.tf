
variable "environment" {
  description = "Environment name, used in resource names"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "environment must be \"dev\" or \"prod\"."
  }
}

variable "force_destroy" {
  description = "Allow destroying non-empty buckets. Only true for dev!"
  type        = bool
  default     = false
}

variable "hosted_zone_name" {
  description = "Existing Route 53 hosted zone, e.g. myskl.net. null = no custom domain"
  type        = string
  default     = null
}

variable "site_domain_names" {
  description = "Hostnames for the site; the first one is the main name. Empty = use the CloudFront URL"
  type        = list(string)
  default     = []
}