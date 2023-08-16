# data "aws_instance" "ec2" {
#   for_each =  toset(local.instance_configuration)
#   instance_id = each.value.id
#   provider    = aws.training
# }

data "terraform_remote_state" "networking" {
  backend = "remote"

  config = {
    workspaces   = { name = "networking" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}