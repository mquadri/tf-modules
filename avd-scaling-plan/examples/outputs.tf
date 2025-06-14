output "resource" {
  description = "This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id"
  value       = module.avd-scaling-plan.resource
}

output "resource_id" {
  description = "The ID of the Azure Virtual Desktop application group"
  value       = module.avd-scaling-plan.resource_id
}
