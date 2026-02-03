output "network_vpc_id" {
  description = "VPC ID for the dev environment"
  value       = module.network.network_vpc_id
}

output "network_public_subnets" {
  description = "Public subnet IDs created for dev"
  value       = module.network.network_public_subnet_ids
}

output "network_private_subnets" {
  description = "Private subnet IDs for dev (empty if not created)"
  value       = module.network.network_private_subnet_ids
}

output "network_igw_id" {
  description = "Internet Gateway ID"
  value       = module.network.network_igw_id
}

output "network_nat_gateway_id" {
  description = "NAT Gateway ID (null if disabled)"
  value       = module.network.network_nat_gateway_id
}