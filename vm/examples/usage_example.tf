# Placeholder for a basic VM usage example
# This file demonstrates how to call the parent VM module.

# module "vm_example" {
#   source = "../"
#
#   // Required variables for the VM module (refer to vm/variables.tf and vm/variables.*.tf)
#   name                = "example-vm"
#   location            = "eastus" # Or use data source for resource group location
#   resource_group_name = "example-rg"
#
#   // Standard Lumen Tags
#   appid = "APP001"
#   env   = "DEV"
#   mal_id = "MAL000123"
#
#   // VM Specifics (examples, adjust as per module's actual variables)
#   virtual_machine_size = "Standard_DS1_v2"
#   admin_username       = "lmnadmin"
#   // For network, ensure you have a subnet_id from an existing VNet
#   // subnet_id = data.azurerm_subnet.example.id
#
#   // If the module handles NIC creation and needs VNet/Subnet names:
#   // vnet_name = "example-vnet"
#   // subnet_name = "default"
#   // vnet_resource_group_name = "example-rg-network"
#
#   // If using SSH keys (for Linux)
#   // admin_ssh_public_key = "ssh-rsa AAAA..."
#   // disable_password_authentication = true
#
#   // If using password (ensure module supports this for Linux if applicable)
#   // admin_password = "aVeryComplexPassword!"
#
#   // Image details (example for a common Linux image)
#   // source_image_publisher = "Canonical"
#   // source_image_offer     = "0001-com-ubuntu-server-jammy"
#   // source_image_sku       = "22_04-lts"
#   // source_image_version   = "latest"
#
#   tags = {
#     custom_tag_1 = "CustomValue1"
#     Project      = "Phoenix"
#   }
# }

# output "vm_id_example" {
#   description = "ID of the example VM."
#  value       = module.vm_example.vm_id # Assuming vm_id is an output from the module
# }

# output "vm_primary_nic_id_example" {
#   description = "ID of the primary NIC of the example VM."
#   value       = module.vm_example.primary_network_interface_id # Assuming this is an output
# }
