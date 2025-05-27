output "azurefirewall_resource" {
  description = "This is the full output of the firewall resource."
  value = {
    id               = module.avm-res-network-azurefirewall.resource.id
    name             = module.avm-res-network-azurefirewall.resource.name
    ip_configuration = module.avm-res-network-azurefirewall.resource.ip_configuration
    virtual_hub      = module.avm-res-network-azurefirewall.resource.virtual_hub
  }
}