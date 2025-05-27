#application subnet output
output "id" {
  value = module.new-app-subnet.id
}

output "subnets" {
  value = module.new-app-subnet.subnets
}

output "name" {
  value = module.new-app-subnet.name
}


#application RG outputs
output "application-rg-name" {
  description = "The name of the resource group"
  value       = module.new-app-subnet.application-rg-name
}

output "application-rg-resource" {
  description = "This is the full output for the resource group."
  value       = module.new-app-subnet.application-rg-resource
}

output "application-rg-resource_id" {
  description = "The resource Id of the resource group"
  value       = module.new-app-subnet.application-rg-resource_id
}


#NSG association output
output "nsg-association-id" {
  description = "A map of subnet names to their IDs."
  value       = module.new-app-subnet.id

}
