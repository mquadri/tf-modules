module "ce-sub-enhablement-shared-poc-01" {
  source                       = "../../cost-management-export"
  name                         = var.name
  subscription_id              = local.sub_enablement_shared_poc_01_subscription_id
  recurrence_type              = var.recurrence_type
  recurrence_period_start_date = var.recurrence_period_start_date
  recurrence_period_end_date   = var.recurrence_period_end_date
  container_id                 = "sample_container_id"
  root_folder_path             = var.root_folder_path
  time_frame                   = var.time_frame
  type                         = var.type
}