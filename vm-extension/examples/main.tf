resource "azurerm_log_analytics_workspace" "workspace" {
  name                = "test-log-analytics"
  location            = "CentralUS"
  resource_group_name = "sql-mi-rg"
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_data_collection_rule" "rule1" {
  name                = "dcr-rules-windows"
  resource_group_name = "sql-mi-rg"
  location            = "CentralUS"

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.workspace.id
      name                  = "log-analytics"
    }
  }

  data_flow {
    streams      = ["Microsoft-Event"]
    destinations = ["log-analytics"]
  }

  data_sources {
    windows_event_log {
      streams = ["Microsoft-Event"]
      x_path_queries = ["Application!*[System[(Level=1 or Level=2 or Level=3 or Level=4 or Level=0 or Level=5)]]",
        "Security!*[System[(band(Keywords,13510798882111488))]]",
      "System!*[System[(Level=1 or Level=2 or Level=3 or Level=4 or Level=0 or Level=5)]]"]
      name = "eventLogsDataSource"
    }
  }
}


# associate to a Data Collection Rule
resource "azurerm_monitor_data_collection_rule_association" "example1" {
  name                    = "example1-dcra"
  target_resource_id      = ""
  data_collection_rule_id = azurerm_monitor_data_collection_rule.rule1.id
  description             = "example"
}

# Linux VM DCR configuration
resource "azurerm_monitor_data_collection_rule" "rule2" {
  name                = "dcr-rules-linux"
  resource_group_name = "sql-mi-rg"
  location            = "CentralUS"

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.workspace.id
      name                  = "test-destination-log"
    }

    azure_monitor_metrics {
      name = "test-destination-metrics"
    }
  }

  data_flow {
    streams      = ["Microsoft-InsightsMetrics"]
    destinations = ["test-destination-log"]
  }

  data_sources {

    performance_counter {
      streams                       = ["Microsoft-InsightsMetrics"]
      sampling_frequency_in_seconds = 60
      counter_specifiers            = ["\\VmInsights\\DetailedMetrics"]
      name                          = "VMInsightsPerfCounters"
    }
  }
}

# associate to a Data Collection Rule
resource "azurerm_monitor_data_collection_rule_association" "example2" {
  name                    = "example1-dcra-linux"
  target_resource_id      = ""
  data_collection_rule_id = azurerm_monitor_data_collection_rule.rule2.id
  description             = "example"
}

module "vm-extension" {
  source     = "../"
  extensions = var.extensions
  depends_on = [azurerm_monitor_data_collection_rule_association.example1, azurerm_monitor_data_collection_rule_association.example2]
}

