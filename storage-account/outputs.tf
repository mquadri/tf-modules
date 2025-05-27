output "storage_account_details" {
  description = " Details of the storage account."
  value = {
    name              = module.avm-res-storage-storageaccount.name
    id                = module.avm-res-storage-storageaccount.resource_id
    fqdn              = module.avm-res-storage-storageaccount.fqdn
    shares            = module.avm-res-storage-storageaccount.shares
    queues            = module.avm-res-storage-storageaccount.queues
    tables            = module.avm-res-storage-storageaccount.tables
    containers        = module.avm-res-storage-storageaccount.containers
    resource          = module.avm-res-storage-storageaccount.resource
    private_endpoints = module.avm-res-storage-storageaccount.private_endpoints
  }
  sensitive = true
}