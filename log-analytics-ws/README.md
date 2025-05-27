<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_avm-res-operationalinsights-workspace"></a> [avm-res-operationalinsights-workspace](#module\_avm-res-operationalinsights-workspace) | Azure/avm-res-operationalinsights-workspace/azurerm | 0.4.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_identities"></a> [additional\_identities](#input\_additional\_identities) | A list of additional identities to assign to the Log Analytics workspace. | `list(string)` | `null` | no |
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | `""` | no |
| <a name="input_appfunction"></a> [appfunction](#input\_appfunction) | app function | `string` | `""` | no |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | `""` | no |
| <a name="input_costallocation"></a> [costallocation](#input\_costallocation) | can only be sharedcosts or chargeback | `string` | `""` | no |
| <a name="input_costappownermanager"></a> [costappownermanager](#input\_costappownermanager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | `""` | no |
| <a name="input_costappownertech"></a> [costappownertech](#input\_costappownertech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | `""` | no |
| <a name="input_costbudgetowner"></a> [costbudgetowner](#input\_costbudgetowner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | `""` | no |
| <a name="input_costcostcenter"></a> [costcostcenter](#input\_costcostcenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_costdivision"></a> [costdivision](#input\_costdivision) | cost division | `string` | `""` | no |
| <a name="input_costvp"></a> [costvp](#input\_costvp) | The cost vp for resources. Used for tagging purposes. | `string` | `""` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `null` | no |
| <a name="input_log_analytics_workspace_internet_ingestion_enabled"></a> [log\_analytics\_workspace\_internet\_ingestion\_enabled](#input\_log\_analytics\_workspace\_internet\_ingestion\_enabled) | This variable is to enable/disable LAW internet ingestion | `bool` | `false` | no |
| <a name="input_log_analytics_workspace_internet_query_enabled"></a> [log\_analytics\_workspace\_internet\_query\_enabled](#input\_log\_analytics\_workspace\_internet\_query\_enabled) | This variable is to enable/disable LAW internet query | `bool` | `false` | no |
| <a name="input_log_analytics_workspace_local_authentication_disabled"></a> [log\_analytics\_workspace\_local\_authentication\_disabled](#input\_log\_analytics\_workspace\_local\_authentication\_disabled) | This variable is to enable/disable LAW local authentication | `bool` | `false` | no |
| <a name="input_log_analytics_workspace_retention_in_days"></a> [log\_analytics\_workspace\_retention\_in\_days](#input\_log\_analytics\_workspace\_retention\_in\_days) | The Log analytics workspace retention in days | `string` | `null` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | The SKU for Log analytics workspace. | `string` | `null` | no |
| <a name="input_monitor_private_link_scope"></a> [monitor\_private\_link\_scope](#input\_monitor\_private\_link\_scope) |  | <pre>map(object({<br>    name        = optional(string)<br>    resource_id = string<br>  }))</pre> | `{}` | no |
| <a name="input_monitor_private_link_scoped_service_name"></a> [monitor\_private\_link\_scoped\_service\_name](#input\_monitor\_private\_link\_scoped\_service\_name) | The name of the service to connect to the Monitor Private Link Scope. | `string` | `null` | no |
| <a name="input_monthlybudget"></a> [monthlybudget](#input\_monthlybudget) | monthly budget | `string` | `""` | no |
| <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints) | Private Endpoints for the supported resources | <pre>map(object({<br>    private_dns_zone_resource_ids   = optional(list(string))<br>    name                            = string<br>    private_service_connection_name = string<br>    tags                            = optional(map(string), null)<br>    private_dns_zone_group_name     = string<br>    location                        = string<br>    resource_group_name             = string<br>    subnet_resource_id              = string<br>  }))</pre> | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `null` | no |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Name of Log Analytics resource in Azure. |
| <a name="output_private_endpoints"></a> [private\_endpoints](#output\_private\_endpoints) | private\_endpoints |
| <a name="output_resource"></a> [resource](#output\_resource) | Resource list of Log analytics workspace |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | Id of Log Analytics resource in Azure. |
<!-- END_TF_DOCS -->

## Example Usage

```hcl
module "avm-res-operationalinsights-workspace" {
  source                                                = "Azure/avm-res-operationalinsights-workspace/azurerm"
  version                                               = "0.4.1"
  location                                              = var.location
  name                                                  = "log-${local.naming}-${var.additionalcontext}"
  resource_group_name                                   = var.resource_group_name
  log_analytics_workspace_local_authentication_disabled = var.log_analytics_workspace_local_authentication_disabled
  log_analytics_workspace_sku                           = var.log_analytics_workspace_sku
  log_analytics_workspace_retention_in_days             = var.log_analytics_workspace_retention_in_days
  log_analytics_workspace_internet_ingestion_enabled    = var.log_analytics_workspace_internet_ingestion_enabled
  log_analytics_workspace_internet_query_enabled        = var.log_analytics_workspace_internet_query_enabled
  tags                                                  = local.tags
  log_analytics_workspace_identity = {
    type         = local.identity_type
    identity_ids = var.additional_identities != null ? var.additional_identities : []
  }
  #AMPLS
  monitor_private_link_scope               = var.monitor_private_link_scope
  monitor_private_link_scoped_service_name = var.monitor_private_link_scoped_service_name
  private_endpoints                        = var.private_endpoints
}
```


## Example Tfvars

```hcl
create_resource_group = true
resource_group_name = "avmModuleTesting2"
location            = "EastUS"
# Azure Subscription ID
subscription_id = ""

# # Virtual Network Details
virtual_network_rg   = "test-rg16"
virtual_network_name = "testvnet51"
pe_subnet_name       = "default"

storage_account_name    = "teststrg"
storage_account_rg_name = "test-rg16"
additionalcontext = "01"

#Diagnostic setting
diagnostics_settings_name = "test-diag1"
enable_diagnostic_setting = true
log_categories            = []
log_category_groups       = ["allLogs"]
metric_categories         = ["Transaction"]

# Tag variable values
resourcetype        = "sub"
appid               = "test"
appname             = "infra"
env                 = "dev"
costcostcenter      = "test"
costvp              = "vp"
costappownertech    = "owner"
costappownermanager = "manager"
costbudgetowner     = "budget owner"
costdivision   = "devision-name"
appfunction    = "exmaple general dev Subscription"
costbaseline   = "2024"
costallocation = "sharedcost"
monthlybudget  = "1000"

monitor_private_link_scoped_service_name              = "privateLinkScope873"
private_dns_zones_names                               = ["test.contoso.com", "test.project.com"]
private_dns_rg                                        = "test-lumen-rg16"
log_analytics_workspace_local_authentication_disabled = false
log_analytics_workspace_sku                           = "PerGB2018"
log_analytics_workspace_retention_in_days             = "30"
log_analytics_workspace_internet_ingestion_enabled    = false
log_analytics_workspace_internet_query_enabled        = false
monitor_private_link_scope_name                       = "law_pl_scope"
```