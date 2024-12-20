terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
      configuration_aliases = [aws.us-east-1]
    }
    vercel = {
      source  = "vercel/vercel"
      version = "2.8.0"
    }
    postmark = {
      source = "shebang-labs/postmark"
      version = "0.2.4"
    }
  }
}

resource "aws_route53_record" "mx" {
    zone_id = var.aws_route53_zone_id
    name = var.domain
    type = "MX"
    records = ["1 smtp.google.com."]
    ttl = 300
}

resource "postmark_domain" "domain" {
    name = var.domain
}

resource "aws_route53_record" "postmark_dkim" {
  zone_id = var.aws_route53_zone_id
  name = postmark_domain.domain.dkim_pending_host
  type = "TXT"
  records = [
    postmark_domain.domain.dkim_pending_text_value
  ]
  ttl = 300

  lifecycle { # https://github.com/shebang-labs/terraform-provider-postmark/issues/6
    ignore_changes = [name, records]
  }
}

resource "aws_route53_record" "postmark_return" {
  zone_id = var.aws_route53_zone_id
  name = coalesce(postmark_domain.domain.return_path_domain, "pm-bounces")
  type = "CNAME"
  records = [postmark_domain.domain.return_path_domain_cname_value]
  ttl = 300
}

resource "aws_route53_record" "google_dkim" {
    zone_id = var.aws_route53_zone_id
    name = "${coalesce(var.google_dkim_selector, "google")}._domainkey"
    type = "TXT"
    records = [replace(var.google_dkim_public_key, "/(.{255})/", "$1\"\"")]
    ttl = 300
}