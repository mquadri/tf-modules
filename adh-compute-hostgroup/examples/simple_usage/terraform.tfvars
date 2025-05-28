app_id = "00000000-0000-0000-0000-000000000000"
environment = "TEST"
msftmigration = "tagstest"
dedicated_host_group_name   = "my-dedicated-host-group"
resource_group_name         = "my-resource-group"
location                    = "centralus"
platform_fault_domain_count = 3
automatic_placement_enabled = true
zone                        = "1"
enable_telemetry            = true
tags                        = { environment = "prod", app_id = "appriiro", msftmigration = "true-enabled"}
dedicated_hosts = {
  host1 = {
    name                    = "dedicated-host-1"
    platform_fault_domain   = 0
    sku_name                = "DSv3-Type1"
    auto_replace_on_failure = true
    license_type            = "Windows_Server_Hybrid"
    tags                    = { environment = "prod" }
  }
  host2 = {
    name                    = "dedicated-host-2"
    platform_fault_domain   = 1
    sku_name                = "DSv3-Type2"
    auto_replace_on_failure = false
    license_type            = "None"
    tags                    = { environment = "dev", app_id = "appriiro", msftmigration = "true-enabled" }
  }
}