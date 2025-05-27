output "name" {
  description = "The route table name"
  value       = module.example-route-table.name
}

output "resource" {
  description = "This is the full output for the route table."
  value       = module.example-route-table.resource
}

output "resource_id" {
  description = "The ID of the route table"
  value       = module.example-route-table.resource_id
}

output "routes" {
  description = "This is the full output of the routes."
  value = zipmap(
    [for route in var.routes : route.name],
    values(module.example-route-table.routes)[*]
  )
}