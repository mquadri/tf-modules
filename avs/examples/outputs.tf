
output "credentials" {
  description = "This value returns the vcenter and nsxt cloudadmin credential values."
  sensitive   = true
  value       = module.avs-privatecloud.credentials
}

output "hcx_cloud_manager_endpoint_hostname" {
  description = "The hcx cloud manager's hostname"
  value       = module.avs-privatecloud.hcx_cloud_manager_endpoint_hostname
}

output "hcx_cloud_manager_endpoint_https" {
  description = "The full https endpoint for hcx cloud manager"
  value       = module.avs-privatecloud.hcx_cloud_manager_endpoint_https
}

output "identity" {
  description = "This output returns the managed identity values if the managed identity has been enabled on the module."
  value       = module.avs-privatecloud.identity
}

output "nsxt_manager_endpoint_hostname" {
  description = "The nsxt endpoint's hostname"
  value       = module.avs-privatecloud.nsxt_manager_endpoint_hostname
}

output "nsxt_manager_endpoint_https" {
  description = "The full https endpoint for nsxt manager."
  value       = module.avs-privatecloud.nsxt_manager_endpoint_https
}

output "public_ip" {
  description = "The public IP prefixes when a public ip config is configured for the private cloud."
  value       = module.avs-privatecloud.public_ip
}

output "resource" {
  description = "This output returns the full private cloud resource object properties."
  value       = module.avs-privatecloud.resource
}

output "resource_id" {
  description = "The azure resource if of the private cloud."
  value       = module.avs-privatecloud.resource_id
}

output "system_assigned_mi_principal_id" {
  description = "The principal id of the system managed identity assigned to the virtual machine"
  value       = module.avs-privatecloud.system_assigned_mi_principal_id
}

output "vcsa_endpoint_hostname" {
  description = "The vcsa endpoint's hostname"
  value       = module.avs-privatecloud.vcsa_endpoint_hostname
}

output "vcsa_endpoint_https" {
  description = "The full https endpoint for vcsa."
  value       = module.avs-privatecloud.vcsa_endpoint_https
}