output "site_bucket_name" {
  description = "Bucket that Jenkins uploads the Angular build into"
  value       = aws_s3_bucket.site.bucket
}

output "distribution_id" {
  description = "Needed by Jenkins for cache invalidation"
  value       = aws_cloudfront_distribution.site.id
}

output "site_url" {
 value = local.use_custom_domain ? "https://${var.site_domain_names[0]}" : "https://${aws_cloudfront_distribution.site.domain_name}"
}

output "deploy_role_arn" {
  value = one(aws_iam_role.deploy[*].arn)
}