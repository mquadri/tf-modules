locals {
  mandatory_tags = tomap({
    msftmigration = var.msftmigration
    environment   = var.environment
    app_id        = var.app_id
  })

  tags = merge(var.tags, local.mandatory_tags)

}