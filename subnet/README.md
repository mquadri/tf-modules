<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.8)

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (~> 1.15)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=3.11.0, < 4.0)

- <a name="requirement_validation"></a> [validation](#requirement\_validation) (~> 1.1.1)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>=3.11.0, < 4.0)

- <a name="provider_validation"></a> [validation](#provider\_validation) (~> 1.1.1)

## Modules

The following Modules are called:

### <a name="module_avm-res-network-virtualnetwork_subnet"></a> [avm-res-network-virtualnetwork\_subnet](#module\_avm-res-network-virtualnetwork\_subnet)

Source: Azure/avm-res-network-virtualnetwork/azurerm//modules/subnet

Version: 0.8.1

## Resources

The following resources are used by this module:

- [validation_warning.appFunction](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAllocation](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAppOwnerManager](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costAppOwnerTech](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costBudgetOwner](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costCostCenter](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costDivision](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costVP](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.costbaseline](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [validation_warning.monthlyBudget](https://registry.terraform.io/providers/tlkamp/validation/latest/docs/resources/warning) (resource)
- [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)
- [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext)

Description: used for naming purposes such as 01 or 02

Type: `string`

### <a name="input_appid"></a> [appid](#input\_appid)

Description: The related application for resources. Used for tagging and naming purposes.

Type: `string`

### <a name="input_appname"></a> [appname](#input\_appname)

Description: the app name for the resources.  Used for tagging and naming purposes

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure region where resources will be deployed

Type: `string`

### <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype)

Description: the resource type being deployed see naming standards for example

Type: `string`

### <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name)

Description: The name of the VNET where this subnet will be created

Type: `string`

### <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name)

Description: The name of the resource group where the parent VNET exists

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_address_prefix"></a> [address\_prefix](#input\_address\_prefix)

Description: CIDR block for subnet

Type: `string`

Default: `null`

### <a name="input_appFunction"></a> [appFunction](#input\_appFunction)

Description: app function

Type: `string`

Default: `null`

### <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation)

Description: can only be sharedcosts or chargeback

Type: `string`

Default: `null`

### <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager)

Description: The app owner manager responsible for resources. Used for tagging purposes.

Type: `string`

Default: `null`

### <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech)

Description: The app owner responsible for resources. Used for tagging and naming purposes.

Type: `string`

Default: `null`

### <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner)

Description: The budget owner responsible for resources. Used for tagging purposes.

Type: `string`

Default: `null`

### <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter)

Description: The cost center code for resources. Used for tagging and naming purposes.

Type: `string`

Default: `null`

### <a name="input_costDivision"></a> [costDivision](#input\_costDivision)

Description: cost division

Type: `string`

Default: `null`

### <a name="input_costVP"></a> [costVP](#input\_costVP)

Description: The cost vp for resources. Used for tagging purposes.

Type: `string`

Default: `null`

### <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline)

Description: year resource created

Type: `string`

Default: `null`

### <a name="input_default_outbound_access_enabled"></a> [default\_outbound\_access\_enabled](#input\_default\_outbound\_access\_enabled)

Description: (Optional) Determines whether default outbound internet access is enabled for this subnet. This can only be set at create time.

Type: `bool`

Default: `true`

### <a name="input_env"></a> [env](#input\_env)

Description: The environment code the for resources. Used for tagging and naming purposes.

Type: `string`

Default: `null`

### <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget)

Description: monthly budget

Type: `string`

Default: `null`

### <a name="input_name"></a> [name](#input\_name)

Description: override the name of the subnet

Type: `string`

Default: `null`

### <a name="input_nat_gateway"></a> [nat\_gateway](#input\_nat\_gateway)

Description: (Optional) The ID of the NAT Gateway to associate with the subnet. Changing this forces a new resource to be created.

Type:

```hcl
object({
    id = string
  })
```

Default: `null`

### <a name="input_network_security_group"></a> [network\_security\_group](#input\_network\_security\_group)

Description: (Optional) The ID of the Network Security Group to associate with the subnet. Changing this forces a new resource to be created.

Type:

```hcl
object({
    id = string
  })
```

Default: `null`

### <a name="input_private_endpoint_network_policies"></a> [private\_endpoint\_network\_policies](#input\_private\_endpoint\_network\_policies)

Description: (Optional) Enable or Disable network policies for the private endpoint on the subnet. Possible values are `Disabled`, `Enabled`, `NetworkSecurityGroupEnabled` and `RouteTableEnabled`. Defaults to `Enabled`.

Type: `string`

Default: `"Enabled"`

### <a name="input_private_link_service_network_policies_enabled"></a> [private\_link\_service\_network\_policies\_enabled](#input\_private\_link\_service\_network\_policies\_enabled)

Description: (Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to `true` will **Enable** the policy and setting this to `false` will **Disable** the policy. Defaults to `true`.

Type: `bool`

Default: `true`

### <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments)

Description:   (Optional) A map of role assignments to create on the subnet. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

  - `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
  - `principal_id` - The ID of the principal to assign the role to.
  - `description` - (Optional) The description of the role assignment.
  - `skip_service_principal_aad_check` - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
  - `condition` - (Optional) The condition which will be used to scope the role assignment.
  - `condition_version` - (Optional) The version of the condition syntax. Leave as `null` if you are not using a condition, if you are then valid values are '2.0'.
  - `delegated_managed_identity_resource_id` - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.
  - `principal_type` - (Optional) The type of the `principal_id`. Possible values are `User`, `Group` and `ServicePrincipal`. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.

  > Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.

Type:

```hcl
map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
```

Default: `{}`

### <a name="input_route_table"></a> [route\_table](#input\_route\_table)

Description: (Optional) The ID of the route table to associate with the subnet.

Type:

```hcl
object({
    id = string
  })
```

Default: `null`

### <a name="input_service_endpoint_list"></a> [service\_endpoint\_list](#input\_service\_endpoint\_list)

Description: A list of service endpoints delegated to this VNET

Type: `list(string)`

Default: `[]`

### <a name="input_service_endpoint_policies"></a> [service\_endpoint\_policies](#input\_service\_endpoint\_policies)

Description: (Optional) A set of service endpoint policy IDs to associate with the subnet.

Type:

```hcl
map(object({
    id = string
  }))
```

Default: `null`

### <a name="input_sharing_scope"></a> [sharing\_scope](#input\_sharing\_scope)

Description: (Optional) The sharing scope for the subnet. Possible values are `DelegatedServices` and `Tenant`. Defaults to `DelegatedServices`.

Type: `string`

Default: `null`

### <a name="input_subnet_delegations"></a> [subnet\_delegations](#input\_subnet\_delegations)

Description:   A complex collection of variables which enables subnet delegation to a specific service."  
  name:  (Required) The name of service to delegate to. Possible values are Microsoft.ApiManagement/service, Microsoft.AzureCosmosDB/clusters, Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.ContainerService/managedClusters, Microsoft.Databricks/workspaces, Microsoft.DBforMySQL/flexibleServers, Microsoft.DBforMySQL/serversv2, Microsoft.DBforPostgreSQL/flexibleServers, Microsoft.DBforPostgreSQL/serversv2, Microsoft.DBforPostgreSQL/singleServers, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Kusto/clusters, Microsoft.Logic/integrationServiceEnvironments, Microsoft.LabServices/labplans, Microsoft.MachineLearningServices/workspaces, Microsoft.Netapp/volumes, Microsoft.Network/dnsResolvers, Microsoft.Network/managedResolvers, Microsoft.PowerPlatform/vnetaccesslinks, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers, Microsoft.StoragePool/diskPools, Microsoft.StreamAnalytics/streamingJobs, Microsoft.Synapse/workspaces, Microsoft.Web/hostingEnvironments, Microsoft.Web/serverFarms, Microsoft.Orbital/orbitalGateways, NGINX.NGINXPLUS/nginxDeployments, PaloAltoNetworks.Cloudngfw/firewalls, and Qumulo.Storage/fileSystems  
  actions:  A list of Actions which should be delegated. Although  this argument is optional , it is recommended to pass values for this argument to avoid unexpected results when workflows are rerun for updates to infrastructure after deployment. This list is specific to the service to delegate to. Possible values are Microsoft.Network/networkinterfaces/*, Microsoft.Network/publicIPAddresses/join/action, Microsoft.Network/publicIPAddresses/read, Microsoft.Network/virtualNetworks/read, Microsoft.Network/virtualNetworks/subnets/action, Microsoft.Network/virtualNetworks/subnets/join/action, Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action, and Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action.

Type:

```hcl
map(object({
    name    = string
    actions = list(string)
  }))
```

Default: `{}`

### <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies)

Description:     DEPRECATED: v2.3.0 ignores it. Please use 'private\_endpoint\_network\_policies' instead for versions >= v2.3.0  
    A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false.

Type: `map(bool)`

Default: `{}`

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description:   (Optional) The subscription ID to use for the feature registration.

Type: `string`

Default: `null`

### <a name="input_virtual_network"></a> [virtual\_network](#input\_virtual\_network)

Description:   (Required) The Virtual Network, into which the subnet will be created.

  - resource\_id - The ID of the Virtual Network.

Type:

```hcl
object({
    resource_id = string
  })
```

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_id"></a> [id](#output\_id)

Description: n/a

### <a name="output_name"></a> [name](#output\_name)

Description: n/a

### <a name="output_subnets"></a> [subnets](#output\_subnets)

Description: n/a
<!-- END_TF_DOCS -->