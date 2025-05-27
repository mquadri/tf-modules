/*
Root module for CBS Array creation - Abishek and Nazanine
9th May 2025
Using files: output.tf, providers.tf, variables.tf, main.tf, terraform.tfvars
*/
resource "cbs_array_azure" "azure_instance" {

  array_name                    = var.array_name
  location                      = var.resource_group_location
  resource_group_name           = var.resource_group_name
  license_key                   = var.license_key
  log_sender_domain             = var.log_sender_domain
  alert_recipients              = var.alert_recipients
  array_model                   = var.array_model
  zone                          = var.zone
  virtual_network_id            = var.cbs_vnet_id
  key_vault_id                  = var.cbs_key_vault
  pureuser_private_key          = file(var.key_file_path)
  management_subnet             = var.cbs_subnet_mgmt_name
  system_subnet                 = var.cbs_subnet_sys_name
  iscsi_subnet                  = var.cbs_subnet_iscsi_name
  replication_subnet            = var.cbs_subnet_repl_name
  jit_approval_group_object_ids = var.jit_group_ids
  user_assigned_identity        = var.user_assigned_identity


  plan {
    name      = data.cbs_azure_plans.azure_plans.plans[0].name
    product   = data.cbs_azure_plans.azure_plans.plans[0].product
    publisher = data.cbs_azure_plans.azure_plans.plans[0].publisher
    version   = data.cbs_azure_plans.azure_plans.plans[0].version
  }

  lifecycle {
    ignore_changes = [
      plan,
    ]
  }
}