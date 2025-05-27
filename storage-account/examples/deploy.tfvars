additionalcontext   = "5432"
appname             = "myapp"
name                = "teststrgacctnew6309"
env                 = "prod"
appid               = "12345"
resourcetype        = "dns"
resource_group_name = "avmmoduletesting194"
costAppOwnerManager = "owner-manager@example003.com"
costAppOwnerTech    = "owner-tech@example003.com"
costBudgetOwner     = "budget-owner@example003.com"
costCostCenter      = "center-1"
costAllocation      = "sharedcosts" # Can be "sharedcosts" or "chargeback"
costVP              = "example"
costDivision        = "example"
appFunction         = "web"
monthlyBudget       = "5000"
costbaseline        = "2023" # Year resource created
location            = "eastus"
enable_telemetry    = false
network_rules = {
  bypass                     = ["AzureServices"]
  default_action             = "Deny"
  ip_rules                   = ["100.0.0.1"]
  virtual_network_subnet_ids = [""]
}

shares = {
  share0 = {
    name        = "fileshare-1"
    quota       = 10
    access_tier = "Hot"
    metadata = {
      key1 = "value1"
      key2 = "value2"
    }
    signed_identifiers = [
      {
        id = "1"
        access_policy = {
          expiry_time = "2025-01-01T00:00:00Z"
          permission  = "r"
          start_time  = "2024-01-01T00:00:00Z"
        }
      }
    ]
  }
}
containers = {
  blob_container0 = {
    name                  = "blob-container-0"
    container_access_type = "private"
  }
  blob_container1 = {
    name                  = "blob-container-1"
    container_access_type = "private"

  }

}
queues = {
  queue0 = {
    name = "queue-0"

  }
  queue1 = {
    name = "queue-1"

    metadata = {
      key1 = "value1"
      key2 = "value2"
    }
  }
}
tables = {
  table0 = {
    name = "table0"
    signed_identifiers = [
      {
        id = "1"
        access_policy = {
          expiry_time = "2025-01-01T00:00:00Z"
          permission  = "r"
          start_time  = "2024-01-01T00:00:00Z"
        }
      }
    ]
  }
  table1 = {
    name = "table1"

    signed_identifiers = [
      {
        id = "1"
        access_policy = {
          expiry_time = "2025-01-01T00:00:00Z"
          permission  = "r"
          start_time  = "2024-01-01T00:00:00Z"
        }
      }
    ]
  }
}
