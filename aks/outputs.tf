output "aks_arm" {
  value = azapi_resource.aks-deployment
}

output "aks_spn" {
  value = azurerm_user_assigned_identity.aks-spn

}