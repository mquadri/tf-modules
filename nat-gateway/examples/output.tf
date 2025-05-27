output "natgateway_public_ip_prefix_values" {
  description = "The CIDRs provisioned for the public IP prefixes of all NAT Gateways (from nat_gateway module)."
  value       = module.nat_gateway.natgateway_public_ip_prefix_values
}

output "natgateway_resources" {
  description = "The NAT Gateway resources for all instances (from nat_gateway module)."
  value       = module.nat_gateway.natgateway_resources
}

output "natgateway_resource_ids" {
  description = "The IDs of the NAT Gateway resources for all instances (from nat_gateway module)."
  value       = module.nat_gateway.natgateway_resource_ids
}

output "natgateway_combined_output" {
  description = "Combined output of NAT Gateway resources, resource IDs, and public IP prefix values."
  value = {
    public_ip_prefix_values = module.nat_gateway.natgateway_public_ip_prefix_values
    resources               = module.nat_gateway.natgateway_resources
    resource_ids            = module.nat_gateway.natgateway_resource_ids
  }
}

