locals {
  frontend_ip_configurations = flatten([
    for lb in data.azurerm_lb.this : [
      for config in lb.frontend_ip_configuration : {
        name = config.name
        id   = config.id
      }
    ]
  ])
  frontend_ip_configurations_map = {
    for config in local.frontend_ip_configurations : config.name => config.id
  }
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}
