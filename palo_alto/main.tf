# Palo Alto Virtual Network Appliance
resource "azurerm_palo_alto_virtual_network_appliance" "appliance" {
  for_each       = var.nva
  name           = each.value.name
  virtual_hub_id = each.value.vhub_id
}

# Palo Alto Next Generation Firewall with Panorama
resource "azurerm_palo_alto_next_generation_firewall_virtual_hub_panorama" "palo_fw" {
  for_each            = var.firewall
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.region

  network_profile {
    public_ip_address_ids        = [each.value.public_ip_id]
    virtual_hub_id               = each.value.vhub_id
    network_virtual_appliance_id = azurerm_palo_alto_virtual_network_appliance.appliance[each.value.region].id
  }

  panorama_base64_config = each.value.panorama_config
}

# Virtual Hub Routing Intent
resource "azurerm_virtual_hub_routing_intent" "routing_intent" {
  for_each       = var.routing_intent
  name           = each.value.name
  virtual_hub_id = each.value.vhub_id

  dynamic "routing_policy" {
    for_each = each.value.routing_policies # List of routing policies in each routing intent variable
    content {
      name         = routing_policy.value.policy_name
      next_hop     = azurerm_palo_alto_virtual_network_appliance.appliance[each.value.region].id
      destinations = routing_policy.value.destinations
    }
  }
}
