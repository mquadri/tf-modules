
# Azure Virtual Network Flow Logs with Traffic Analytics

This Terraform configuration sets up Azure Network Watcher Flow Logs with optional Traffic Analytics for monitoring network traffic. It uses various Azure resources, including **Storage Accounts**, **Virtual Networks**, and **Network Watchers**.

## Prerequisites

Before running this Terraform configuration, ensure that you have the following:

- An Azure Subscription
- Terraform installed (version ~> 1.8)
- Proper access to create and manage resources in Azure (e.g., network watcher, storage accounts, virtual networks)

## Providers

This configuration uses the following providers:

- `azurerm`: To interact with Azure resources.
- `azuread`: For managing Azure Active Directory resources.
- `azapi`: To access Azure REST API resources.
- `validation`: To validate variables.

## Configuration Overview

This Terraform setup creates Network Watcher Flow Logs based on a map of flow log details provided in the `flow_logs` variable. Each flow log can optionally include traffic analytics configuration.

### File Breakdown

- **`main.tf`**: Contains the main resources for setting up Network Watcher Flow Logs and Traffic Analytics.
- **`output.tf`**: Outputs the details of the deployed flow logs.
- **`providers.tf`**: Configures the required providers for Terraform.
- **`variables.tf`**: Contains variable definitions, including `flow_logs`, which describes the flow logs to be created.

## Variables

The primary variable is `flow_logs`, which is a map of flow logs. Each entry includes details about the flow log, the network watcher, the storage account, and optionally, traffic analytics.

### `flow_logs` Map

```hcl
variable "flow_logs" {
  description = "A map of flow logs to be created."
  type = map(object({
    name                 = string
    location             = optional(string)
    network_watcher_name = string
    resource_group_name  = string

    # Storage Account Details
    storage_account_name = string
    storage_account_rg   = string

    # Virtual Network Details (Target Resource)
    vnet_name = string
    vnet_rg   = string

    # Flow Log Version
    version = optional(number, 1)

    # Retention Policy
    retention_policy = object({
      days    = number
      enabled = bool
    })

    # Traffic Analytics (Optional)
    traffic_analytics = optional(object({
      enabled               = bool
      workspace_id          = string
      workspace_region      = string
      workspace_resource_id = string
      interval_in_minutes   = optional(number, 60)
    }), null)

    # Condition Monitor
    condition_monitor = optional(map(object({
      name = string
      endpoint = set(object({
        address               = optional(string)
        coverage_level        = optional(string)
        excluded_ip_addresses = optional(set(string))
        included_ip_addresses = optional(set(string))
        name                  = string
        target_resource_id    = optional(string)
        target_resource_type  = optional(string)
        filter = optional(object({
          type = optional(string)
          item = optional(set(object({
            address = optional(string)
            type    = optional(string)
          })))
        }))
      }))
      test_configuration = set(object({
        name                      = string
        preferred_ip_version      = optional(string)
        protocol                  = string
        test_frequency_in_seconds = optional(number)
        http_configuration = optional(object({
          method                   = optional(string)
          path                     = optional(string)
          port                     = optional(number)
          prefer_https             = optional(bool)
          protocol                 = string
          valid_status_code_ranges = optional(set(string))
          request_header = optional(set(object({
            name  = string
            value = string
          })))
        }))
        icmp_configuration = optional(object({
          trace_route_enabled = optional(bool)
        }))
        success_threshold = optional(object({
          checks_failed_percent = optional(number)
          round_trip_time_ms    = optional(number)
        }))
        tcp_configuration = optional(object({
          destination_port_behavior = optional(string)
          port                      = number
          trace_route_enabled       = optional(bool)
        }))
      }))
      test_group = set(object({
        destination_endpoints    = set(string)
        enabled                  = optional(bool)
        name                     = string
        source_endpoints         = set(string)
        test_configuration_names = set(string)
      }))
      notes                         = optional(string, null)
      output_workspace_resource_ids = optional(list(string), null)
    })), null)

    # Telemetry
    enable_telemetry = optional(bool, true)

    # Lock
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)


    # Role Assignments
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })))

    # Tags
    tags = optional(map(string), null)
  }))
}
```

Each flow log must specify the following information:
- **Network Watcher**: The network watcher to which the flow log is associated.
- **Storage Account**: The storage account to store the flow logs.
- **Virtual Network**: The virtual network whose traffic is being logged.
- **Retention Policy**: Configuration for log retention, including whether it’s enabled and for how many days.
- **Traffic Analytics** (Optional): Configuration for Traffic Analytics, including workspace ID, workspace region, and interval.
- **Tags** (Optional): Tags to be applied to the flow log.

## Resources Created

The following resources will be created:

- **Network Watcher Flow Logs** (`azurerm_network_watcher_flow_log`): Configured to log network traffic for specified virtual networks.
- **Dynamic Traffic Analytics** (Optional): If specified, enables traffic analytics for each flow log.

## Output

The output of the Terraform plan will include the following details for each flow log:

```hcl
output "flow_logs_output" {
  description = "Flow log resource details from the module."
  value = {
    for k, v in module.avm-res-network-networkwatcher : k => v.resource_flow_log
  }
}
```

## Example Usage

To use this configuration, define the `flow_logs` variable in your `terraform.tfvars` or inline in the configuration like this:

```hcl
flow_logs = {
  "flow_log_1" = {
    name                 = "example-flow-log-1"
    network_watcher_name = "NetworkWatcher_eastus"
    resource_group_name  = "rg"

    # Storage Account (Fetched Dynamically)
    storage_account_name = "mystorage022"
    storage_account_rg   = "rg"


    # Virtual Network (Target Resource)
    vnet_name = "test-vnet112"
    vnet_rg   = "rg"


    # Flow Log Version
    version = 2

    retention_policy = {
      days    = 30
      enabled = true
    }

    traffic_analytics = {
      enabled               = true
      workspace_id          = "id" # Example Workspace ID
      workspace_region      = "East US 2"
      workspace_resource_id = "id" # Example Resource ID
      interval_in_minutes   = 60
    }

  }
}
```

## Notes

- Ensure that the **Network Watcher**, **Storage Account**, and **Virtual Network** resources already exist or are created as part of the deployment.
- The **Traffic Analytics** configuration is optional. If it’s not needed, you can omit it, and it will not be created.


