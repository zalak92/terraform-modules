output "directory_id" {
  value = (
    var.directory_type == "SimpleAD"
    ? aws_directory_service_directory.simple_ad[0].id
    : aws_directory_service_directory.microsoft_ad[0].id
  )
}

output "dns_ip_addresses" {
  value = (
    var.directory_type == "SimpleAD"
    ? aws_directory_service_directory.simple_ad[0].dns_ip_addresses
    : aws_directory_service_directory.microsoft_ad[0].dns_ip_addresses
  )
}