#application subnet output
output "id" {
  value = { for k, v in module.app-subnet : k => v.id }
}

output "subnets" {
  value = { for k, v in module.app-subnet : k => v.subnets }
}

output "name" {
  value = { for k, v in module.app-subnet : k => v.name }
}

#application RG outputs
output "application-rg-name" {
  description = "The name of the resource group"
  value       = { for k, v in module.application-resource-group : k => v.name }
}

output "application-rg-resource" {
  description = "This is the full output for the resource group."
  value       = { for k, v in module.application-resource-group : k => v.resource }
}

output "application-rg-resource_id" {
  description = "The resource Id of the resource group"
  value       = { for k, v in module.application-resource-group : k => v.resource_id }
}


#NSG association output
output "nsg-association-id" {
  description = "A map of subnet names to their IDs."
  value       = module.nsg-subnet-association.id

}
