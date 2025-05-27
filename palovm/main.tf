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

resource "azurerm_availability_set" "backend" {
  name                         = "avs-palo-${local.naming}-${var.additionalcontext}"
  location                     = data.azurerm_resource_group.rg_vm.location
  resource_group_name          = data.azurerm_resource_group.rg_vm.name
  platform_update_domain_count = "5"
  platform_fault_domain_count  = "3"
  managed                      = false

  tags = local.tags
}

resource "azurerm_public_ip" "mgmt" {
  location            = data.azurerm_resource_group.rg_vm.location
  resource_group_name = data.azurerm_resource_group.rg_vm.name
  name                = "pip-mgmt-palo-${local.naming}-${var.additionalcontext}"
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = var.enable_zones ? var.avzones : null
  tags                = local.tags
}

resource "azurerm_public_ip" "public-untrust" {
  location            = data.azurerm_resource_group.rg_vm.location
  resource_group_name = data.azurerm_resource_group.rg_vm.name
  name                = "pip-untrust-palo-${local.naming}-${var.additionalcontext}"
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = var.enable_zones ? var.avzones : null
  tags                = local.tags
}

resource "azurerm_network_interface" "mgmt" {
  name                          = "nic-mgmt-palo-${local.naming}-${var.additionalcontext}"
  location                      = data.azurerm_resource_group.rg_vm.location
  resource_group_name           = data.azurerm_resource_group.rg_vm.name
  enable_accelerated_networking = false # for interface 0 it is unsupported by PAN-OS
  enable_ip_forwarding          = false # for interface 0 use false per Reference Arch
  tags                          = local.tags

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.mgmt_subnet_id
    private_ip_address_allocation = "Static"
    public_ip_address_id          = azurerm_public_ip.mgmt.id
  }
}

resource "azurerm_network_interface" "public-untrust" {
  name                          = "nic-untrust-palo-${local.naming}-${var.additionalcontext}"
  location                      = data.azurerm_resource_group.rg_vm.location
  resource_group_name           = data.azurerm_resource_group.rg_vm.name
  enable_accelerated_networking = true # for interface 0 it is unsupported by PAN-OS
  enable_ip_forwarding          = true # for interface 0 use false per Reference Arch
  tags                          = local.tags

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.public_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public-untrust.id
  }
}

resource "azurerm_network_interface" "private-trust" {
  name                          = "nic-trust-palo-${local.naming}-${var.additionalcontext}"
  location                      = data.azurerm_resource_group.rg_vm.location
  resource_group_name           = data.azurerm_resource_group.rg_vm.name
  enable_accelerated_networking = true # for interface 0 it is unsupported by PAN-OS
  enable_ip_forwarding          = true # for interface 0 use false per Reference Arch
  tags                          = local.tags

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.private_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "ha2" {
  name                          = "nic-ha2-palo-${local.naming}-${var.additionalcontext}"
  location                      = data.azurerm_resource_group.rg_vm.location
  resource_group_name           = data.azurerm_resource_group.rg_vm.name
  enable_accelerated_networking = true # for interface 0 it is unsupported by PAN-OS
  enable_ip_forwarding          = true # for interface 0 use false per Reference Arch
  tags                          = local.tags

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.ha2_subnet_id
    private_ip_address_allocation = "Static"
  }
}

resource "azurerm_virtual_machine" "one" {
  name                         = var.name
  location                     = data.azurerm_resource_group.rg_vm.location
  resource_group_name          = data.azurerm_resource_group.rg_vm.name
  tags                         = local.tags
  vm_size                      = var.vm_size
  zones                        = var.enable_zones && var.avzone != null && var.avzone != "" ? [var.avzone] : null
  availability_set_id          = azurerm_availability_set.backend.id
  primary_network_interface_id = azurerm_network_interface.mgmt.id

  network_interface_ids = [azurerm_network_interface.public-untrust.id, azurerm_network_interface.private-trust.id, azurerm_network_interface.ha2.id]

  storage_image_reference {
    publisher = var.img_publisher
    offer     = var.img_offer
    sku       = var.img_sku
    version   = var.img_version
  }

  dynamic "plan" {
    for_each = var.enable_plan ? ["one"] : []

    content {
      name      = var.img_sku
      publisher = var.img_publisher
      product   = var.img_offer
    }
  }

  storage_os_disk {
    create_option     = "FromImage"
    name              = var.name
    managed_disk_type = var.managed_disk_type
    os_type           = "Linux"
    caching           = "ReadWrite"
  }

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  os_profile {
    computer_name  = var.name
    admin_username = var.username
    admin_password = var.password
    custom_data    = var.bootstrap_options
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  # After converting to azurerm_linux_virtual_machine, an empty block boot_diagnostics {} will use managed storage. Want.
  # 2.36 in required_providers per https://github.com/terraform-providers/terraform-provider-azurerm/pull/8917
  dynamic "boot_diagnostics" {
    for_each = var.diagnostics_storage_uri != null ? ["one"] : []

    content {
      enabled     = true
      storage_uri = var.diagnostics_storage_uri
    }
  }

  identity {
    type = var.identity_type
  }
}

resource "azurerm_application_insights" "this" {
  name                = "appinsights-palo-vm-${local.naming}-${var.additionalcontext}"
  location            = data.azurerm_resource_group.rg_vm.location
  resource_group_name = data.azurerm_resource_group.rg_vm.name
  application_type    = "other"
  retention_in_days   = var.metrics_retention_in_days
  tags                = local.tags
}