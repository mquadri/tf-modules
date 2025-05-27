location      = "eastus"
app_id        = "myapp"
environment   = "NON-PROD"
appname       = "myapp1"
env           = "DEV"
msftmigration = "true"
nsg_config = {
  name                = "my-nsg"
  resource_group_name = "my-rg"
  enable_telemetry    = true
  lock                = false
  role_assignments    = []
  tags = {
    environment   = "NON-PROD"
    app_id        = "myapp"
    msftmigration = "true"
  }
}
law_config = {
  additionalcontext             = "01"
  resource_group_name           = "my-rg"
  location                      = "eastus2"
  sku                           = "pergb2018"
  retention_in_days             = 30
  local_authentication_disabled = false
  internet_ingestion_enabled    = true
  internet_query_enabled        = true
}

key_vault_config = {
  existing_name                   = "testkvapp101"
  resource_group_name             = "my-kv-rg"
  enabled_for_template_deployment = true
  enabled_for_deployment          = true
  sku_name                        = "standard"
  soft_delete_enabled             = true
  soft_delete_retention_days      = 90
  access_policies = [{
    tenant_id = "my-tenant-id"
    object_id = "my-object-id"
    permissions = {
      keys         = ["get", "list"]
      secrets      = ["get", "list"]
      certificates = ["get", "list"]
      storage      = ["get", "list"]
    }
  }]
  secrets = [{
    name         = "my-secret"
    content_type = "text/plain"
  }]
}
