<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6, < 2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.6, <= 3.114.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.6, <= 3.114.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_avm-res-desktopvirtualization-applicationgroup"></a> [avm-res-desktopvirtualization-applicationgroup](#module\_avm-res-desktopvirtualization-applicationgroup) | Azure/avm-res-desktopvirtualization-applicationgroup/azurerm | 0.1.5 |

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_desktop_host_pool.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_desktop_host_pool) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_groups"></a> [application\_groups](#input\_application\_groups) | n/a | <pre>map(object({<br>    virtual_desktop_application_group_resource_group_name          = string<br>    virtual_desktop_application_group_name                         = string<br>    virtual_desktop_application_group_location                     = string<br>    virtual_desktop_application_group_type                         = string<br>    virtual_desktop_application_group_host_pool_id                 = string<br>    host_pool_name                                                 = optional(string)<br>    host_pool_resource_group_name                                  = optional(string)<br>    virtual_desktop_application_group_description                  = optional(string)<br>    virtual_desktop_application_group_default_desktop_display_name = optional(string)<br>    diagnostic_settings                                            = optional(map(any))<br>    enable_telemetry                                               = optional(bool)<br>    lock                                                           = optional(map(any))<br>    role_assignments                                               = optional(map(any))<br>    tracing_tags_enabled                                           = optional(bool)<br>    tracing_tags_prefix                                            = optional(string)<br>    virtual_desktop_application_group_friendly_name                = optional(string)<br>    virtual_desktop_application_group_tags                         = optional(map(string))<br>    virtual_desktop_application_group_timeouts                     = optional(map(string))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource"></a> [resource](#output\_resource) | Full output for the resource, keyed by each item in for\_each |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | The ID of the Azure Virtual Desktop application group, keyed by each item in for\_each |
<!-- END_TF_DOCS -->