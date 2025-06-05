output "action_group_ids" {
  description = "A map of the action group names to their respective resource IDs."
  value = {
    for k, v in azurerm_monitor_action_group.group : k => v.id
  }
}

output "action_group_names_map" {
  description = "A map of the action group keys (from input variable) to their created names."
  value = {
    for k, v in azurerm_monitor_action_group.group : k => v.name
  }
}

output "action_group_short_names_map" {
  description = "A map of the action group keys (from input variable) to their created short names."
  value = {
    for k, v in azurerm_monitor_action_group.group : k => v.short_name
  }
}

output "action_group_resources" {
  description = "A map of the full action group resources created, keyed by the input map keys."
  value       = azurerm_monitor_action_group.group
}
