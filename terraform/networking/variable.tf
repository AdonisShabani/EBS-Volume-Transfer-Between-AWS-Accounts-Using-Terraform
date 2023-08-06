variable "aws_region" {
    type = string
    default = "eu-central-1" 
}

variable "aws_access_key" {
    type = string
    description = "AWS Access Key ID"
}

variable "aws_secret_access_key" {
    type   = string
    description = "AWS Secret Key"
}

variable "aws_session_token" {
    type   = string
    description = "AWS Session Token"
}

variable "environment" {
    type = string
    default = "dev"
}