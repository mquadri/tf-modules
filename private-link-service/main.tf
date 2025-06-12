
data "azurerm_subnet" "this" {
  for_each             = var.private_link_services
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.networking_resource_group != null ? each.value.networking_resource_group : var.resource_group_name
}

data "azurerm_lb" "this" {
  for_each            = var.private_link_services
  name                = each.value.loadbalancer_name
  resource_group_name = each.value.lb_resource_group != null ? each.value.lb_resource_group : var.resource_group_name
}

# - Private Link Service

resource "azurerm_private_link_service" "this" {
  for_each            = var.private_link_services
  name                = each.value["name"]
  location            = each.value["location"]
  resource_group_name = each.value.pls_resource_group != null ? each.value.pls_resource_group : var.resource_group_name

  auto_approval_subscription_ids              = lookup(each.value, "auto_approval_subscription_ids", null)
  visibility_subscription_ids                 = lookup(each.value, "visibility_subscription_ids", null)
  load_balancer_frontend_ip_configuration_ids = tolist([lookup(local.frontend_ip_configurations_map, each.value.frontend_ip_config_name, null)])
  enable_proxy_protocol                       = coalesce(each.value.enable_proxy_protocol, false)
  fqdns                                       = lookup(each.value, "fqdns", null)

  nat_ip_configuration {
    name                       = "${each.value["name"]}_primary_pls_nat"
    private_ip_address         = lookup(each.value, "private_ip_address", null)
    private_ip_address_version = coalesce(lookup(each.value, "private_ip_address_version", null), "IPv4")
    subnet_id                  = lookup(data.azurerm_subnet.this, each.key, null)["id"]
    primary                    = true
  }

  tags = merge(local.mandatory_tags, try(var.private_link_services_tags, {}))

}
