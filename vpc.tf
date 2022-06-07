module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"
  # version = "~> 2.78"

  # VPC Basic Details
  name            = "${local.name}-${var.vpc_name}"
  cidr            = var.vpc_cidr_block
  azs             = var.vpc_availability_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = var.vpc_database_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags     = local.common_tags
  vpc_tags = local.common_tags
}
