module "storageaccount" {
  source                                  = "../"
  location                                = var.location
  resource_group_name                     = var.resource_group_name
  name                                    = var.name
  account_tier                            = var.account_tier
  account_replication_type                = var.account_replication_type
  account_kind                            = var.account_kind
  access_tier                             = var.access_tier
  public_network_access_enabled           = var.public_network_access_enabled
  shared_access_key_enabled               = var.shared_access_key_enabled
  additionalcontext                       = var.additionalcontext
  appid                                   = var.appid
  appname                                 = var.appname
  resourcetype                            = var.resourcetype
  costAppOwnerManager                     = var.costAppOwnerManager
  costAppOwnerTech                        = var.costAppOwnerTech
  costBudgetOwner                         = var.costBudgetOwner
  costCostCenter                          = var.costCostCenter
  costDivision                            = var.costDivision
  costVP                                  = var.costVP
  env                                     = var.env
  costAllocation                          = var.costAllocation #(can only be sharedcosts or chargeback)
  appFunction                             = var.appFunction
  monthlyBudget                           = var.monthlyBudget
  costbaseline                            = var.costbaseline #(year resource created)
  sa_allow_nested_items_to_be_public      = var.sa_allow_nested_items_to_be_public
  sa_infrastructure_encryption_enabled    = var.sa_infrastructure_encryption_enabled
  shares                                  = var.shares
  containers                              = var.containers
  tables                                  = var.tables
  queues                                  = var.queues
  enable_telemetry                        = var.enable_telemetry
  share_properties                        = var.share_properties
  large_file_share_enabled                = var.large_file_share_enabled
  azure_files_authentication              = var.azure_files_authentication
  immutability_policy                     = var.immutability_policy
  is_hns_enabled                          = var.is_hns_enabled
  blob_properties                         = var.blob_properties
  table_encryption_key_type               = var.table_encryption_key_type
  queue_encryption_key_type               = var.queue_encryption_key_type
  queue_properties                        = var.queue_properties
  private_endpoints                       = var.private_endpoints
  storage_management_policy_rule          = var.storage_management_policy_rule
  storage_management_policy_timeouts      = var.storage_management_policy_timeouts
  diagnostic_settings_storage_account     = var.diagnostic_settings_storage_account
  diagnostic_settings_blob                = var.diagnostic_settings_blob
  diagnostic_settings_queue               = var.diagnostic_settings_queue
  diagnostic_settings_table               = var.diagnostic_settings_table
  diagnostic_settings_file                = var.diagnostic_settings_file
  storage_data_lake_gen2_filesystem       = var.storage_data_lake_gen2_filesystem
  customer_managed_key                    = var.customer_managed_key
  lock                                    = var.lock
  managed_identities                      = var.managed_identities
  private_endpoints_manage_dns_zone_group = var.private_endpoints_manage_dns_zone_group
  role_assignments                        = var.role_assignments
  allowed_copy_scope                      = var.allowed_copy_scope
  cross_tenant_replication_enabled        = var.cross_tenant_replication_enabled
  custom_domain                           = var.custom_domain
  default_to_oauth_authentication         = var.default_to_oauth_authentication
  edge_zone                               = var.edge_zone
  https_traffic_only_enabled              = var.https_traffic_only_enabled
  local_user                              = var.local_user
  min_tls_version                         = var.min_tls_version
  network_rules                           = var.network_rules
  nfsv3_enabled                           = var.nfsv3_enabled
  routing                                 = var.routing
  sas_policy                              = var.sas_policy
  sftp_enabled                            = var.sftp_enabled
  static_website                          = var.static_website
  timeouts                                = var.timeouts
  environment                             = var.environment
  app_id                                  = var.app_id
  msftmigration                           = var.msftmigration
}
