# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

# data "azurerm_synapse_workspace" "data_synapse" {
#   name                = var.azurerm_synapse_workspace_name
#   resource_group_name = var.synapse_resource_group_name
# }

resource "azurerm_synapse_sql_pool" "synapsesqlpool0000" {
  name                 = var.azurerm_synapse_sql_pool_name
  synapse_workspace_id = var.synapse_workspace_id # data.azurerm_synapse_workspace.data_synapse.id
  sku_name             = var.sku_name             #"DW100c"
  create_mode          = var.create_mode          #"Default"
  tags                 = var.tags
  data_encrypted       = var.data_encrypted

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
