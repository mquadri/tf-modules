resource "azurerm_subscription_cost_management_export" "this" {
  name                         = var.name
  subscription_id              = var.subscription_id
  recurrence_type              = var.recurrence_type
  recurrence_period_start_date = var.recurrence_period_start_date
  recurrence_period_end_date   = var.recurrence_period_end_date
  active                       = var.active

  export_data_storage_location {
    container_id     = var.container_id
    root_folder_path = var.root_folder_path
  }

  export_data_options {
    type       = var.type
    time_frame = var.time_frame
  }
}