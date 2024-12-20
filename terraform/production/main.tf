terraform {
  required_version = ">= 1.2.0"
  cloud {
    organization = "codeday"
    workspaces {
      name = "production"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
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

provider "aws" {
  region  = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "aws" {
  alias = "us-east-1"
  region  = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "postmark" {
  account_token = var.postmark_account_token
}

provider "vercel" {
  api_token = var.vercel_api_token
}