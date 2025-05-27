locals {
  naming    = "${var.resourcetype}-${var.appname}-${var.env}-${var.additionalcontext}"
  parent_id = var.parent_id != null ? var.parent_id : data.azurerm_resource_group.this.id
  scope     = var.applied_scopes != null ? var.applied_scopes : [data.azurerm_resource_group.this.id]
}