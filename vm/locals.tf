locals {

  naming = var.additionalcontext != "" ? "${var.resourcetype}-${var.appname}-${var.env}-${var.additionalcontext}" : "${var.resourcetype}-${var.appname}-${var.env}"

  basename_length = (length("vm${var.env}${var.location}") + 3)
  appname         = (var.kernel_type == "linux" ? ((local.basename_length + length(var.appname) + 4) >= 64) ? substr(var.appname, 0, ((local.basename_length + length(var.appname) + 4)) - 64) : var.appname : substr(var.appname, 0, 5))

  nsg_name = substr("${var.location}-${local.naming}", 0, 61)

  virtual_machine_name = substr("vm-${var.location}-${local.naming}", 0, 61)

  # commented for future implementation
  windows_machine_name = substr("${local.appname}${var.env}${var.location}", 0, 12)

  admin_username = (var.admin_username != "" ? var.admin_username : random_string.username.result)

  computer_name = var.kernel_type == "windows" ? local.windows_machine_name : local.virtual_machine_name

  machine_creds_akv_name = (var.vm_admin_pwd_keyvault_name != "" ? var.vm_admin_pwd_keyvault_name : "kv-${local.naming}")

  machine_creds_akv_rg = (var.machine_creds_akv_rg != "" ? var.machine_creds_akv_rg : var.resource_group_name)

  # Validation

  # tflint-ignore: terraform_unused_declarations
  validate_user_assigned_identity = ((lower(var.identity_type) == "userassigned" && length(var.identity_ids) == 0) ?
  file("ERROR: identity_ids must be provided when using User Assigned identity") : true)

  # tflint-ignore: terraform_unused_declarations
  validate_utra_ssd = ((var.ultra_ssd_enabled == true && var.availability_zone == null) ?
  file("ERROR: variable for availability_zone is required when ultra_ssd_enabled is true.") : var.ultra_ssd_enabled)

  # tflint-ignore: terraform_unused_declarations
  validate_capacity_proximity = (var.capacity_reservation_group_resource_id != null && var.proximity_placement_group != null) ? file("ERROR: capacity_proximity_placement_group_id must be provided when capacity_reservation_group_resource_id is provided.") : true

  # tflint-ignore: terraform_unused_declarations
  validate_host_resource = (var.dedicated_host_group_resource_id != null && var.dedicated_host_resource_id != null) ? file("ERROR: dedicated_host_group_resource_id conflicts with dedicated_host_resource_id") : true

  mandatory_tags = {
    environment   = var.environment
    app_id        = var.app_id
    msftmigration = var.msftmigration
    os_support    = var.os_support
  }

  tags_public = var.public_ip_enabled ? merge(local.mandatory_tags, { srEecException = var.sr_sec_exception }) : local.mandatory_tags

  validate_public_ip_has_exception = var.public_ip_enabled ? (var.sr_sec_exception == "" ? file("ERROR: sr_sec_exception must be provided when public_ip_enabled is true.") : true) : true

  source_image_reference = {
    publisher = var.source_image_publisher
    offer     = var.source_image_offer
    sku       = var.source_image_sku
    version   = var.source_image_version
  }
}

resource "validation_warning" "validate_public_ip_has_exception" {
  condition = local.validate_public_ip_has_exception != null
  summary   = "WARNING: Deprecation Notice, validate_public_ip_has_exception is not loger used, please remove this variable from your configuration"
}


