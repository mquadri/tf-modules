output "resource" {
  description = "Full output for the resource, keyed by each item in for_each"
  value       = { for k, v in module.avm-res-desktopvirtualization-applicationgroup : k => v.resource }
}

output "resource_id" {
  description = "The ID of the Azure Virtual Desktop application group, keyed by each item in for_each"
  value       = { for k, v in module.avm-res-desktopvirtualization-applicationgroup : k => v.resource_id }
}
