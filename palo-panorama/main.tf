locals {
  naming = "${var.appname}-${var.env}-${var.location}"

  tags = {
    appid               = var.appid
    appname             = var.appname
    resourcetype        = var.resourcetype
    costAppOwnerManager = var.costAppOwnerManager
    costAppOwnerTech    = var.costAppOwnerTech
    costBudgetOwner     = var.costBudgetOwner
    costCostCenter      = var.costCostCenter
    costDivision        = var.costDivision
    costRegion          = var.location
    costVP              = var.costVP
    environment         = var.env
    costAllocation      = var.costAllocation #(can only be sharedcosts or chargeback)
    appFunction         = var.appFunction
    monthlyBudget       = var.monthlyBudget
    costbaseline        = var.costbaseline #(year resource created)
    provisioned_by      = "Terraform"
    provisioned_date    = timestamp()
  }
}

#resource group
data "azurerm_resource_group" "rg_vm" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_resource_group_name
}

# Create a public IP for management
resource "azurerm_public_ip" "this" {
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg_vm.name
  name                = "pip-pan-${local.naming}-${var.additionalcontext}"
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = var.enable_zones ? var.avzones : null
  tags                = local.tags
}

# Build Panorama interface
resource "azurerm_network_interface" "this" {
  name                          = "nic-pan-${local.naming}-${var.additionalcontext}"
  location                      = var.location
  resource_group_name           = data.azurerm_resource_group.rg_vm.name
  enable_accelerated_networking = false
  enable_ip_forwarding          = false
  tags                          = local.tags

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id
  }
}

# Build the Panorama VM
resource "azurerm_virtual_machine" "panorama" {
  name                         = "pan-${local.naming}-${var.additionalcontext}"
  location                     = var.location
  resource_group_name          = data.azurerm_resource_group.rg_vm.name
  primary_network_interface_id = azurerm_network_interface.this.id
  vm_size                      = var.panorama_size
  network_interface_ids        = [azurerm_network_interface.this.id]

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    id        = var.custom_image_id
    publisher = var.custom_image_id == null ? var.panorama_publisher : null
    offer     = var.custom_image_id == null ? var.panorama_offer : null
    sku       = var.custom_image_id == null ? var.panorama_sku : null
    version   = var.custom_image_id == null ? var.panorama_version : null
  }

  storage_os_disk {
    name              = "disk-pan-${local.naming}-${var.additionalcontext}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.panorama_disk_type
  }

  os_profile {
    computer_name  = azurerm_virtual_machine.panorama.name
    admin_username = var.username
    admin_password = var.password
  }

  dynamic "boot_diagnostics" {
    for_each = var.boot_diagnostic_storage_uri != null ? [1] : []
    content {
      enabled     = true
      storage_uri = var.boot_diagnostic_storage_uri
    }
  }

  os_profile_linux_config {
    disable_password_authentication = var.password == null ? true : false
    dynamic "ssh_keys" {
      for_each = var.ssh_keys
      content {
        key_data = ssh_keys.value
        path     = "/home/${var.username}/.ssh/authorized_keys"
      }
    }
  }

  dynamic "plan" {
    for_each = var.enable_plan ? ["one"] : []

    content {
      name      = var.panorama_sku
      publisher = var.panorama_publisher
      product   = var.panorama_offer
    }
  }
  zones = var.enable_zones && var.avzone != null && var.avzone != "" ? [var.avzone] : null
  tags  = var.tags
}

# Panorama managed disk
resource "azurerm_managed_disk" "this" {
  for_each = var.logging_disks

  name                 = "disk-pan-${local.naming}-${each.key}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = try(each.value.disk_type, "Standard_LRS")
  create_option        = "Empty"
  disk_size_gb         = try(each.value.size, "2048")
  zone                 = var.enable_zones ? try(var.avzone, null) : null

  tags = var.tags
}

# Attach logging disk to Panorama VM
resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  for_each = azurerm_managed_disk.this

  managed_disk_id    = each.value.id
  virtual_machine_id = azurerm_virtual_machine.panorama.id
  lun                = var.logging_disks[each.key].lun
  caching            = "ReadWrite"
}