variable "domain" {
  description = "Domain name for the country"
  type        = string
  default     = ""
}

variable "aws_route53_zone_id" {
  description = "AWS Route53 zone ID"
  type        = string
  default     = ""
}

variable "san" {
  description = "Subject Alternative Names"
  type        = list(string)
  default     = []
}
