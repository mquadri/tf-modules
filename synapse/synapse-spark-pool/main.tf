# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_synapse_spark_pool" "synapsesparkpool0" {
  name                 = var.synapse_spark_pool_name
  synapse_workspace_id = var.synapse_workspace_id
  node_size_family     = var.node_size_family
  node_size            = var.node_size
  tags                 = var.tags

  auto_scale {
    max_node_count = var.max_node_count
    min_node_count = var.min_node_count
  }

  auto_pause {
    delay_in_minutes = var.delay_in_minutes
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
