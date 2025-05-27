#General migration vnet outputs
output "network-resource_id" {
  description = "The id of the newly created vNet"
  value       = module.vnet-nets-platform-prod-eus2-02.network-resource_id #{ for k, v in module.vnet-nets-platform-prod-eus2-02 : k => v.network-resource_id }

}

output "network-name" {
  description = "The name of the newly created vNet"
  value       = module.vnet-nets-platform-prod-eus2-02.network-name
}

output "network-resource" {
  description = "The resource object of the newly created vNet"
  value       = module.vnet-nets-platform-prod-eus2-02.network-resource
}

output "network_vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = module.vnet-nets-platform-prod-eus2-02.network_vnet_address_space
}

output "network_vnet_location" {
  description = "The location of the newly created vNet"
  value       = module.vnet-nets-platform-prod-eus2-02.network_vnet_location
}

output "network-subnets" {
  description = "The subnets of the newly created vNet"
  value       = module.vnet-nets-platform-prod-eus2-02.network-subnets
}

output "network-peerings" {
  description = "The peerings of the newly created vNet"
  value       = module.vnet-nets-platform-prod-eus2-02.network-peerings
}

output "network-vhub-connection" {
  description = "The virtual hub connection of the newly created vNet"
  value       = module.vnet-nets-platform-prod-eus2-02.network-vhub-connection
}


#Lift & shift migration vnet outputs
output "ls-network-resource_id" {
  description = "The id of the newly created vNet"
  value       = module.vnet-ls-test-eus2-02.ls-network-resource_id #{ for k, v in module.vnet-ls-test-eus2-02 : k => v.ls-network-resource_id }

}

output "ls-network-name" {
  description = "The name of the newly created vNet"
  value       = module.vnet-ls-test-eus2-02.ls-network-name
}

output "ls-network-resource" {
  description = "The resource object of the newly created vNet"
  value       = module.vnet-ls-test-eus2-02.ls-network-resource
}

output "ls-network_vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = module.vnet-ls-test-eus2-02.ls-network_vnet_address_space
}

output "ls-network_vnet_location" {
  description = "The location of the newly created vNet"
  value       = module.vnet-ls-test-eus2-02.ls-network_vnet_location
}

output "ls-network-subnets" {
  description = "The subnets of the newly created vNet"
  value       = module.vnet-ls-test-eus2-02.ls-network-subnets
}

output "ls-network-peerings" {
  description = "The peerings of the newly created vNet"
  value       = module.vnet-ls-test-eus2-02.ls-network-peerings
}

output "ls-network-vhub-connection" {
  description = "The virtual hub connection of the newly created vNet"
  value       = module.vnet-ls-test-eus2-02.ls-network-vhub-connection
}


#network RG outputs
output "network-rg-name" {
  description = "The name of the resource group"
  value       = module.rg-acp-prod-eus2-01.network-rg-name #{ for k, v in module.rg-acp-prod-eus2-01 : k => v.network-rg-name }
}

output "network-rg-resource" {
  description = "This is the full output for the resource group."
  value       = module.rg-acp-prod-eus2-01.network-rg-resource
}

output "network-rg-resource_id" {
  description = "The resource Id of the resource group"
  value       = module.rg-acp-prod-eus2-01.network-rg-resource_id
}


#application RG outputs
output "application-rg-name" {
  description = "The name of the resource group"
  value       = module.rg-ls-eus2-01.application-rg-name #{ for k, v in module.rg-ls-eus2-01 : k => v.application-rg-name }
}

output "application-rg-resource" {
  description = "This is the full output for the resource group."
  value       = module.rg-ls-eus2-01.application-rg-resource
}

output "application-rg-resource_id" {
  description = "The resource Id of the resource group"
  value       = module.rg-ls-eus2-01.application-rg-resource_id
}


#NSG association output
output "nsg-association-id" {
  description = "A map of subnet names to their IDs."
  value       = module.nsg-subnet-association.id

}
