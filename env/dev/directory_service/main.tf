module "directory_service" {
  source = "../../../modules/directory_service"

  name           = var.name
  password       = var.password
  size           = var.size
  directory_type = var.directory_type
  edition        = var.edition

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids
}

# Microsoft AD (optional - off)
#
# directory_type = "MicrosoftAD"
# edition        = "Standard"
#