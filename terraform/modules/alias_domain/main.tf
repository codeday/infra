terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 4.16"
      configuration_aliases = [aws.us-east-1]
    }
    postmark = {
      source  = "shebang-labs/postmark"
      version = "0.2.4"
    }
  }
}

resource "aws_route53_zone" "zone" {
  name = var.domain
}

resource "aws_route53_record" "caa" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.domain
  type    = "CAA"
  records = ["0 issue \"letsencrypt.org\"", "0 issue \"awstrust.com\""]
  ttl     = 300
}

module "aws_cert" {
  source              = "../aws_cert"
  domain              = var.domain
  san                 = ["www.${var.domain}"]
  aws_route53_zone_id = aws_route53_zone.zone.zone_id

  depends_on = [aws_route53_record.caa]

  providers = {
    aws           = aws
    aws.us-east-1 = aws.us-east-1
  }
}

module "redirect" {
  source                  = "../redirect"
  from_domain             = var.domain
  additional_domains      = ["www.${var.domain}"]
  to_domain               = "www.codeday.org"
  aws_acm_certificate_arn = module.aws_cert.aws_acm_certificate_arn
  aws_route53_zone_id     = aws_route53_zone.zone.zone_id

  providers = {
    aws           = aws
    aws.us-east-1 = aws.us-east-1
  }
}


