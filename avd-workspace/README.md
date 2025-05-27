<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6, < 2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.6, <= 3.114.0 |
| <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) | ~> 0.3 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5.1, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.6, <= 3.114.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_avm-res-desktopvirtualization-workspace"></a> [avm-res-desktopvirtualization-workspace](#module\_avm-res-desktopvirtualization-workspace) | Azure/avm-res-desktopvirtualization-workspace/azurerm | 0.1.5 |

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_desktop_workspace_application_group_association.workappgr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_workspace_application_group_association) | resource |
| [azurerm_virtual_desktop_application_group.existing_app_groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_desktop_application_group) | data source |
| [azurerm_virtual_desktop_workspace.existing_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_desktop_workspace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_workspaces"></a> [workspaces](#input\_workspaces) | n/a | <pre>map(object({<br>    virtual_desktop_workspace_name                = string<br>    virtual_desktop_workspace_resource_group_name = string<br>    virtual_desktop_workspace_location            = string<br>    resource_group_name                           = string<br>    diagnostic_settings                           = optional(map(any))<br>    enable_telemetry                              = optional(bool)<br>    lock                                          = optional(map(any))<br>    workspaces_appgroup_association = optional(list(object({<br>      appgroup_name                = optional(string)<br>      appgroup_resource_group_name = optional(string)<br>    })))<br>    private_endpoints                                       = optional(map(any))<br>    role_assignments                                        = optional(map(any))<br>    subresource_names                                       = optional(list(string))<br>    tags                                                    = optional(map(string))<br>    tracing_tags_enabled                                    = optional(bool)<br>    tracing_tags_prefix                                     = optional(string)<br>    virtual_desktop_workspace_description                   = optional(string)<br>    virtual_desktop_workspace_friendly_name                 = optional(string)<br>    virtual_desktop_workspace_public_network_access_enabled = optional(bool)<br>    virtual_desktop_workspace_tags                          = optional(map(string))<br>    virtual_desktop_workspace_timeouts                      = optional(map(string))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource"></a> [resource](#output\_resource) | Full output for the resource, keyed by each item in for\_each |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | The ID of the Azure Virtual Desktop application group, keyed by each item in for\_each |
<!-- END_TF_DOCS -->
