# SIMPLE AD
resource "aws_directory_service_directory" "simple_ad" {
  count    = var.directory_type == "SimpleAD" ? 1 : 0

  name     = var.name
  password = var.password
  size     = var.size
  type     = "SimpleAD"

  vpc_settings {
    vpc_id     = var.vpc_id
    subnet_ids = var.subnet_ids
  }
}

# MICROSOFT AD 
resource "aws_directory_service_directory" "microsoft_ad" {
  count    = var.directory_type == "MicrosoftAD" ? 1 : 0

  name     = var.name
  password = var.password
  size     = var.size
  type     = "MicrosoftAD"
  edition  = var.edition

  vpc_settings {
    vpc_id     = var.vpc_id
    subnet_ids = var.subnet_ids
  }
}