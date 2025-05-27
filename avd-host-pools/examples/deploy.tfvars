avd_host_pools = {
  "test-host-pool-1" = {
    virtual_desktop_host_pool_name                  = "test-host-pool-1"
    virtual_desktop_host_pool_location              = "eastus"
    virtual_desktop_host_pool_type                  = "Personal"
    virtual_desktop_host_pool_resource_group_name   = "testavdrg"
    virtual_desktop_host_pool_load_balancer_type    = "Persistent"
    virtual_desktop_host_pool_custom_rdp_properties = "authentication level:i:0"

    virtual_desktop_host_pool_vm_template = {
      type = "Gallery"
      gallery_image_reference = {
        offer     = "office-365"
        publisher = "microsoftwindowsdesktop"
        sku       = "22h2-evd-o365pp"
        version   = "latest"
      }
      osDisktype = "PremiumLRS"
    }

    virtual_desktop_host_pool_scheduled_agent_updates = {
      enabled = true
      schedule = [
        {
          day_of_week = "Sunday"
          hour_of_day = 0
        },
        {
          day_of_week = "Wednesday"
          hour_of_day = 4
        }
      ]
    }

    resource_group_name = "testavdrg"

    diagnostic_settings = {
      ds1 = {
        name                        = "test-diagnostics-1"
        log_categories              = []
        log_groups                  = ["allLogs"]
        metric_categories           = ["AllMetrics"]
        storage_account_resource_id = ""
      }
    }

    enable_telemetry = false

    lock = {
      kind = "CanNotDelete"
    }

    private_endpoints = {
      pe2 = {
        subnet_resource_id            = ""
        private_dns_zone_resource_ids = [""]
        location                      = "eastus"
        resource_group_name           = "testavdrg"
      }
    }

    registration_expiration_period = "48h"

    role_assignments = {}

    tags = {
      environment = "test"
    }

    tracing_tags_enabled = false
    tracing_tags_prefix  = "avm_"
  },

  "test-host-pool-2" = {
    virtual_desktop_host_pool_name                     = "test-host-pool-2"
    virtual_desktop_host_pool_location                 = "eastus"
    virtual_desktop_host_pool_type                     = "Pooled"
    virtual_desktop_host_pool_resource_group_name      = "testavdrg"
    virtual_desktop_host_pool_load_balancer_type       = "BreadthFirst"
    virtual_desktop_host_pool_custom_rdp_properties    = "compression:i:1"
    virtual_desktop_host_pool_maximum_sessions_allowed = 10

    virtual_desktop_host_pool_vm_template = {
      type = "Gallery"
      gallery_image_reference = {
        offer     = "windows-10"
        publisher = "microsoftwindowsdesktop"
        sku       = "21h2-evd"
        version   = "latest"
      }
      osDisktype = "StandardLRS"
    }

    virtual_desktop_host_pool_scheduled_agent_updates = {
      enabled = true
      schedule = [
        {
          day_of_week = "Monday"
          hour_of_day = 2
        },
        {
          day_of_week = "Thursday"
          hour_of_day = 5
        }
      ]
    }

    resource_group_name = "testavdrg"

    diagnostic_settings = {
      ds2 = {
        name                        = "test-diagnostics-2"
        log_categories              = []
        log_groups                  = ["allLogs"]
        metric_categories           = ["AllMetrics"]
        storage_account_resource_id = ""
      }
    }

    enable_telemetry = false

    lock = {
      kind = "ReadOnly"
    }

    private_endpoints = {
      pe1 = {
        subnet_resource_id            = ""
        private_dns_zone_resource_ids = [""]
        location                      = "eastus"
        resource_group_name           = "testavdrg"
      }
    }

    registration_expiration_period = "48h"

    role_assignments = {}

    tags = {
      environment = "production"
    }

    tracing_tags_enabled = false
    tracing_tags_prefix  = "avm_"
  }
}
