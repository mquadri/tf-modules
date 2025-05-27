output "reservation_order_id" {
  description = "The ID of the reservation order."
  value       = azapi_resource.reserved-instances.id
}

output "reservation_order_name" {
  description = "The name of the reservation order."
  value       = azapi_resource.reserved-instances.name
}