# -------------------------
# AWS Provider settings
# -------------------------
region      = "ap-south-1"
aws_profile = "devvpc"


# -------------------------
# DIRECTORY SERVICE SETTINGS
# -------------------------

# Active deployment → Simple AD
directory_type = "SimpleAD"
size           = "Small"
edition        = "Standard"     # used only for MicrosoftAD

name     = "zalak.local"
password = "Password@123"


# -------------------------
# EXISTING VPC + PUBLIC SUBNETS (DEV)
# -------------------------
vpc_id = "zalak-dev-vpc"

subnet_ids = [
  "zalak-dev-public-ap-south-1a",
  "zalak-dev-public-ap-south-1b"
]


# -------------------------
# OPTIONAL: MICROSOFT AD CONFIG 
# -------------------------

# directory_type = "MicrosoftAD"
# edition        = "Standard"      # or "Enterprise"
#
# name     = "zalak.local"
# password = "Password@123"
#
# vpc_id = "zalak-dev-vpc"
# subnet_ids = [
#   "zalak-dev-public-ap-south-1a",
#   "zalak-dev-public-ap-south-1b"
# ]