administrator_login = "sqlmiuser"
license_type        = "BasePrice"
location            = "CentralUS"
kv_name             = "sqlmikvtest0045"
resource_group_name = "sql-mi-cus-rg"
sku_name            = "GP_Gen5"
storage_size_in_gb  = 32
subnet_id           = ""
vcores              = 4
private_endpoints = {
  "pe1" = {
    subnet_resource_id = ""
  }
}
managed_identities = {
  system_assigned            = true
  user_assigned_resource_ids = [""]
}
databases = {
  "db1" = {
    name                      = "testdb1"
    short_term_retention_days = 1
  }
  "db2" = {
    name                      = "testdb2"
    short_term_retention_days = 1
  }
}
diagnostic_settings = {
  "diag1" = {
    name                           = "sqlmi-diagnostics"
    workspace_resource_id          = ""
    log_analytics_destination_type = "Dedicated"
    log_groups                     = ["allLogs"]
  }
}
resourcetype      = "sql-mi"
appid             = "001"
appname           = "testapp"
env               = "test"
environment       = "TEST"
msftmigration     = "yes"
additionalcontext = "01"
tags = {
  "test" = "test"
}
