output "network_vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.network_vpc.id
}

output "network_public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [for s in aws_subnet.network_public_subnets : s.id]
}

output "network_private_subnet_ids" {
  description = "List of private subnet IDs (may be empty)"
  value       = [for s in aws_subnet.network_private_subnets : s.id]
}

output "network_igw_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.network_igw.id
}

output "network_nat_gateway_id" {
  description = "ID of the NAT Gateway (null if disabled)"
  value       = try(aws_nat_gateway.network_nat_gw[0].id, null)
}