# Local variables
locals {

  appName = substr(var.appname, 0, 5)

  virtual_machine_name = substr("vm-shir-${var.location}-${local.naming}", 0, 61)

  windows_machine_name = substr("vm${local.appName}${var.resourcetype}${var.env}${var.location}", 0, 12)


  admin_username = (var.admin_username != "" ? var.admin_username : random_string.username.result)
  admin_password = (var.admin_password != "" ? var.admin_password : try(random_password.password[0].result, ""))

  machine_creds_akv_name = (var.machine_creds_akv_name != "" ? var.machine_creds_akv_name : "kv-${local.naming}")

  machine_creds_akv_rg = (var.machine_creds_akv_rg != "" ? var.machine_creds_akv_rg : var.resource_group_name)

  # Validation

  validate_user_assigned_identity = ((strcontains(local.identity_type, "UserAssigned") && length(local.userIdentities) == 0) ?
  file("ERROR: identity_ids must be provided when using User Assigned identity") : true)

  validate_utra_ssd = ((var.ultra_ssd_enabled == true && var.availability_zone == null) ?
  file("ERROR: variable for availability_zone is required when ultra_ssd_enabled is true.") : var.ultra_ssd_enabled)

}

# data

data "azurerm_key_vault" "ssh_akv" {
  name                = local.machine_creds_akv_name
  resource_group_name = local.machine_creds_akv_rg
}

data "azurerm_subnet" "subnet" {
  name                 = var.main_subnet_name
  resource_group_name  = data.azurerm_resource_group.vnet-rg.name
  virtual_network_name = var.vnet_name
}


data "azurerm_storage_account" "diagstorage" {
  count               = ((var.storage_analytics_name != null) ? 1 : 0)
  name                = var.storage_analytics_name
  resource_group_name = var.resource_group_storage_name != null ? var.resource_group_storage_name : var.resource_group_name
}

# Randoms
resource "random_string" "windows_name" {
  length  = 15
  special = false
}

resource "random_string" "username" {
  length  = 20
  special = false
}

resource "random_password" "password" {
  count = (var.admin_password == "" ? 1 : 0)

  length           = 32
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
  special          = true
  override_special = "!@#$%*()-_=+[]{}:?"
}

resource "azurerm_network_interface" "dynamic" {
  count               = var.total_machine_count
  name                = "nic-${local.naming}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = local.tags
  /*accelerated_networking_enabled = var.accelerated_networking
  ip_forwarding_enabled          = false*/

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = null
  }

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]

  }

}

resource "azurerm_network_security_group" "shir" {
  name                = "nsg-shir-${local.naming}"
  location            = data.azurerm_resource_group.vnet-rg.location
  resource_group_name = data.azurerm_resource_group.vnet-rg.name
  tags                = local.tags
  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]

  }
}

resource "azurerm_network_interface_security_group_association" "main" {
  count                     = var.total_machine_count
  network_interface_id      = azurerm_network_interface.dynamic[count.index].id
  network_security_group_id = azurerm_network_security_group.shir.id
}

resource "azurerm_proximity_placement_group" "primary" {
  count               = (var.total_machine_count > 1 ? 1 : 0)
  name                = "pgp-shir-${local.naming}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = local.tags
  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]

  }
}

# Windows
resource "azurerm_windows_virtual_machine" "windows" {
  count = var.total_machine_count

  name                = format("${local.virtual_machine_name}-%03s", (count.index + 1))
  computer_name       = format("${local.windows_machine_name}%03s", (count.index + 1))
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = merge(local.tags, { "name" : "${local.virtual_machine_name}-${count.index + 1}", "computer_name" : local.windows_machine_name })

  size                         = var.virtual_machine_size
  admin_username               = local.admin_username
  admin_password               = local.admin_password
  network_interface_ids        = [azurerm_network_interface.dynamic[count.index].id]
  proximity_placement_group_id = (var.total_machine_count > 1 ? azurerm_proximity_placement_group.primary[0].id : null)

  source_image_reference {
    publisher = var.source_image_publisher
    offer     = var.source_image_offer
    sku       = var.source_image_sku
    version   = var.source_image_version
  }

  dynamic "boot_diagnostics" {
    for_each = var.enable_boot_diagnostics ? ["enabled"] : []
    content {
      storage_account_uri = (var.storage_analytics_name != null ? data.azurerm_storage_account.diagstorage[0].primary_blob_endpoint : null)
    }
  }

  os_disk {
    name                      = format("osdisk-${local.virtual_machine_name}-%03s", (count.index + 1))
    caching                   = var.operating_system_disk_cache
    storage_account_type      = var.operating_system_disk_type
    write_accelerator_enabled = var.operating_system_disk_write_accelerator
  }

  dynamic "additional_capabilities" {
    for_each = local.validate_utra_ssd ? ["enabled"] : []
    content {
      ultra_ssd_enabled = var.ultra_ssd_enabled
    }
  }

  zone = var.availability_zone

  dynamic "identity" {
    for_each = local.validate_user_assigned_identity ? ["enabled"] : []
    content {
      type         = local.identity_type
      identity_ids = local.userIdentities
    }
  }

  lifecycle {
    ignore_changes = [
      tags["provisioned_date"]
    ]
  }

}


# Data Disks

