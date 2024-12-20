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

resource "aws_route53_zone" "zone" {
  name = var.domain
}

module "aws_cert" {
  source = "../aws_cert"
  domain = var.domain
  aws_route53_zone_id = aws_route53_zone.zone.zone_id

  depends_on = [aws_route53_record.caa]

  providers = {
    aws       = aws
    aws.us-east-1  = aws.us-east-1
  }
}

module "redirect" {
  source = "../redirect"
  from_domain = var.domain
  to_domain = "www.${var.domain}"
  aws_acm_certificate_arn = module.aws_cert.aws_acm_certificate_arn
  aws_route53_zone_id = aws_route53_zone.zone.zone_id

  providers = {
    aws       = aws
    aws.us-east-1  = aws.us-east-1
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.zone.zone_id
  name = "www.${var.domain}"
  records = ["cname.vercel-dns.com."]
  type    = "CNAME"
  ttl     = 300
}

resource "aws_route53_record" "caa" {
    zone_id = aws_route53_zone.zone.zone_id
    name = var.domain
    type = "CAA"
    records = ["0 issue \"letsencrypt.org\"", "0 issue \"awstrust.com\""]
    ttl = 300
}

resource "aws_route53_record" "root_txt" {
    zone_id = aws_route53_zone.zone.zone_id
    name = var.domain
    type = "TXT"

    records = concat(
      ["v=spf1 include:_spf.google.com include:calendar-server.bounces.google.com include:spf.mtasv.net ~all"],
      coalesce(var.root_txt_records, []),
    )

    ttl = 300
}

resource "aws_route53_record" "dmarc" {
    zone_id = aws_route53_zone.zone.zone_id
    name = "_dmarc"
    type = "TXT"
    records = ["v=DMARC1; p=reject; pct=100; rua=${var.dmarc_rua}; sp=reject; aspf=r;"]
    ttl = 300
}
