data "aws_route53_zone" "main" {
  count        = local.use_custom_domain ? 1 : 0
  name         = var.hosted_zone_name
  private_zone = false
}

resource "aws_acm_certificate" "site" {
  count    = local.use_custom_domain ? 1 : 0
  provider = aws.us_east_1

  domain_name               = var.site_domain_names[0]
  subject_alternative_names = slice(var.site_domain_names, 1, length(var.site_domain_names))
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  for_each = local.use_custom_domain ? {
    for o in aws_acm_certificate.site[0].domain_validation_options : o.domain_name => o
  } : {}

  zone_id         = data.aws_route53_zone.main[0].zone_id
  name            = each.value.resource_record_name
  type            = each.value.resource_record_type
  records         = [each.value.resource_record_value]
  ttl             = 60
  allow_overwrite = true
}

resource "aws_acm_certificate_validation" "site" {
  count    = local.use_custom_domain ? 1 : 0
  provider = aws.us_east_1

  certificate_arn         = aws_acm_certificate.site[0].arn
  validation_record_fqdns = [for r in aws_route53_record.cert_validation : r.fqdn]
}

resource "aws_route53_record" "site" {
  for_each = {
    for pair in setproduct(var.site_domain_names, ["A", "AAAA"]) :
    "${pair[0]}-${pair[1]}" => { name = pair[0], type = pair[1] }
  }

  zone_id = data.aws_route53_zone.main[0].zone_id
  name    = each.value.name
  type    = each.value.type

  alias {
    name                   = aws_cloudfront_distribution.site.domain_name
    zone_id                = aws_cloudfront_distribution.site.hosted_zone_id
    evaluate_target_health = false
  }
}