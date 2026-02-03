module "network" {
  source               = "../../../modules/vpc"

  name_prefix          = local.name_prefix
  tags                 = local.standard_tags

  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat           = var.enable_nat
}