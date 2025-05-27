output "resource_id" {
  description = "The id of the newly created vNet"
  value       = length(module.avm-res-network-virtualnetwork) > 0 ? module.avm-res-network-virtualnetwork[0].resource_id : null
}

output "name" {
  description = "The name of the newly created vNet"
  value       = length(module.avm-res-network-virtualnetwork) > 0 ? module.avm-res-network-virtualnetwork[0].name : null
}

output "resource" {
  description = "The resource object of the newly created vNet"
  value       = length(module.avm-res-network-virtualnetwork) > 0 ? module.avm-res-network-virtualnetwork[0].resource : null
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = length(module.avm-res-network-virtualnetwork) > 0 ? module.avm-res-network-virtualnetwork[0].resource.body.properties.addressSpace : null
}

output "vnet_location" {
  description = "The location of the newly created vNet"
  value       = length(module.avm-res-network-virtualnetwork) > 0 ? module.avm-res-network-virtualnetwork[0].resource.location : null
}

output "subnets" {
  description = "The subnets of the newly created vNet"
  value       = length(module.avm-res-network-virtualnetwork) > 0 ? module.avm-res-network-virtualnetwork[0].subnets : null
}

output "peerings" {
  description = "The peerings of the newly created vNet"
  value       = length(module.avm-res-network-virtualnetwork) > 0 ? module.avm-res-network-virtualnetwork[0].peerings : null
}

output "vhub-connection" {
  description = "The virtual hub connection of the newly created vNet"
  value       = length(azurerm_virtual_hub_connection.vhub-vnet-connection) > 0 ? azurerm_virtual_hub_connection.vhub-vnet-connection[0] : null
}