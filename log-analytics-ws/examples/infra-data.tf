data "azurerm_private_dns_zone" "ampls" {
  for_each            = toset(local.private_dns_zones_names)
  name                = each.value
  resource_group_name = var.private_dns_rg
}