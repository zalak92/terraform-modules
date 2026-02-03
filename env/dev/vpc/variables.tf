variable "region" {
  type        = string
  description = "AWS region to deploy the dev VPC"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI profile name"
}

variable "project" {
  type        = string
  description = "Project short name"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones to use"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDRs for public subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDRs for private subnets"
  default     = []
}

variable "enable_nat" {
  type        = bool
  description = "NAT Gateway"
  default     = false
}