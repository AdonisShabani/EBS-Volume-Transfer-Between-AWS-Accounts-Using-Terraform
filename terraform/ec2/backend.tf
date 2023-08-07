terraform {
  backend "remote" {
    workspaces { name = "ec2" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}