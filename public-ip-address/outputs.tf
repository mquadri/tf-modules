output "public_ip_id" {
  description = "The ID of the created public IP address"
  value       = { for key, value in module.avm-res-network-publicipaddress : key => value.public_ip_id }
}

output "public_ip_address" {
  description = "The assigned IP address of the public IP"
  value       = { for key, value in module.avm-res-network-publicipaddress : key => value.public_ip_address }
}