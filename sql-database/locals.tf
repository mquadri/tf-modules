locals {
  tags = tomap({
    environment   = var.environment
    app_id        = var.app_id
    msftmigration = var.msftmigration
  })
}