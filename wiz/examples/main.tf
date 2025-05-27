module "wiz_azure_custom_connector-mg-us-workloads-poc" {
  source = "github.com/CenturyLink/tf-modules-azure//wiz?ref=1.4.5"

  azure_management_group_id = "mg-us-workloads-poc"
  azure_subscription_id     = "d4c022e5-1b36-437c-afdc-4eaf6eeb26f3"

  # Object ID for SPN based on multi-tenant Enterprise App  used by Wiz.io (provisioned in TASK3338785)
  #
  wiz_spn_id = "ef046131-964c-42c0-9649-5bbeff0325ff"

  # Custom role name to avoid conflict with existent custom roles
  wiz_custom_role_name = "Wiz-Custom-Role"

  enable_data_scanning       = false
  enable_serverless_scanning = true
  enable_openai_scanning     = false
  enable_entra_id_scanning   = false
}

output "wiz_module_outputs" {
  value = module.wiz_azure_custom_connector-mg-us-workloads-poc
}
