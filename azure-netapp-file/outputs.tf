output "backup_policies_resource_ids" {
  description = "The Resource IDs of the Azure Netapp Files Account Backup Policies in a map alongside the map key specified in `var.backup_policies`"
  value       = { for key, netapp in module.avm-res-netapp-netappaccount : key => netapp.backup_policies_resource_ids }
}

output "backup_vaults_resource_ids" {
  description = "The Resource IDs of the Azure Netapp Files Account Backup Vaults in a map alongside the map key specified in `var.backup_vaults`"
  value       = { for key, netapp in module.avm-res-netapp-netappaccount : key => netapp.backup_vaults_resource_ids }
}

output "name" {
  description = "The name of the Azure Netapp Files Account"
  value       = { for key, netapp in module.avm-res-netapp-netappaccount : key => netapp.name }
}

output "resource_id" {
  description = "The Resource ID of the Azure Netapp Files Account"
  value       = { for key, netapp in module.avm-res-netapp-netappaccount : key => netapp.resource_id }
}

output "snapshot_policies_resource_ids" {
  description = "The Resource IDs of the Azure Netapp Files Account Snapshot Policies in a map alongside the map key specified in `var.snapshot_policies`"
  value       = { for key, netapp in module.avm-res-netapp-netappaccount : key => netapp.snapshot_policies_resource_ids }
}

output "volumes_resource_ids" {
  description = "The Resource IDs of the Azure Netapp Files Volumes in a map alongside the map key specified in `var.volumes`"
  value       = { for key, netapp in module.avm-res-netapp-netappaccount : key => netapp.volumes_resource_ids }
}