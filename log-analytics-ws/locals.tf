locals {
  naming = "${var.appname}-${var.env}-${var.location}"

  tags = {
    environment   = var.environment
    app_id        = var.app_id
    msftmigration = var.msftmigration
  }

  identity_type = var.additional_identities != null ? "SystemAssigned, UserAssigned" : "SystemAssigned"
}