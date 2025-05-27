output "resource_id" {
  description = "Virtual WAN ID"
  value       = { for key, value in module.avm-ptn-virtualwan : key => value.resource_id }
}

output "resource" {
  description = "The full resource outputs."
  value       = { for key, value in module.avm-ptn-virtualwan : key => value.resource }
}