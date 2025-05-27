output "all_storage_sync_info" {
  description = "All information about the created Storage Sync Services, Storage Sync Groups, and Server Endpoints"
  value = {
    storage_sync_services = {
      for k, v in azurerm_storage_sync.this : k => {
        id   = v.id
        name = v.name
      }
    },
    storage_sync_groups = {
      for k, v in azurerm_storage_sync_group.this : k => {
        id              = v.id
        name            = v.name
        storage_sync_id = v.storage_sync_id
      }
    }
  }
}
