resource "time_static" "provisioned_date" {}
locals {
  subscription_name = var.subscription_name != null ? var.subscription_name : "${var.resourcetype}-${var.appname}-${var.env}-${var.additionalcontext}"

  app_id = var.app_id != null ? var.app_id : var.appid != null ? var.appid : "unknown"
  mandatory_tags = tomap({
    migration        = var.migration
    environment      = var.env
    app_id           = local.app_id
    provisioned_date = time_static.provisioned_date.rfc3339
  })

  tags = merge(var.tags, local.mandatory_tags)

}
