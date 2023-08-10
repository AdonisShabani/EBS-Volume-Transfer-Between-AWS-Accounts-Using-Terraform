locals {
  project              = "Training"
  vpc_name             = "my-vpc-${var.environment}"
  private_subnet_tags  = tomap({ "Tier" = "Private" })
  public_subnet_tags   = tomap({ "Tier" = "Public" })
  database_subnet_tags = tomap({ "Tier" = "Database" })

 account_iam_roles_mapping = {
    "training" : "arn:aws:iam::313422618945:role/training-terraform-role",
    "sandbox" : "arn:aws:iam::148482153770:role/sandbox-terraform-role"
  }

  # Evaluate in which aws account we should create the environment and assume the given role
  aws_provider_role_arn = local.account_iam_roles_mapping[var.account]

}