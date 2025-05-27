resource "azapi_resource" "fabric_capacity" {
  type                      = "Microsoft.Fabric/capacities@2023-11-01"
  name                      = local.name
  parent_id                 = data.azurerm_resource_group.rg.id
  location                  = var.location
  schema_validation_enabled = false

  body = jsonencode({
    properties = {
      administration = {
        members = var.administration_members
      }
    }
    sku = {
      name = var.sku_name,
      tier = "Fabric"
    }
  })
  tags = local.tags
}
