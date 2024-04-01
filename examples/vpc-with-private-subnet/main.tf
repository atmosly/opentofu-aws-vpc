locals {
  name        = "skaf"
  region      = "us-east-1"
  environment = "stage"
  additional_aws_tags = {
    Owner      = "SquareOps"
    Expires    = "Never"
    Department = "Engineering"
  }
  vpc_cidr = "10.10.0.0/16"
}

module "vpc" {
  source                 = "git@github.com:atmosly/opentofu-aws-vpc.git"
  name                   = local.name
  vpc_cidr               = local.vpc_cidr
  environment            = local.environment
  availability_zones     = ["us-east-1a", "us-east-1b"]
  public_subnet_enabled  = true
  private_subnet_enabled = true
  auto_assign_public_ip  = true

}
