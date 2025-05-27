output "mgmt_ip_address" {
  description = <<-EOF
  Panorama management IP address. If `public_ip` was `true`, it is a public IP address, otherwise a private IP address.
  EOF
  value       = { for key, value in module.swfw-modules_panorama : key => value.mgmt_ip_address }
}

output "interfaces" {
  description = "Map of VM-Series network interfaces. Keys are equal to var.interfaces `name` properties."
  value       = { for key, value in module.swfw-modules_panorama : key => value.interfaces }
}

output "panorama" {
  description = "All details of the panorama created"
  value = {
    interface       = { for key, value in module.swfw-modules_panorama : key => value.interfaces }
    mgmt_ip_address = { for key, value in module.swfw-modules_panorama : key => value.mgmt_ip_address }
  }
}
