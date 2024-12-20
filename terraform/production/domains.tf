module "country_domain" {
  for_each = toset(var.domain_country_specific)
  source = "../modules/country_domain"
  domain = each.key

  providers = {
    aws       = aws
    aws.us-east-1  = aws.us-east-1
    vercel    = vercel
  }
}

module "country_email" {
  for_each = toset(var.domain_country_specific)
  source = "../modules/email"
  domain = each.key

  aws_route53_zone_id = module.country_domain[each.key].aws_route53_zone_id
  google_dkim_public_key = var.google_dkim[each.key]
  root_txt_records = var.root_txt_records[each.key]
  dmarc_rua = var.dmarc_rua[each.key]
  
  providers = {
    aws       = aws
    aws.us-east-1  = aws.us-east-1
    postmark  = postmark
  }
}


module "alias_domain" {
  for_each = toset(var.domain_primary_alias)
  source = "../modules/alias_domain"
  domain = each.key
  
  providers = {
    aws       = aws
    aws.us-east-1  = aws.us-east-1
    postmark  = postmark
  }
}

module "alias_email" {
  for_each = toset(var.domain_primary_alias)
  source = "../modules/email"
  domain = each.key

  aws_route53_zone_id = module.alias_domain[each.key].aws_route53_zone_id
  google_dkim_public_key = var.google_dkim[each.key]
  root_txt_records = var.root_txt_records[each.key]
  dmarc_rua = var.dmarc_rua[each.key]
  
  providers = {
    aws       = aws
    aws.us-east-1  = aws.us-east-1
    postmark  = postmark
  }
}