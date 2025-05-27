output "resource" {
  description = "The full output for the Monitor Data Collection Rule."
  value       = { for r, resource in module.avm-ptn-avd-lza-insights : r => resource.resource_id }
}

output "resource_id" {
  description = "The resource id output for the Monitor Data Collection Rule."
  value       = { for r, resource in module.avm-ptn-avd-lza-insights : r => resource.resource_id.id }
}