terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

provider "aws" {
  aws_region            = var.aws_region
  aws_access_key        = var.aws_access_key
  aws_secret_access_key = var.aws_secret_access_key
  aws_session_token     = var.aws_session_token

  default_tags {
    Environment = var.environment
    Project     = local.project
    ManagedBy   = "Terraform"
    Region      = var.region
  }
}

# provider "aws" {
#   aws_region            = var.region
#   aws_access_key        = var.aws_access_key
#   aws_secret_access_key = var.aws_secret_access_key
#   aws_session_token     = var.aws_session_token
#   alias                 = "training"


#   default_tags {
#     Environment = var.environment
#     Project     = local.project
#     ManagedBy   = "Terraform"
#     Region      = var.region
#   }
# }