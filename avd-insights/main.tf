locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

module "avm-ptn-avd-lza-insights" {
  source  = "Azure/avm-ptn-avd-lza-insights/azurerm"
  version = "0.1.3"

  for_each                                                             = var.avd_dcr_insights
  monitor_data_collection_rule_resource_group_name                     = each.value.monitor_data_collection_rule_resource_group_name
  monitor_data_collection_rule_kind                                    = each.value.monitor_data_collection_rule_kind
  monitor_data_collection_rule_location                                = each.value.monitor_data_collection_rule_location
  monitor_data_collection_rule_name                                    = each.value.monitor_data_collection_rule_name
  monitor_data_collection_rule_data_flow                               = each.value.monitor_data_collection_rule_data_flow
  monitor_data_collection_rule_destinations                            = each.value.monitor_data_collection_rule_destinations
  monitor_data_collection_rule_data_sources                            = each.value.monitor_data_collection_rule_data_sources
  monitor_data_collection_rule_timeouts                                = each.value.monitor_data_collection_rule_timeouts
  monitor_data_collection_rule_tags                                    = merge(local.mandatory_tags, try(each.value.monitor_data_collection_rule_tags, {}))
  monitor_data_collection_rule_stream_declaration                      = each.value.monitor_data_collection_rule_stream_declaration
  monitor_data_collection_rule_identity                                = each.value.monitor_data_collection_rule_identity
  monitor_data_collection_rule_description                             = each.value.monitor_data_collection_rule_description
  monitor_data_collection_rule_data_collection_endpoint_id             = each.value.monitor_data_collection_rule_data_collection_endpoint_id
  monitor_data_collection_rule_association_name                        = each.value.monitor_data_collection_rule_association_name
  monitor_data_collection_rule_association_description                 = each.value.monitor_data_collection_rule_association_description
  monitor_data_collection_rule_association_data_collection_rule_id     = each.value.monitor_data_collection_rule_association_data_collection_rule_id
  monitor_data_collection_rule_association_data_collection_endpoint_id = each.value.monitor_data_collection_rule_association_data_collection_endpoint_id
  managed_identities                                                   = each.value.managed_identities
  enable_telemetry                                                     = each.value.enable_telemetry
  lock                                                                 = each.value.lock
  diagnostic_settings                                                  = each.value.diagnostic_settings #Diagnostic setting code in AVD-insights has a bug and this can only be used once bug is fixed in AVM.
  role_assignments                                                     = each.value.role_assignments
}