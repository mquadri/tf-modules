output "mgmt_ip_address" {
  description = "Panorama management IP addresses for each instance. If `public_ip` was `true`, it is a public IP address; otherwise, it's a private IP address."
  value       = module.panorama-example.mgmt_ip_address
}

output "interfaces" {
  description = "Panorama network interfaces for each instance. These are `azurerm_network_interface` objects."
  value       = module.panorama-example.interfaces
}

output "panorama" {
  description = "Combined management IP addresses and network interfaces for each Panorama instance."
  value = {
    for instance, details in module.panorama-example : instance => {
      interface       = module.panorama-example.interfaces
      mgmt_ip_address = module.panorama-example.mgmt_ip_address
    }
  }
}
