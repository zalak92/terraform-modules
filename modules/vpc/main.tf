locals {
  has_private = length(var.private_subnet_cidrs) > 0
}

###########################
# VPC
###########################
resource "aws_vpc" "network_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-vpc"
  })
}

###########################
# Internet Gateway
###########################
resource "aws_internet_gateway" "network_igw" {
  vpc_id = aws_vpc.network_vpc.id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-igw"
  })
}

###########################
# Public Subnets
###########################
resource "aws_subnet" "network_public_subnets" {
  for_each = {
    for idx, cidr in var.public_subnet_cidrs :
    idx => { cidr = cidr, az = var.azs[idx] }
  }

  vpc_id                  = aws_vpc.network_vpc.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-public-${each.value.az}",
    Tier = "public"
  })
}

###########################
# Public Route Table
###########################
resource "aws_route_table" "network_public_rtb" {
  vpc_id = aws_vpc.network_vpc.id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-rtb-public"
  })
}

resource "aws_route" "network_public_route" {
  route_table_id         = aws_route_table.network_public_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.network_igw.id
}

resource "aws_route_table_association" "network_public_rtb_assoc" {
  for_each       = aws_subnet.network_public_subnets
  route_table_id = aws_route_table.network_public_rtb.id
  subnet_id      = each.value.id
}

###########################
# Private Subnets 
###########################
resource "aws_subnet" "network_private_subnets" {
  for_each = local.has_private ? {
    for idx, cidr in var.private_subnet_cidrs :
    idx => { cidr = cidr, az = var.azs[idx] }
  } : {}

  vpc_id            = aws_vpc.network_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-private-${each.value.az}",
    Tier = "private"
  })
}

###########################
# NAT Gateway 
###########################
resource "aws_eip" "network_nat_eip" {
  count = var.enable_nat && local.has_private ? 1 : 0
  domain = "vpc"

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-nat-eip"
  })
}

resource "aws_nat_gateway" "network_nat_gw" {
  count         = var.enable_nat && local.has_private ? 1 : 0
  allocation_id = aws_eip.network_nat_eip[0].id
  subnet_id     = values(aws_subnet.network_public_subnets)[0].id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-natgw"
  })
}

resource "aws_route_table" "network_private_rtb" {
  count = local.has_private ? 1 : 0
  vpc_id = aws_vpc.network_vpc.id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-rtb-private"
  })
}

resource "aws_route" "network_private_route" {
  count = var.enable_nat && local.has_private ? 1 : 0

  route_table_id         = aws_route_table.network_private_rtb[0].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.network_nat_gw[0].id
}

resource "aws_route_table_association" "network_private_rtb_assoc" {
  for_each = aws_subnet.network_private_subnets
  route_table_id = aws_route_table.network_private_rtb[0].id
  subnet_id      = each.value.id
}