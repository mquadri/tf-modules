resource "azapi_resource" "reserved-instances" {
  type      = "Microsoft.Capacity/reservationOrders@2022-03-01"
  name      = local.naming
  location  = var.location
  parent_id = local.parent_id
  body = jsonencode({
    properties = {
      appliedScopes    = local.scope
      appliedScopeType = var.applied_scope_type
      billingPlan      = var.billing_plan
      billingScopeId   = "/subscriptions/${var.subscription_id}"
      displayName      = var.display_name
      quantity         = var.quantity
      renew            = var.renew
      reservedResourceProperties = {
        instanceFlexibility = var.instance_flexibility
      }
      reservedResourceType = var.reserved_resource_type
      term                 = var.term
    }
    sku = {
      name = var.sku_name
    }
  })
}