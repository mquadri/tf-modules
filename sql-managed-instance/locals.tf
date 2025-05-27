locals {
  naming = "${var.resourcetype}-${var.appname}-${var.env}"
  mandatory_tags = {
    app_id        = var.appid
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}