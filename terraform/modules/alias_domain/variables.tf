variable "domain" {
  description = "Domain name for the country"
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
