# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

data "azurerm_client_config" "current" {
}

resource "azurerm_synapse_workspace" "synapse0000" {
  name                                 = var.azurerm_synapse_workspace_name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = "https://${var.azurerm_storage_account_data_lake_name}.dfs.core.windows.net/${var.synapse_storage_container_name}"
  sql_administrator_login              = var.sql_administrator_login
  sql_administrator_login_password     = var.sql_administrator_login_password
  managed_virtual_network_enabled      = var.managed_virtual_network_enabled
  sql_identity_control_enabled         = var.sql_identity_control_enabled
  tags                                 = var.tags

  aad_admin {
    login     = var.aad_admin_login
    object_id = var.aad_admin_object_id
    tenant_id = data.azurerm_client_config.current.tenant_id
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
