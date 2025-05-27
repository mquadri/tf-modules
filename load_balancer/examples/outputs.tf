output "azurerm_lb_backend_address_pool" {
  description = "Outputs each backend address pool in its entirety"
  value       = module.loadbalancer.azurerm_lb_backend_address_pool
}

output "azurerm_lb_nat_rule" {
  description = "Outputs each NAT rule in its entirety"
  value       = module.loadbalancer.azurerm_lb_nat_rule
}

output "azurerm_public_ip" {
  description = "Outputs each Public IP Address resource in its entirety"
  value       = module.loadbalancer.azurerm_public_ip
}

output "name" {
  description = "Outputs the entire Azure Load Balancer resource"
  value       = module.loadbalancer.name
}

output "resource" {
  description = "Outputs the entire Azure Load Balancer resource"
  value       = module.loadbalancer.resource
}

output "resource_id" {
  description = "Outputs the entire Azure Load Balancer resource"
  value       = module.loadbalancer.resource
}