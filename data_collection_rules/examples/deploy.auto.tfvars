# Tag variable values
resourcetype   = "dcr"
appid          = "test"
appname        = "exmaple-infra"
env            = "dev"
costCostCenter = "test"
# costVP                               = "vp"
costAppOwnerTech    = "owner"
costAppOwnerManager = "manager"
costBudgetOwner     = "budget owner"
# management_group_name                = "mg-name"
# costDivision                         = "devision-name"
appFunction    = "example general dev dcr"
costbaseline   = "2024"
costAllocation = "sharedcost"
monthlyBudget  = "1000"
datacollection_endpoint = {
  "dcendpointlinux" = {
    monitor_data_collection_endpoint_name        = "dcedpmonitoringeastus"
    monitor_data_collection_endpoint_description = "monitoring end point for east us location for linux os"
    monitor_data_collection_endpoint_kind        = "Linux"
  }
}
monitor_data_collection_rule = {
  dcrlinux = {
    rule_name                     = "dcrulelinux"
    description                   = "Data collection rule for linux"
    dcr_rg_name                   = "monitoring_rg_eastus"
    log_analytics_name            = "destination-log"
    log_analytics_id              = "/subscriptions/db4edbdd-2433-47cc-a5da-d1cf82051e02/resourceGroups/monitoring_rg_eastus/providers/Microsoft.OperationalInsights/workspaces/sampledcr"
    data_collection_endpoint_name = "dcendpointlinux"
    kind                          = "Linux"
    streams                       = ["Microsoft-InsightsMetrics", "Microsoft-Syslog", "Microsoft-Perf"]
    destinations                  = ["destination-log"]
    transform_kql                 = "kql1"
  }
}
data_sources = {
  syslog = [
    {
      facility_names = ["*"]
      log_levels     = ["*"]
      name           = "example-datasource-syslog"
      streams        = ["Microsoft-Syslog"]
    }
  ]
  performance_counter = [
    {
      streams                       = ["Microsoft-Perf", "Microsoft-InsightsMetrics"]
      sampling_frequency_in_seconds = 60
      counter_specifiers            = ["Processor(*)\\% Processor Time"]
      name                          = "example-datasource-perfcounter"
    }
  ]
}
resource_group_name = "monitoring_rg_eastus"

dcr_association = {
  dcrassociation1 = {
    name                    = ""
    target_resource_id      = ""
    data_collection_rule_id = ""
  }
}