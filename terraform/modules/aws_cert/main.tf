terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 4.16"
      configuration_aliases = [aws.us-east-1]
    }
  }
}

resource "aws_acm_certificate" "cert" {
  domain_name               = var.domain
  subject_alternative_names = var.san
  validation_method         = "DNS"
  provider                  = aws.us-east-1

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_record" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.aws_route53_zone_id
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_record : record.fqdn]
  provider                = aws.us-east-1
}