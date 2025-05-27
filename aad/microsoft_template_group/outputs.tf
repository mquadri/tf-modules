output "id" {
  description = "Ojbect ID of the Azure AD Group"
  value       = azuread_group.group.object_id
}