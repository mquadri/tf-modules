locals {
  naming = "${var.resourcetype}${var.appname}${var.env}"

  name = var.name != null ? var.name : "${local.naming}${var.additionalcontext}"

  mandatory_tags = tomap({
    environment   = var.environment
    app_id        = var.app_id
    msftmigration = var.msftmigration
  })

  tags = merge(var.tags, local.mandatory_tags)

}
