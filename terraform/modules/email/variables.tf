variable "domain" {
  description = "Domain name for the country"
  type        = string
  default     = ""
}

variable "aws_route53_zone_id" {
  description = "AWS Route53 zone ID for the domain"
  type        = string
  default     = ""
}

variable "google_dkim_selector" {
  description = "Google DKIM for the domain"
  type        = string
  default     = "google"
}

variable "google_dkim_public_key" {
  description = "Google DKIM public key for the domain"
  type        = string
  default     = ""
}