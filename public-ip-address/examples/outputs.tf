output "public_ip_id" {
  description = "The resource id of the public IP resource"
  value       = module.public_ip.public_ip_id
}

output "public_ip_address" {
  description = "The public IP address value"
  value       = module.public_ip.public_ip_address
}