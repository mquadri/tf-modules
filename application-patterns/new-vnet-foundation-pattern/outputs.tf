#General migration vnet outputs
output "network-resource_id" {
  description = "The id of the newly created vNet"
  value       = { for k, v in module.virtualnetwork-subnet : k => v.resource_id }

}

output "network-name" {
  description = "The name of the newly created vNet"
  value       = { for k, v in module.virtualnetwork-subnet : k => v.name }
}

output "network-resource" {
  description = "The resource object of the newly created vNet"
  value       = { for k, v in module.virtualnetwork-subnet : k => v.resource }
}

output "network_vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = { for k, v in module.virtualnetwork-subnet : k => v.vnet_address_space }
}

output "network_vnet_location" {
  description = "The location of the newly created vNet"
  value       = { for k, v in module.virtualnetwork-subnet : k => v.vnet_location }
}

output "network-subnets" {
  description = "The subnets of the newly created vNet"
  value       = { for k, v in module.virtualnetwork-subnet : k => v.subnets }
}

output "network-peerings" {
  description = "The peerings of the newly created vNet"
  value       = { for k, v in module.virtualnetwork-subnet : k => v.peerings }
}

output "network-vhub-connection" {
  description = "The virtual hub connection of the newly created vNet"
  value       = { for k, v in module.virtualnetwork-subnet : k => v.vhub-connection }
}


#Lift & shift migration vnet outputs
output "ls-network-resource_id" {
  description = "The id of the newly created vNet"
  value       = { for k, v in module.liftshift-virtualnetwork-subnet : k => v.resource_id }

}

output "ls-network-name" {
  description = "The name of the newly created vNet"
  value       = { for k, v in module.liftshift-virtualnetwork-subnet : k => v.name }
}

output "ls-network-resource" {
  description = "The resource object of the newly created vNet"
  value       = { for k, v in module.liftshift-virtualnetwork-subnet : k => v.resource }
}

output "ls-network_vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = { for k, v in module.liftshift-virtualnetwork-subnet : k => v.vnet_address_space }
}

output "ls-network_vnet_location" {
  description = "The location of the newly created vNet"
  value       = { for k, v in module.liftshift-virtualnetwork-subnet : k => v.vnet_location }
}

output "ls-network-subnets" {
  description = "The subnets of the newly created vNet"
  value       = { for k, v in module.liftshift-virtualnetwork-subnet : k => v.subnets }
}

output "ls-network-peerings" {
  description = "The peerings of the newly created vNet"
  value       = { for k, v in module.liftshift-virtualnetwork-subnet : k => v.peerings }
}

output "ls-network-vhub-connection" {
  description = "The virtual hub connection of the newly created vNet"
  value       = { for k, v in module.liftshift-virtualnetwork-subnet : k => v.vhub-connection }
}


#network RG outputs
output "network-rg-name" {
  description = "The name of the resource group"
  value       = { for k, v in module.network-resource-group : k => v.name }
}

output "network-rg-resource" {
  description = "This is the full output for the resource group."
  value       = { for k, v in module.network-resource-group : k => v.resource }
}

output "network-rg-resource_id" {
  description = "The resource Id of the resource group"
  value       = { for k, v in module.network-resource-group : k => v.resource_id }
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