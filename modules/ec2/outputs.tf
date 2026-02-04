output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.ec2.id
}

output "ec2_private_ip" {
  description = "Private IP address"
  value       = aws_instance.ec2.private_ip
}

output "ec2_public_ip" {
  description = "Public IP address (if assigned)"
  value       = try(aws_instance.ec2.public_ip, null)
}