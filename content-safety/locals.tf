locals {
  default_name = "${var.resourcetype}-${var.appname}-${var.env}-${var.location}-${var.additionalcontext}"
  var_name     = var.name == null ? "" : var.name
  name         = length(local.var_name) > 5 ? local.var_name : local.default_name

  mandatory_tags = tomap({
    environment   = var.environment
    app_id        = var.app_id
    msftmigration = var.msftmigration
  })

  tags = merge(var.tags, local.mandatory_tags)
}
