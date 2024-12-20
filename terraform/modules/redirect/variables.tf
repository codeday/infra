variable "from_domain" {
  description = "Domain name to redirect from"
  type        = string
  default     = ""
}

variable "additional_domains" {
  description = "Additional domains to redirect from"
  type        = list(string)
  default     = []
}

variable "to_domain" {
  description = "Domain name to redirect to"
  type        = string
  default     = ""
}

variable "aws_acm_certificate_arn" {
  description = "AWS ACM certificate ARN for from_domain"
  type        = string
  default     = ""
}

variable "aws_route53_zone_id" {
  description = "AWS Route53 zone ID for from_domain"
  type        = string
  default     = ""
}