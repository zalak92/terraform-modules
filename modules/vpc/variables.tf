variable "name_prefix" {
  type        = string
  description = "Prefix for naming all resources"
}

variable "tags" {
  type        = map(string)
  description = "Standard tags for all resources"
  default     = {}
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDRs for public subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDRs for private subnets"
  default     = []
}

variable "enable_nat" {
  type        = bool
  description = "NAT Gateway"
  default     = false
}