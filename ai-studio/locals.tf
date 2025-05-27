locals {
  naming              = "${var.appname}-${var.env}-${var.additionalcontext}"
  publicNetworkAccess = var.public_network_access_enabled ? "Enabled" : "Disabled"

  mandatory_tags = tomap({
    environment   = var.environment
    app_id        = var.app_id
    msftmigration = var.msftmigration
  })

  tags = merge(var.tags, local.mandatory_tags)
}
