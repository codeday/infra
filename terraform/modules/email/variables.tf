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

variable "root_txt_records" {
  description = "Root TXT records for the domain"
  type        = list(string)
  default     = []
}

variable "dmarc_rua" {
  description = "DMARC RUA for the domain"
  type        = string
  default     = ""
}
