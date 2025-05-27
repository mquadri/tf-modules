module "avm-res-network-nsg" {
  count               = var.nsg_creation_enabled ? 1 : 0
  source              = "Azure/avm-res-network-networksecuritygroup/azurerm"
  version             = "0.4.0"
  location            = var.location
  name                = "nsg-${local.nsg_name}"
  resource_group_name = var.resource_group_name
  diagnostic_settings = var.nsg_diagnostic_settings
  enable_telemetry    = false
  role_assignments    = local.nsg_role_assigments
  security_rules      = local.security_rules
  tags                = local.tags_public
}
