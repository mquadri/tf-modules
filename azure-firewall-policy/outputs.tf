output "azurefirewall_policy" {
  description = "This is the full output of the firewall policy resource."
  value = {
    id                     = module.avm-res-network-firewallpolicy.resource.id
    firewalls              = module.avm-res-network-firewallpolicy.resource.firewalls
    child_policies         = module.avm-res-network-firewallpolicy.resource.child_policies
    rule_collection_groups = module.avm-res-network-firewallpolicy.resource.rule_collection_groups
  }
}