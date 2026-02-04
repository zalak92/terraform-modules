region      = "ap-south-1"
aws_profile = "default"

project     = "zalak"
environment = "dev"

vpc_cidr = "10.10.0.0/16"
azs      = ["ap-south-1a", "ap-south-1b"]

public_subnet_cidrs = ["10.10.1.0/24", "10.10.2.0/24"]

# No private subnets for dev to reduce cost
private_subnet_cidrs = []

# NAT disabled to avoid charges
enable_nat = false