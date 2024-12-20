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

resource "aws_s3_bucket" "www_redirect" {
  bucket   = var.from_domain
  provider = aws.us-east-1
}

resource "aws_s3_bucket_public_access_block" "www_redirect" {
  bucket   = aws_s3_bucket.www_redirect.id
  provider = aws.us-east-1

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "www_redirect" {
  bucket   = aws_s3_bucket.www_redirect.id
  provider = aws.us-east-1
  redirect_all_requests_to {
    host_name = var.to_domain
    protocol  = "https"
  }
}

resource "aws_cloudfront_distribution" "www_redirect" {
  provider = aws.us-east-1
  aliases  = concat([var.from_domain], var.additional_domains)

  origin {
    domain_name = aws_s3_bucket_website_configuration.www_redirect.website_endpoint
    origin_id   = aws_s3_bucket.www_redirect.id
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled = true
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket.www_redirect.id
    viewer_protocol_policy = "allow-all"
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.aws_acm_certificate_arn
    ssl_support_method  = "sni-only"
  }
}

resource "aws_route53_record" "www_redirect_a" {
  zone_id  = var.aws_route53_zone_id
  for_each = toset(concat([var.from_domain], var.additional_domains))
  name     = "${each.key}."
  type     = "A"

  alias {
    name                   = aws_cloudfront_distribution.www_redirect.domain_name
    zone_id                = aws_cloudfront_distribution.www_redirect.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_redirect_aaaa" {
  zone_id  = var.aws_route53_zone_id
  for_each = toset(concat([var.from_domain], var.additional_domains))
  name     = "${each.key}."
  type     = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.www_redirect.domain_name
    zone_id                = aws_cloudfront_distribution.www_redirect.hosted_zone_id
    evaluate_target_health = false
  }
}