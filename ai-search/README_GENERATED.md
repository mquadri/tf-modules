## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_avm-res-search-searchservice"></a> [avm-res-search-searchservice](#module\_avm-res-search-searchservice) | Azure/avm-res-search-searchservice/azurerm | 0.1.3 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_id"></a> [app\_id](#input\_app\_id) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_mal_id"></a> [mal\_id](#input\_mal\_id) | The MAL ID for tagging purposes. This will be merged with other tags. | `string` | `""` | no |
| <a name="input_msftmigration"></a> [msftmigration](#input\_msftmigration) | The migration tag used. | `string` | n/a | yes |
| <a name="input_search_service"></a> [search\_service](#input\_search\_service) | A map of objects containing the configuration for each search service. | <pre>map(object({<br>    location                    = string<br>    name                        = string<br>    resource_group_name         = string<br>    allowed_ips                 = optional(list(string), null)<br>    authentication_failure_mode = optional(string, null)<br>    customer_managed_key = optional(object({<br>      key_vault_resource_id = string<br>      key_name              = string<br>      key_version           = optional(string, null)<br>      user_assigned_identity = optional(object({<br>        resource_id = string<br>      }), null)<br>    }), null)<br>    customer_managed_key_enforcement_enabled = optional(bool, null)<br>    diagnostic_settings = optional(map(object({<br>      name                                     = optional(string, null)<br>      log_categories                           = optional(set(string), [])<br>      log_groups                               = optional(set(string), ["allLogs"])<br>      metric_categories                        = optional(set(string), ["AllMetrics"])<br>      log_analytics_destination_type           = optional(string, "Dedicated")<br>      workspace_resource_id                    = optional(string, null)<br>      storage_account_resource_id              = optional(string, null)<br>      event_hub_authorization_rule_resource_id = optional(string, null)<br>      event_hub_name                           = optional(string, null)<br>      marketplace_partner_resource_id          = optional(string, null)<br>    })), {})<br>    enable_telemetry             = optional(bool, true)<br>    hosting_mode                 = optional(string, null)<br>    local_authentication_enabled = optional(bool, null)<br>    lock = optional(object({<br>      kind = string<br>      name = optional(string, null)<br>    }), null)<br>    managed_identities = optional(object({<br>      system_assigned            = optional(bool, false)<br>      user_assigned_resource_ids = optional(set(string), [])<br>    }), {})<br>    partition_count = optional(number, 1)<br>    private_endpoints = optional(map(object({<br>      name = optional(string, null)<br>      role_assignments = optional(map(object({<br>        role_definition_id_or_name             = string<br>        principal_id                           = string<br>        description                            = optional(string, null)<br>        skip_service_principal_aad_check       = optional(bool, false)<br>        condition                              = optional(string, null)<br>        condition_version                      = optional(string, null)<br>        delegated_managed_identity_resource_id = optional(string, null)<br>        principal_type                         = optional(string, null)<br>      })), {})<br>      lock = optional(object({<br>        kind = string<br>        name = optional(string, null)<br>      }), null)<br>      tags                                    = optional(map(string), null)<br>      subnet_resource_id                      = string<br>      private_dns_zone_group_name             = optional(string, "default")<br>      private_dns_zone_resource_ids           = optional(set(string), [])<br>      application_security_group_associations = optional(map(string), {})<br>      private_service_connection_name         = optional(string, null)<br>      network_interface_name                  = optional(string, null)<br>      location                                = optional(string, null)<br>      resource_group_name                     = optional(string, null)<br>      ip_configurations = optional(map(object({<br>        name               = string<br>        private_ip_address = string<br>      })), {})<br>    })), {})<br>    public_network_access_enabled = optional(bool, true)<br>    replica_count                 = optional(number, 1)<br>    role_assignments = optional(map(object({<br>      role_definition_id_or_name = string<br>      principal_id               = string<br>      description                = optional(string, null)<br>    })), {})<br>    semantic_search_sku = optional(string, null)<br>    sku                 = string<br>    tags                = optional(map(string), null)<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of additional custom tags to apply to the Azure AI Search service. These will be merged with mandatory and per-service tags. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_primary_admin_keys"></a> [primary\_admin\_keys](#output\_primary\_admin\_keys) | A map of primary admin keys for the Azure AI Search services, keyed by the input search\_service map keys. |
| <a name="output_private_endpoints"></a> [private\_endpoints](#output\_private\_endpoints) | A map of private endpoints. The map key is the supplied input to var.private\_endpoints. The map value is the entire azurerm\_private\_endpoint resource. |
| <a name="output_resource"></a> [resource](#output\_resource) | This is the full output for the resource. |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | The ID of the machine learning workspace. |
| <a name="output_secondary_admin_keys"></a> [secondary\_admin\_keys](#output\_secondary\_admin\_keys) | A map of secondary admin keys for the Azure AI Search services, keyed by the input search\_service map keys. |
