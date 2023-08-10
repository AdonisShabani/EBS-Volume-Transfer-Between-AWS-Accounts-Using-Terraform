terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key

   assume_role {
    role_arn = local.aws_provider_role_arn
  }

  default_tags {
    tags = {
      Environment = var.environment
      Project     = local.project
      ManagedBy   = "Terraform"
      Region      = var.region
    }
  }
}