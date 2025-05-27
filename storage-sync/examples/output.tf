output "all_storage_sync_info" {
  description = "All information about the created Storage Sync Services, Storage Sync Groups, and Server Endpoints"
  value       = module.storage_sync.all_storage_sync_info
}