resource "azurerm_managed_disk" "data" {
  count                = var.data_disk_enabled ? var.total_machine_count : 0
  name                 = format("disk-${local.virtual_machine_name}-%03s", (count.index + 1))
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.data_disk_type
  create_option        = var.data_disk_create_option
  disk_size_gb         = var.data_disk_size_gb
  tags                 = local.tags
}


resource "azurerm_virtual_machine_data_disk_attachment" "windows" {
  count              = var.data_disk_enabled ? 1 : 0
  managed_disk_id    = azurerm_managed_disk.data[(count.index)].id
  virtual_machine_id = azurerm_windows_virtual_machine.windows[(count.index)].id
  lun                = var.data_disk_machine_lun
  caching            = var.data_disk_caching
  depends_on         = [azurerm_managed_disk.data]
}

resource "azurerm_key_vault_secret" "admin_creds" {
  name            = "${var.appname}-shir-username-credentials"
  value           = local.admin_password
  key_vault_id    = data.azurerm_key_vault.ssh_akv.id
  content_type    = "Azure USER PASS secret ${var.appname} "
  expiration_date = timeadd(timestamp(), "8760h")
  tags = {
    type     = "username",
    username = local.admin_username
  }
}


resource "azurerm_virtual_machine_extension" "winconfig" {
  count                      = var.total_machine_count
  name                       = "winconfig-${local.naming}-${count.index + 1}"
  virtual_machine_id         = azurerm_windows_virtual_machine.windows[count.index].id
  publisher                  = "Microsoft.GuestConfiguration"
  type                       = "ConfigurationforWindows"
  type_handler_version       = "1.29"
  auto_upgrade_minor_version = "true"
  tags                       = local.tags

  depends_on = [azurerm_windows_virtual_machine.windows]
}

resource "azurerm_policy_virtual_machine_configuration_assignment" "passpolicy" {
  count              = var.total_machine_count
  name               = "passpolicy-${local.naming}-${count.index + 1}"
  location           = azurerm_windows_virtual_machine.windows[count.index].location
  virtual_machine_id = azurerm_windows_virtual_machine.windows[count.index].id

  configuration {
    assignment_type = "ApplyAndMonitor"
    version         = "1.*"

    parameter {
      name  = "Minimum Password Length;ExpectedValue"
      value = "16"
    }
    parameter {
      name  = "Minimum Password Age;ExpectedValue"
      value = "0"
    }
    parameter {
      name  = "Maximum Password Age;ExpectedValue"
      value = "30,45"
    }
    parameter {
      name  = "Enforce Password History;ExpectedValue"
      value = "10"
    }
    parameter {
      name  = "Password Must Meet Complexity Requirements;ExpectedValue"
      value = "1"
    }
  }

  depends_on = [
    azurerm_windows_virtual_machine.windows
  ]

}


# Backup machine

resource "azurerm_recovery_services_vault" "recovery" {
  name                = "arsv-recovery-vault-${local.naming}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.recovery_sku
  tags                = local.tags
}

resource "azurerm_backup_policy_vm" "backup_policy" {
  name                = "az-bk-${local.naming}"
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.recovery.name

  timezone = "UTC"

  backup {
    frequency = "Daily"
    time      = "23:00"
  }
  retention_daily {
    count = 10
  }
}

resource "azurerm_backup_protected_vm" "protection" {
  count               = var.total_machine_count
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.recovery.name
  source_vm_id        = azurerm_windows_virtual_machine.windows[count.index].id
  backup_policy_id    = azurerm_backup_policy_vm.backup_policy.id

  depends_on = [
    azurerm_backup_policy_vm.backup_policy,
    azurerm_recovery_services_vault.recovery,
    azurerm_windows_virtual_machine.windows
  ]
}



# Integration Runtime

resource "azurerm_data_factory_integration_runtime_self_hosted" "shir" {
  data_factory_id = azurerm_data_factory.adf.id
  name            = "shir-${local.naming}-${var.additionalcontext}"
  description     = var.integration_runtime_description
}

resource "azurerm_virtual_machine_extension" "shir_extension" {
  count = var.total_machine_count

  name                       = "shir-extension-${local.naming}-${var.additionalcontext}-${count.index + 1}"
  virtual_machine_id         = azurerm_windows_virtual_machine.windows[count.index].id
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.10"
  auto_upgrade_minor_version = true
  tags                       = local.tags

  settings = <<SETTINGS
    {
      "fileUris": ["https://raw.githubusercontent.com/Azure/Azure-DataFactory/main/SamplesV2/SelfHostedIntegrationRuntime/AutomationScripts/InstallGatewayOnLocalMachine.ps1","${var.download_shir_uri}"],
      "commandToExecute": "${join(" ", ["powershell -ExecutionPolicy Unrestricted  -File InstallGatewayOnLocalMachine.ps1", "-path ${local.shir_dowload_file} -remoteAccessPort ${var.adf_high_availability_port} -authKey ${azurerm_data_factory_integration_runtime_self_hosted.shir.primary_authorization_key}"])}"
    }
  SETTINGS

  depends_on = [azurerm_windows_virtual_machine.windows]

}

resource "time_sleep" "wait_1_minutes_akv" {
  depends_on = [azurerm_virtual_machine_extension.shir_extension]

  create_duration = "60s"
}

resource "time_sleep" "wait_1_minutes_pass" {
  depends_on = [time_sleep.wait_1_minutes_akv]

  create_duration = "60s"
}

resource "time_sleep" "wait_1_minutes_id" {
  depends_on = [time_sleep.wait_1_minutes_pass]

  create_duration = "60s"
}
