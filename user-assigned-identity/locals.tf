locals {

  mandatory_tags = tomap({
    environment         = var.environment
    app_id              = var.app_id
    msftmigration       = var.msftmigration
  })

  tags = {
    for key, value in var.managed_identity : key => merge(value.tags, local.mandatory_tags)
  }
}