#PaaS SQL setup
application_sql_server = {
  sql_1 = {
    location            = "eastus2"
    resource_group_name = "sql-mi-rg"
    name                = "pass-sql-server01"
    administrator_login = ""
    server_version      = "12.0"
    azuread_administrator = {
      azuread_authentication_only = true
      login_username              = ""
      object_id                   = ""
      tenant_id                   = ""
    }
    private_endpoints = {
      pe01 = {
        subnet_resource_id = ""
      }
    }
    databases = {
      db01 = {
        name     = "new-db"
        sku_name = "Basic"
      },
      db02 = {
        name     = "new-db-2"
        sku_name = "Basic"
      }
    }
    key_vault_name    = "sql-kv01"
    key_vault_rg_name = "sql-mi-rg"
    app_id            = "test"
    msftmigration     = "yes"
    environment       = "SANDBOX"
  },

  sql_2 = {
    location            = "eastus2"
    resource_group_name = "sql-mi-rg"
    name                = "pass-sql-server02"
    administrator_login = ""
    server_version      = "12.0"
    azuread_administrator = {
      azuread_authentication_only = true
      login_username              = ""
      object_id                   = ""
      tenant_id                   = ""
    }
    private_endpoints = {
      pe01 = {
        subnet_resource_id = ""
      }
    }
    databases = {
      db01 = {
        name     = "new-db"
        sku_name = "Basic"
      },
      db02 = {
        name     = "new-db-2"
        sku_name = "Basic"
      }
    }
    key_vault_name    = "sql-kv01"
    key_vault_rg_name = "sql-mi-rg"
    app_id            = "test"
    msftmigration     = "yes"
    environment       = "SANDBOX"
  }
}



#SQL MI setup
application_sql_mi = {
  sql-mi1 = {
    administrator_login    = "sqlmiuser"
    license_type           = "BasePrice"
    location               = "CentralUS"
    key_vault_name         = "sqlmi-kv01"
    key_vault_rg_name      = "sql-mi-rg"
    resource_group_name    = "sql-mi-rg"
    sku_name               = "GP_Gen5"
    zone_redundant_enabled = false
    storage_size_in_gb     = 32
    subnet_id              = ""
    vcores                 = 4
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
  },

  sql-mi2 = {
    administrator_login    = "sqlmiuser"
    license_type           = "BasePrice"
    location               = "CentralUS"
    key_vault_name         = "sqlmi-kv01"
    key_vault_rg_name      = "sql-mi-rg"
    resource_group_name    = "sql-mi-rg"
    sku_name               = "GP_Gen5"
    zone_redundant_enabled = false
    storage_size_in_gb     = 32
    subnet_id              = ""
    vcores                 = 4
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
    appid             = "002"
    appname           = "testapp2"
    env               = "test2"
    environment       = "TEST"
    msftmigration     = "yes"
    additionalcontext = "01"
    tags = {
      "test" = "test"
    }
  }
}
