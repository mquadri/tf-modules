search_service = {
  search1 = {
    location                    = "East US"
    name                        = "search-service"
    resource_group_name         = "test-rg"
    allowed_ips                 = [""]
    authentication_failure_mode = "http401WithBearerChallenge"
    diagnostic_settings = {
      ds1 = {
        name                        = "test-diagnostics"
        log_categories              = []
        log_groups                  = ["allLogs"]
        metric_categories           = ["AllMetrics"]
        storage_account_resource_id = ""
      }
    }
    enable_telemetry             = false
    hosting_mode                 = "default"
    local_authentication_enabled = true
    lock = {
      kind = "CanNotDelete"
    }
    managed_identities = {
      system_assigned            = false
      user_assigned_resource_ids = []
    }
    partition_count = 2
    private_endpoints = {
      pe1 = {
        subnet_resource_id  = ""
        location            = "eastus"
        resource_group_name = "test-rg"
      }
    }
    public_network_access_enabled = true
    replica_count                 = 3
    role_assignments              = {}
    semantic_search_sku           = "standard"
    sku                           = "standard"
    tags = {
      Environment = "Production"
      Owner       = "team1"
    }
  }

}
