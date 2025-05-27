
<!-- BEGIN_TF_DOCS -->
# Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 1.15 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | > 3.89 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.117.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app-subnet"></a> [app-subnet](#module\_app-subnet) | Azure/app-subnet/azurerm | 0.8.1 |
| <a name="module_application-resource-group"></a> [application-resource-group](#module\_application-resource-group) | Azure/application-resource-group/azurerm | 0.8.1 |
| <a name="module_nsg-subnet-association"></a> [nsg-subnet-association](#module\_nsg-subnet-association) | Azure/nsg-subnet-association/azurerm | 0.8.1 |

## Resources

| Name | Type |
|------|------|


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_address_prefix"></a> [address\_prefix](#input\_address\_prefix) | CIDR block for subnet | `string` | n/a | yes |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | n/a | yes |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | n/a | yes |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | n/a | yes |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | n/a | yes |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | n/a | yes |
| <a name="input_default_outbound_access_enabled"></a> [default\_outbound\_access\_enabled](#input\_default\_outbound\_access\_enabled) | (Optional) Determines whether default outbound internet access is enabled for this subnet. This can only be set at create time. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | n/a | yes |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | override the name of the subnet | `string` | `null` | no |
| <a name="input_nat_gateway"></a> [nat\_gateway](#input\_nat\_gateway) | (Optional) The ID of the NAT Gateway to associate with the subnet. Changing this forces a new resource to be created. | <pre>object({<br>    id = string<br>  })</pre> | `null` | no |
| <a name="input_network_security_group"></a> [network\_security\_group](#input\_network\_security\_group) | (Optional) The ID of the Network Security Group to associate with the subnet. Changing this forces a new resource to be created. | <pre>object({<br>    id = string<br>  })</pre> | `null` | no |
| <a name="input_private_endpoint_network_policies"></a> [private\_endpoint\_network\_policies](#input\_private\_endpoint\_network\_policies) | (Optional) Enable or Disable network policies for the private endpoint on the subnet. Possible values are `Disabled`, `Enabled`, `NetworkSecurityGroupEnabled` and `RouteTableEnabled`. Defaults to `Enabled`. | `string` | `"Enabled"` | no |
| <a name="input_private_link_service_network_policies_enabled"></a> [private\_link\_service\_network\_policies\_enabled](#input\_private\_link\_service\_network\_policies\_enabled) | (Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to `true` will **Enable** the policy and setting this to `false` will **Disable** the policy. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | n/a | yes |
| <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments) | (Optional) A map of role assignments to create on the subnet. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.<br><br>  - `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.<br>  - `principal_id` - The ID of the principal to assign the role to.<br>  - `description` - (Optional) The description of the role assignment.<br>  - `skip_service_principal_aad_check` - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.<br>  - `condition` - (Optional) The condition which will be used to scope the role assignment.<br>  - `condition_version` - (Optional) The version of the condition syntax. Leave as `null` if you are not using a condition, if you are then valid values are '2.0'.<br>  - `delegated_managed_identity_resource_id` - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.<br>  - `principal_type` - (Optional) The type of the `principal_id`. Possible values are `User`, `Group` and `ServicePrincipal`. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.<br><br>  > Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal. | <pre>map(object({<br>    role_definition_id_or_name             = string<br>    principal_id                           = string<br>    description                            = optional(string, null)<br>    skip_service_principal_aad_check       = optional(bool, false)<br>    condition                              = optional(string, null)<br>    condition_version                      = optional(string, null)<br>    delegated_managed_identity_resource_id = optional(string, null)<br>    principal_type                         = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_route_table"></a> [route\_table](#input\_route\_table) | (Optional) The ID of the route table to associate with the subnet. | <pre>object({<br>    id = string<br>  })</pre> | `null` | no |
| <a name="input_service_endpoint_list"></a> [service\_endpoint\_list](#input\_service\_endpoint\_list) | A list of service endpoints delegated to this VNET | `list(string)` | `[]` | no |
| <a name="input_service_endpoint_policies"></a> [service\_endpoint\_policies](#input\_service\_endpoint\_policies) | (Optional) A set of service endpoint policy IDs to associate with the subnet. | <pre>map(object({<br>    id = string<br>  }))</pre> | `null` | no |
| <a name="input_sharing_scope"></a> [sharing\_scope](#input\_sharing\_scope) | (Optional) The sharing scope for the subnet. Possible values are `DelegatedServices` and `Tenant`. Defaults to `DelegatedServices`. | `string` | `null` | no |
| <a name="input_subnet_delegations"></a> [subnet\_delegations](#input\_subnet\_delegations) | A complex collection of variables which enables subnet delegation to a specific service."<br>  name:  (Required) The name of service to delegate to. Possible values are Microsoft.ApiManagement/service, Microsoft.AzureCosmosDB/clusters, Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.ContainerService/managedClusters, Microsoft.Databricks/workspaces, Microsoft.DBforMySQL/flexibleServers, Microsoft.DBforMySQL/serversv2, Microsoft.DBforPostgreSQL/flexibleServers, Microsoft.DBforPostgreSQL/serversv2, Microsoft.DBforPostgreSQL/singleServers, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Kusto/clusters, Microsoft.Logic/integrationServiceEnvironments, Microsoft.LabServices/labplans, Microsoft.MachineLearningServices/workspaces, Microsoft.Netapp/volumes, Microsoft.Network/dnsResolvers, Microsoft.Network/managedResolvers, Microsoft.PowerPlatform/vnetaccesslinks, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers, Microsoft.StoragePool/diskPools, Microsoft.StreamAnalytics/streamingJobs, Microsoft.Synapse/workspaces, Microsoft.Web/hostingEnvironments, Microsoft.Web/serverFarms, Microsoft.Orbital/orbitalGateways, NGINX.NGINXPLUS/nginxDeployments, PaloAltoNetworks.Cloudngfw/firewalls, and Qumulo.Storage/fileSystems<br>  actions:  A list of Actions which should be delegated. Although  this argument is optional , it is recommended to pass values for this argument to avoid unexpected results when workflows are rerun for updates to infrastructure after deployment. This list is specific to the service to delegate to. Possible values are Microsoft.Network/networkinterfaces/*, Microsoft.Network/publicIPAddresses/join/action, Microsoft.Network/publicIPAddresses/read, Microsoft.Network/virtualNetworks/read, Microsoft.Network/virtualNetworks/subnets/action, Microsoft.Network/virtualNetworks/subnets/join/action, Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action, and Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action. | <pre>map(object({<br>    name    = string<br>    actions = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | DEPRECATED: v2.3.0 ignores it. Please use 'private\_endpoint\_network\_policies' instead for versions >= v2.3.0<br>    A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false. | `map(bool)` | `{}` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | (Optional) The subscription ID to use for the feature registration. | `string` | `null` | no |
| <a name="input_virtual_network"></a> [virtual\_network](#input\_virtual\_network) | (Required) The Virtual Network, into which the subnet will be created.<br><br>  - resource\_id - The ID of the Virtual Network. | <pre>object({<br>    resource_id = string<br>  })</pre> | `null` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the VNET where this subnet will be created | `string` | n/a | yes |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | The name of the resource group where the parent VNET exists | `string` | n/a | yes |
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | n/a | yes |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | n/a | yes |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | n/a | yes |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | n/a | yes |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | n/a | yes |
| <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry) | This variable controls whether or not telemetry is enabled for the module.<br>For more information see <https://aka.ms/avm/telemetryinfo>.<br>If it is set to false, then no telemetry will be collected. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Required. The Azure region for deployment of the this resource. | `string` | n/a | yes |
| <a name="input_lock"></a> [lock](#input\_lock) | Controls the Resource Lock configuration for this resource. The following properties can be specified:<br><br>  - `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.<br>  - `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource. | <pre>object({<br>    kind = string<br>    name = optional(string, null)<br>  })</pre> | `null` | no |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | resource group is managed by | `string` | `null` | no |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | If we don't give the name, it will be created by local naming convention | `string` | `null` | no |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | resource type -- 3 letters | `string` | n/a | yes |
| <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments) | Optional. A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.<br><br>- `role_definition_id_or_name` - (Required) The ID or name of the role definition to assign to the principal.<br>- `principal_id` - (Required) The ID of the principal to assign the role to.<br>- `description` - (Optional) The description of the role assignment.<br>- `skip_service_principal_aad_check` - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.<br>- `condition` - (Optional) The condition which will be used to scope the role assignment.<br>- `condition_version` - (Optional) The version of the condition syntax. Valid values are '2.0'.<br>- `delegated_managed_identity_resource_id` - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. NOTE:<br>this field is only used in cross tenant scenario.<br><br>> Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.<br><br>Example Input:<pre>hcl<br>role_assignments = {<br>  "role_assignment1" = {<br>    role_definition_id_or_name = "Reader"<br>    principal_id = "4179302c-702e-4de7-a061-beacd0a1be09"<br>    <br>  },<br>"role_assignment2" = {<br>  role_definition_id_or_name = "2a2b9908-6ea1-4ae2-8e65-a410df84e7d1" // Storage Blob Data Reader Role Guid <br>  principal_id = "4179302c-702e-4de7-a061-beacd0a1be09"<br>  skip_service_principal_aad_check = false<br>  condition_version = "2.0"<br>  condition = <<-EOT<br>(<br>  (<br>    !(ActionMatches{'Microsoft.Authorization/roleAssignments/write'})<br>  )<br>OR <br>  (<br>  @Request[Microsoft.Authorization/roleAssignments:RoleDefinitionId]<br>  ForAnyOfAnyValues:GuidEquals {4179302c-702e-4de7-a061-beacd0a1be09}<br>  )<br>)<br>AND<br>(<br>  (<br>    !(ActionMatches{'Microsoft.Authorization/roleAssignments/delete'})<br>  )<br>  OR <br>  (<br>    @Resource[Microsoft.Authorization/roleAssignments:RoleDefinitionId]<br>    ForAnyOfAnyValues:GuidEquals {dc887ae1-fe50-4307-be53-213ff08f3c0b}<br>  )<br>)<br>EOT  <br>  }<br>}</pre> | <pre>map(object({<br>    role_definition_id_or_name             = string<br>    principal_id                           = string<br>    description                            = optional(string, null)<br>    skip_service_principal_aad_check       = optional(bool, false)<br>    condition                              = optional(string, null)<br>    condition_version                      = optional(string, null)<br>    delegated_managed_identity_resource_id = optional(string, null)<br>    principal_type                         = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Tags of the resource. | `map(string)` | `null` | no |
| <a name="input_nsg_association"></a> [nsg\_association](#input\_nsg\_association) | Associates NSGs with subnet | <pre>map(object({<br>    nsg_name                 = string<br>    nsg_resource_group       = string<br>    subnet_name              = string<br>    vnet_name                = string<br>    vnet_resource_group_name = string<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | A map of subnet names to their IDs. |
| <a name="output_name"></a> [name](#output\_name) | The name of the resource group |
| <a name="output_resource"></a> [resource](#output\_resource) | This is the full output for the resource group. |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | The resource Id of the resource group |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | n/a |
<!-- END_TF_DOCS -->