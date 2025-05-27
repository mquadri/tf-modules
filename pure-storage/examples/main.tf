/*
Sample Code for CBS Array creation - Abishek and Nazanine
9th May 2025
Using files: output.tf, providers.tf, variables.tf, main.tf, terraform.tfvars
*/

module "CBS-Array" {
  source                  = "../"
  array_name              = var.array_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  cbs_vnet_id             = var.cbs_vnet_id
  cbs_subnet_mgmt_name    = var.cbs_subnet_mgmt
  cbs_subnet_iscsi_name   = var.cbs_subnet_iscsi
  cbs_subnet_repl_name    = var.cbs_subnet_repl
  cbs_subnet_sys_name     = var.cbs_subnet_sys
  license_key             = var.license_key
  cbs_key_vault           = var.cbs_key_vault
  log_sender_domain       = var.log_sender_domain
  alert_recipients        = var.alert_recipients
  array_model             = var.array_model
  zone                    = var.zone
  key_file_path           = var.key_file_path
  jit_group_ids           = var.jit_group_ids
  tags                    = var.tags
  user_assigned_identity  = var.user_assigned_identity_id # module.CBS-Identity.user_assigned_identity_id
  # depends_on              = [module.CBS-Identity]

}
