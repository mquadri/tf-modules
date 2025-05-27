# tflint-ignore: terraform_required_providers
terraform {
  required_version = ">=0.13"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      recover_soft_deleted_key_vaults = true
      purge_soft_delete_on_destroy    = false
    }
  }
}

locals {
  tags = {
    appid          = "SYSGEN787949841"
    costCostCenter = "S0019742"
    costVP         = "Mark Howe"
    environment    = "DEV"
  }
}

/*  data "azurerm_key_vault" "keyvault" {
  name                = "Infra.Ops-CCOE-HCA-key-management-rg"
  resource_group_name = "Infra.Ops-CCOE-HCA-key-management-rg"
}  */

data "azurerm_subnet" "vm_subnet" {
  name                 = "subnet1"
  virtual_network_name = "test-vnet"
  resource_group_name  = "Infra.Ops-CCOE-HCA-test-rg"
}

resource "random_password" "win_password" {
  length      = 20
  lower       = true
  upper       = true
  special     = true
  min_lower   = 1
  min_upper   = 1
  min_special = 1
}

resource "random_id" "id" {
  byte_length = 2
}

module "windows" {
  source = "git@github.com:CenturyLink/tf-modules-azure-virtual-machine.git?ref=main"
  #source = "../"

  location            = "northcentralus"
  image_os            = "windows"
  resource_group_name = "Infra.Ops-CCOE-HCA-test-rg"
  data_disks = [
    for i in range(2) : {
      name                 = "windowsdisk${random_id.id.hex}${i}"
      storage_account_type = "Standard_LRS"
      create_option        = "Empty"
      disk_size_gb         = 1
      attach_setting = {
        lun     = i
        caching = "ReadWrite"
      }
    }
  ]
  new_boot_diagnostics_storage_account = {
    name                      = "windowsdiag${random_id.id.hex}"
    storage_account_sku       = "Standard_LRS"
    access_tier               = "Cool"
    enable_https_traffic_only = true
  }
  new_network_interface = {
    ip_forwarding_enabled = false
    ip_configurations = [
      {
        primary = true
      }
    ]
  }
  admin_username = "azureuser"
  admin_password = random_password.win_password.result
  name           = "windows-${random_id.id.hex}"
  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  os_simple = "WindowsServer"
  size      = "Standard_DS1_v2"
  subnet_id = data.azurerm_subnet.vm_subnet.id
  tags      = local.tags
}
