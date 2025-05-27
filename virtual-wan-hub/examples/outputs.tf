output "resource" {
  description = "The full resource outputs."
  value       = module.vwan.resource
}

output "resource_id" {
  description = "Virtual WAN ID"
  value       = module.vwan.resource_id
}