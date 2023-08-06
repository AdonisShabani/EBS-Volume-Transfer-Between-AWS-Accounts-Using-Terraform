locals {
  project              = "Training"
  vpc_name             = "my-vpc-${var.environment}"
  private_subnet_tags  = tomap({ "Tier" = "Private" })
  public_subnet_tags   = tomap({ "Tier" = "Public" })
  database_subnet_tags = tomap({ "Tier" = "Database" })

}