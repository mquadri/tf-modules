locals {
  naming = "${var.resourcetype}-${var.appname}-${var.environment}-${var.location}"

  name = var.name != null ? var.name : "${local.naming}-${var.additionalcontext}"

  os_support_value = {
    exits = {
      os_support = var.os_support
    }
    not_exists = {}
  }

  mandatory_tags = tomap({
    migration   = var.migration
    environment = var.environment
    app_id      = lower(var.app_id)
  })

  optional_tags = merge(
    local.os_support_value[var.os_support != "" ? "exits" : "not_exists"]
  )

  tags = merge(var.tags, local.mandatory_tags, local.optional_tags)

}
