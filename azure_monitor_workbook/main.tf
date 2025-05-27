data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}


locals {
  mandatory_tags = {
    app_id              = var.app_id
    environment         = var.environment
    msftmigration       = var.msftmigration
  }
}



resource "azurerm_application_insights_workbook" "azworkspace" {
  name                = uuid()
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  display_name        = var.workbook_name
  data_json = jsonencode({
    "version"  = var.data_json_version,
    "items"    = var.data_items,
    "isLocked" = false,
    "fallbackResourceIds" = [
      "Azure Monitor"
    ]
  })
  tags = merge(local.mandatory_tags,try(var.tags,{}))
}
