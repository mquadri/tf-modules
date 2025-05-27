output "backup_policies_resource_ids" {
  description = "The Resource IDs of the Azure Netapp Files Account Backup Policies in a map alongside the map key specified in `var.backup_policies`"
  value       = module.avm-res-netapp-netappaccount.backup_policies_resource_ids
}

output "backup_vaults_resource_ids" {
  description = "The Resource IDs of the Azure Netapp Files Account Backup Vaults in a map alongside the map key specified in `var.backup_vaults`"
  value       = module.avm-res-netapp-netappaccount.backup_vaults_resource_ids
}

output "name" {
  description = "The name of the Azure Netapp Files Account"
  value       = module.avm-res-netapp-netappaccount.name
}

output "resource_id" {
  description = "The Resource ID of the Azure Netapp Files Account"
  value       = module.avm-res-netapp-netappaccount.resource_id
}

output "snapshot_policies_resource_ids" {
  description = "The Resource IDs of the Azure Netapp Files Account Snapshot Policies in a map alongside the map key specified in `var.snapshot_policies`"
  value       = module.avm-res-netapp-netappaccount.snapshot_policies_resource_ids
}

output "volumes_resource_ids" {
  description = "The Resource IDs of the Azure Netapp Files Volumes in a map alongside the map key specified in `var.volumes`"
  value       = module.avm-res-netapp-netappaccount.volumes_resource_ids
}