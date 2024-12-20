variable "aws_region" {
  description = "AWS region where most resources will be created"
  type        = string
  default     = ""
}

variable "aws_access_key" {
  description = "Access key for AWS resource modification"
  type        = string
  default     = ""
}

variable "aws_secret_key" {
  description = "Secret key for AWS resource modification"
  type        = string
  default     = ""
}

variable "vercel_api_token" {
  description = "API token for Vercel resource modification"
  type        = string
  default     = ""
}

variable "postmark_account_token" {
  description = "API token for Postmark resource modification"
  type        = string
  default     = ""
}

variable "vercel_project_id" {
  description = "Vercel project ID for public website"
  type        = string
  default     = ""
}

variable "domain_primary" {
  description = "Main domain name for public website"
  type        = string
  default     = ""
}

variable "domain_internal" {
  description = "Main domain name for internal use"
  type        = string
  default     = ""
}

variable "domain_primary_alias" {
  description = "List of alias domains for public website"
  type        = list(string)
  default     = []
}

variable "domain_country_specific" {
  description = "List of country specific domains"
  type        = list(string)
  default     = []
}

variable "dmarc_rua" {
  description = "DMARC RUA for each domain"
  type        = map(string)
  default     = {}
}

variable "root_txt_records" {
  description = "Root TXT records for each domain"
  type        = map(list(string))
  default     = {}
}

variable "google_dkim" {
  description = "Google DKIM for each domain"
  type        = map(string)
  default     = {}
}