module "vm-pattern" {
  source   = "../../vm"
  for_each = var.vm_config

  name                               = each.value.vm_name
  resource_group_name                = each.value.resource_group_name
  virtual_machine_size               = each.value.vm_size
  admin_username                     = each.value.admin_username
  vm_admin_pwd_keyvault_name         = var.vm_admin_pwd_keyvault_name
  machine_creds_akv_rg               = var.machine_creds_akv_rg
  additionalcontext                  = each.value.additionalcontext
  akv_resource_id                    = each.value.akv_resource_id
  availability_zone                  = each.value.availability_zone
  computer_name                      = each.value.computer_name
  location                           = var.location
  kernel_type                        = each.value.os_kernel_type
  generate_admin_password_or_ssh_key = each.value.generate_admin_password_or_ssh_key
  managed_identities                 = each.value.managed_identities
  app_id                             = each.value.tags.app_id
  appname                            = each.value.tags.appname
  appid                              = each.value.tags.appid
  env                                = each.value.tags.env
  costCostCenter                     = each.value.tags.costCenter
  costVP                             = each.value.tags.costVP
  costAppOwnerTech                   = each.value.tags.costAppOwnerTech
  costAppOwnerManager                = each.value.tags.costAppOwnerManager
  costBudgetOwner                    = each.value.tags.costBudgetOwner
  costDivision                       = each.value.tags.costDivision
  costAllocation                     = each.value.tags.costAllocation
  appFunction                        = each.value.tags.appFunction
  monthlyBudget                      = each.value.tags.monthlyBudget
  costbaseline                       = each.value.tags.costbaseline
  managed_by                         = each.value.tags.managed_by
  environment                        = each.value.tags.environment
  os_support                         = each.value.tags.os_support
  msftmigration                      = each.value.tags.msftmigration


  data_disk_enabled          = each.value.data_disk_config.data_disk_enabled
  data_disks                 = each.value.data_disk_config.data_disks
  disk_controller_type       = each.value.data_disk_config.disk_controller_type
  encryption_at_host_enabled = each.value.data_disk_config.encryption_at_host_enabled
  eviction_policy            = each.value.eviction_policy


  operating_system_disk_name              = each.value.os_disk_config.os_disk_name
  operating_system_disk_cache             = each.value.os_disk_config.os_disk_cache
  operating_system_disk_size_gb           = each.value.os_disk_config.os_disk_size_gb
  operating_system_disk_type              = each.value.os_disk_config.os_disk_type
  operating_system_disk_write_accelerator = each.value.os_disk_config.os_disk_write_accelerator
  plan                                    = each.value.plan
  source_image_publisher                  = each.value.source_image_config.publisher
  source_image_offer                      = each.value.source_image_config.offer
  source_image_sku                        = each.value.source_image_config.sku
  source_image_version                    = each.value.source_image_config.version

  network_interfaces          = each.value.network_interfaces
  default_private_nic_enabled = each.value.default_private_nic_enabled
  public_ip_enabled           = each.value.public_ip_enabled
  public_ip_sku               = (each.value.public_ip_enabled == true ? each.value.public_ip_sku : null)
  public_vnet                 = each.value.public_vnet_name
  public_vnet_rg              = each.value.public_vnet_rg
  public_subnet               = each.value.public_subnet
  public_nsg                  = each.value.public_nsg
  public_nsg_rg               = each.value.public_nsg_rg
  sr_sec_exception            = each.value.sr_sec_exception
  public_only                 = each.value.public_only
  nsg_diagnostic_settings     = each.value.nsg_diagnostic_settings

  machine_ssh_port          = each.value.machine_ssh_port
  additional_security_rules = each.value.additional_security_rules
  nsg_creation_enabled      = each.value.nsg_creation_enabled

  vnet_name                   = each.value.vnet_name
  subnet_name                 = each.value.subnet_name
  accelerated_networking      = each.value.accelerated_networking
  vnet_resource_group_name    = each.value.vnet_resource_group_name
  storage_analytics_name      = each.value.storage_analytics_name
  resource_group_storage_name = each.value.storage_account_rg_name

  auto_shutdown_enabled                  = each.value.auto_shutdown_config.auto_shutdown_enabled
  auto_shutdown_time                     = each.value.auto_shutdown_config.auto_shutdown_time
  auto_shutdown_timezone                 = each.value.auto_shutdown_config.auto_shutdown_timezone
  auto_shutdown_notification_enabled     = each.value.auto_shutdown_config.auto_shutdown_notification_enabled
  auto_shutdown_notification_time        = each.value.auto_shutdown_config.auto_shutdown_notification_time
  auto_shutdown_notification_webhook_url = each.value.auto_shutdown_config.auto_shutdown_notification_webhook_url

  additional_unattend_contents                           = each.value.additional_unattend_contents
  bypass_platform_safety_checks_on_user_schedule_enabled = each.value.bypass_platform_safety_checks_on_user_schedule_enabled
  capacity_reservation_group_resource_id                 = each.value.capacity_reservation_group_id
  proximity_placement_group                              = each.value.proximity_placement_group
  dedicated_host_group_resource_id                       = each.value.dedicated_host_group_resource_id
  dedicated_host_resource_id                             = each.value.dedicated_host_resource_id
  edge_zone                                              = each.value.edge_zone
  diagnostic_settings                                    = each.value.diagnostic_settings

