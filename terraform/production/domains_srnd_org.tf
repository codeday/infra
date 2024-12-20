
module "aws_cert_showcase_srnd_org" {
  aws_route53_zone_id = module.alias_domain["srnd.org"].aws_route53_zone_id
  source              = "../modules/aws_cert"
  domain              = "showcase.srnd.org"

  providers = {
    aws           = aws
    aws.us-east-1 = aws.us-east-1
  }
}


module "redirect_showcase_srnd_org" {
  aws_route53_zone_id     = module.alias_domain["srnd.org"].aws_route53_zone_id
  source                  = "../modules/redirect"
  from_domain             = "showcase.srnd.org"
  to_domain               = "showcase.codeday.org"
  aws_acm_certificate_arn = module.aws_cert_showcase_srnd_org.aws_acm_certificate_arn

  providers = {
    aws           = aws
    aws.us-east-1 = aws.us-east-1
  }
}

resource "aws_route53_record" "srnd_org_cdn" {
  zone_id  = module.alias_domain["srnd.org"].aws_route53_zone_id
  name     = each.key
  for_each = toset(["f1", "f2", "fwd"])
  type     = "CNAME"
  records  = ["e.sni.global.fastly.net"]
  ttl      = 600
}

resource "aws_route53_record" "micro_srnd_org" {
  zone_id = module.alias_domain["srnd.org"].aws_route53_zone_id
  name    = "micro"
  type    = "CNAME"
  records = ["d1n2lh07s0eqte.cloudfront.net"]
  ttl     = 600
}

resource "aws_s3_bucket" "assets_srnd_org" {
  bucket = "assets.srnd.org"
}

resource "aws_s3_bucket_public_access_block" "assets_srnd_org" {
  bucket = aws_s3_bucket.assets_srnd_org.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "assets_srnd_org" {
  bucket = aws_s3_bucket.assets_srnd_org.id
  index_document {
    suffix = "index.html"
  }
}

module "aws_cert_assets_srnd_org" {
  aws_route53_zone_id = module.alias_domain["srnd.org"].aws_route53_zone_id
  source              = "../modules/aws_cert"
  domain              = "assets.srnd.org"

  providers = {
    aws           = aws
    aws.us-east-1 = aws.us-east-1
  }
}

resource "aws_cloudfront_distribution" "assets_srnd_org" {
  provider = aws.us-east-1
  aliases  = ["assets.srnd.org"]

  origin {
    domain_name = aws_s3_bucket_website_configuration.assets_srnd_org.website_endpoint
    origin_id   = aws_s3_bucket.assets_srnd_org.id
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
    target_origin_id       = aws_s3_bucket.assets_srnd_org.id
    viewer_protocol_policy = "allow-all"
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = module.aws_cert_assets_srnd_org.aws_acm_certificate_arn
    ssl_support_method  = "sni-only"
  }
}

resource "aws_route53_record" "assets_srnd_org_a" {
  zone_id = module.alias_domain["srnd.org"].aws_route53_zone_id
  name    = "assets"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.assets_srnd_org.domain_name
    zone_id                = aws_cloudfront_distribution.assets_srnd_org.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "assets_srnd_org_aaaa" {
  zone_id = module.alias_domain["srnd.org"].aws_route53_zone_id
  name    = "assets"
  type    = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.assets_srnd_org.domain_name
    zone_id                = aws_cloudfront_distribution.assets_srnd_org.hosted_zone_id
    evaluate_target_health = false
  }
}