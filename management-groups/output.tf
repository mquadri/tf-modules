output "rootmg_name" {
  value       = data.azurerm_management_group.rootmg.name
  description = "Tenant root Management group Name"
}
output "rootmg_id" {
  value       = data.azurerm_management_group.rootmg.id
  description = "Tenant root Management group id"
}
output "level1_mgs_name_id_parent_id_list" {
  value       = [for v in azurerm_management_group.l1 : { display_name = v.display_name, id = v.id, parent_id = v.parent_management_group_id }]
  description = "List containing level 1 child management groups name,id and parent id"
}

output "level2_mgs_name_id_parent_id_list" {
  value       = [for v in azurerm_management_group.l2 : { display_name = v.display_name, id = v.id, parent_id = v.parent_management_group_id }]
  description = "List containing level 2 child management groups name,id and parent id"
}

output "level3_mgs_name_id_parent_id_list" {
  value       = [for v in azurerm_management_group.l3 : { display_name = v.display_name, id = v.id, parent_id = v.parent_management_group_id }]
  description = "List containing level 3 child management groups name,id and parent id"
}
output "level4_mgs_name_id_parent_id_list" {
  description = "List containing level 4 child management groups name,id and parent id"
  value       = [for v in azurerm_management_group.l4 : { display_name = v.display_name, id = v.id, parent_id = v.parent_management_group_id }]
}
output "level5_mgs_name_id_parent_id_list" {
  value       = [for v in azurerm_management_group.l5 : { display_name = v.display_name, id = v.id, parent_id = v.parent_management_group_id }]
  description = "List containing level 5 child management groups name,id and parent id"
}