  extensions          = each.value.extensions
  lock                = each.value.lock
  max_bid_price       = each.value.max_bid_price
  priority            = each.value.priority
  vtpm_enabled        = each.value.vtpm_enabled
  secure_boot_enabled = each.value.secure_boot_enabled

  azure_backup_configurations  = each.value.azure_backup_configurations
  license_type                 = each.value.license_type
  availability_set_resource_id = each.value.availability_set_resource_id
  source_image_resource_id     = each.value.source_image_resource_id

  create_recovery_vault                       = each.value.new_backup_config.create_recovery_vault
  recovery_create_resource_group              = each.value.new_backup_config.recovery_create_resource_group
  recovery_resource_group_name                = each.value.new_backup_config.recovery_resource_group_name
  recovery_rg_role_assignments                = each.value.new_backup_config.recovery_rg_role_assignments
  recovery_lock                               = each.value.new_backup_config.recovery_lock
  recovery_location                           = each.value.new_backup_config.recovery_location
  recovery_services_vault_name                = each.value.new_backup_config.recovery_services_vault_name
  recovery_vault_sku                          = each.value.new_backup_config.recovery_vault_sku
  recovery_vault_storage_mode_type            = each.value.new_backup_config.recovery_vault_storage_mode_type
  recovery_vault_cross_region_restore_enabled = each.value.new_backup_config.recovery_vault_cross_region_restore_enabled
  recovery_vault_soft_delete_enabled          = each.value.new_backup_config.recovery_vault_soft_delete_enabled
  recovery_vault_immutability                 = each.value.new_backup_config.recovery_vault_immutability
  recovery_enable_encryption                  = each.value.new_backup_config.recovery_enable_encryption
  recovery_vault_identity_type                = each.value.new_backup_config.recovery_vault_identity_type
  recovery_enable_private_endpoint            = each.value.new_backup_config.recovery_enable_private_endpoint
  recovery_subscription_id                    = each.value.new_backup_config.recovery_subscription_id
  recovery_pe_subnet_name                     = each.value.new_backup_config.recovery_pe_subnet_name
  recovery_virtual_network_name               = each.value.new_backup_config.recovery_virtual_network_name
  recovery_virtual_network_rg                 = each.value.new_backup_config.recovery_virtual_network_rg
  recovery_vm_backup_policies                 = each.value.new_backup_config.recovery_vm_backup_policies
  file_share_backup_policies                  = each.value.new_backup_config.file_share_backup_policies
  recovery_key_vault_key_name                 = each.value.new_backup_config.recovery_key_vault_key_name
  recovery_key_vault_name                     = each.value.new_backup_config.recovery_key_vault_name
  recovery_key_vault_rg_name                  = each.value.new_backup_config.recovery_key_vault_rg_name
  infrastructure_encryption_enabled           = each.value.new_backup_config.infrastructure_encryption_enabled
  recovery_kv_role_definition                 = each.value.new_backup_config.recovery_kv_role_definition
  user_assigned_identity_rg_name              = each.value.new_backup_config.user_assigned_identity_rg_name
  existing_user_assigned_identity_name        = each.value.new_backup_config.existing_user_assigned_identity_name
  recovery_vault_public_access_enabled        = each.value.new_backup_config.recovery_vault_public_access_enabled
  recovery_private_endpoints                  = each.value.new_backup_config.recovery_private_endpoints
  recovery_domain_name                        = each.value.new_backup_config.recovery_domain_name
  recovery_a_records                          = each.value.new_backup_config.recovery_a_records
  recovery_aaaa_records                       = each.value.new_backup_config.recovery_aaa_records
  recovery_cname_records                      = each.value.new_backup_config.recovery_cname_records
  recovery_enable_telemetry                   = each.value.new_backup_config.recovery_enable_telemetry
  recovery_mx_records                         = each.value.new_backup_config.recovery_mx_records
  recovery_ptr_records                        = each.value.new_backup_config.recovery_ptr_records
  recovery_soa_record                         = each.value.new_backup_config.recovery_soa_record
  recovery_srv_records                        = each.value.new_backup_config.recovery_srv_records
  recovery_tags                               = each.value.new_backup_config.recovery_tags
  recovery_txt_records                        = each.value.new_backup_config.recovery_txt_records
  recovery_virtual_network_links              = each.value.new_backup_config.recovery_virtual_network_links
  recovery_dns_zone_id                        = each.value.new_backup_config.recovery_dns_zone_id
  recovery_create_dns_zone                    = each.value.new_backup_config.recovery_create_dns_zone
  recovery_enable_diagnostic_setting          = each.value.new_backup_config.recovery_enable_diagnostic_setting
  recovery_diagnostics_settings_name          = each.value.new_backup_config.recovery_diagnostics_settings_name
  recovery_log_categories                     = each.value.new_backup_config.recovery_log_categories
  recovery_excluded_log_categories            = each.value.new_backup_config.recovery_excluded_log_categories
  recovery_metric_categories                  = each.value.new_backup_config.recovery_metric_categories
  recovery_logs_destinations_ids              = each.value.new_backup_config.recovery_logs_destinations_ids
  recovery_log_analytics_destination_type     = each.value.new_backup_config.recovery_log_analytics_destination_type
}
