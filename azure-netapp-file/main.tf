locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}

module "avm-res-netapp-netappaccount" {
  source  = "Azure/avm-res-netapp-netappaccount/azurerm"
  version = "0.1.0"

  for_each                          = var.anf_netapp
  location                          = each.value.location
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  active_directories                = each.value.active_directories
  backup_policies                   = each.value.backup_policies
  backup_vaults                     = each.value.backup_vaults
  capacity_pools                    = each.value.capacity_pools
  customer_managed_key              = each.value.customer_managed_key
  enable_telemetry                  = each.value.enable_telemetry
  inherit_tags_from_parent_resource = each.value.inherit_tags_from_parent_resource
  lock                              = each.value.lock
  managed_identities                = each.value.managed_identities
  role_assignments                  = each.value.role_assignments
  snapshot_policies                 = each.value.snapshot_policies
  subscription_id                   = each.value.subscription_id
  tags                              = merge(local.mandatory_tags, try(each.value.tags,{}))
  volumes                           = each.value.volumes
}