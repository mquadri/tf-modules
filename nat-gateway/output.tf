output "natgateway_public_ip_prefix_values" {
  description = "The CIDRs provisioned for the public IP prefixes of all NAT Gateways."
  value       = { for key, mod in module.avm-res-network-natgateway : key => mod.public_ip_prefix_value }
}

output "natgateway_resources" {
  description = "The NAT Gateway resources for all instances."
  value       = { for key, mod in module.avm-res-network-natgateway : key => mod.resource }
}

output "natgateway_resource_ids" {
  description = "The IDs of the NAT Gateway resources for all instances."
  value       = { for key, mod in module.avm-res-network-natgateway : key => mod.resource_id }
}

output "natgateway_combined_output" {
  description = "Combined output of NAT Gateway public IP prefixes, resources, and resource IDs."
  value = {
    public_ip_prefix_values = { for key, mod in module.avm-res-network-natgateway : key => mod.public_ip_prefix_value }
    resources               = { for key, mod in module.avm-res-network-natgateway : key => mod.resource }
    resource_ids            = { for key, mod in module.avm-res-network-natgateway : key => mod.resource_id }
  }
}
