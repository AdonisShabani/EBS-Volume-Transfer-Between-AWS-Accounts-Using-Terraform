data "aws_instance" "ec2" {
  instance_id = "i-0739a8644a96b6110"
  provider    = aws.training
}

data "terraform_remote_state" "networking" {
  backend = "remote"

  config = {
    workspaces   = { name = "networking" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}