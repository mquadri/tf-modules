
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_avm-res-network-routetable"></a> [avm-res-network-routetable](#module\_avm-res-network-routetable) | Azure/avm-res-network-routetable/azurerm | 0.2.2 |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disable_bgp_route_propagation"></a> [disable\_bgp\_route\_propagation](#input\_disable\_bgp\_route\_propagation) | (Optional) Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable. | `bool` | `true` | no |
| <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry) | (Optional) This variable controls whether or not telemetry is enabled for the module.<br>    For more information see <https://aka.ms/avm/telemetryinfo>.<br>    If it is set to false, then no telemetry will be collected. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location for the resource to be deployed. <br>    Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_lock"></a> [lock](#input\_lock) | (Optional) Controls the Resource Lock configuration for this resource. The following properties can be specified:<br><br>    - `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.<br>    - `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource. | <pre>object({<br>    kind = string<br>    name = optional(string, null)<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Route Table. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments) | (Optional) A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.<br><br>    - `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.<br>    - `principal_id` - The ID of the principal to assign the role to.<br>    - `description` - The description of the role assignment.<br>    - `skip_service_principal_aad_check` - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.<br>    - `condition` - The condition which will be used to scope the role assignment.<br>    - `condition_version` - The version of the condition syntax. Valid values are '2.0'.<br><br>    > Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal. | <pre>map(object({<br>    role_definition_id_or_name             = string<br>    principal_id                           = string<br>    description                            = optional(string, null)<br>    skip_service_principal_aad_check       = optional(bool, false)<br>    condition                              = optional(string, null)<br>    condition_version                      = optional(string, null)<br>    delegated_managed_identity_resource_id = optional(string, null)<br>    principal_type                         = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_routes"></a> [routes](#input\_routes) | (Optional) A map of route objects to create on the route table. <br><br>    - `name` - (Required) The name of the route.<br>    - `address_prefix` - (Required) The destination to which the route applies. Can be CIDR (such as 10.1.0.0/16) or Azure Service Tag (such as ApiManagement, AzureBackup or AzureMonitor) format.<br>    - `next_hop_type` - (Required) The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None.<br>    - `next_hop_in_ip_address` - (Optional) Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance<br><br>    Example Input:<pre>terraform<br>routes = {<br>    route1 = {<br>      name           = "test-route-vnetlocal"<br>      address_prefix = "10.2.0.0/32"<br>      next_hop_type  = "VnetLocal"<br>    }<br>}</pre> | <pre>map(object({<br>    name                   = string<br>    address_prefix         = string<br>    next_hop_type          = string<br>    next_hop_in_ip_address = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | The subnt name, vnet and resource group name. | <pre>map(object({<br>    subnet_name          = string<br>    virtual_network_name = string<br>    rg_name              = string<br>  }))</pre> | `{}` | no |
| <a name="input_subnet_resource_ids"></a> [subnet\_resource\_ids](#input\_subnet\_resource\_ids) | (Optional) A map of string subnet ID's to associate the route table to.<br>    Each value in the map must be supplied in the form of an Azure resource ID:<pre>yaml annotate <br>/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/{vnetName}/subnets/{subnetName}</pre><pre>terraform<br>subnet_resource_ids = {<br>    subnet1 = azurerm_subnet.this.id,<br>    subnet2 = "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/{vnetName}/subnets/{subnetName}"<br>}</pre> | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Tags of the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The route table name |
| <a name="output_resource"></a> [resource](#output\_resource) | This is the full output for the route table. |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | The ID of the route table |
| <a name="output_routes"></a> [routes](#output\_routes) | This is the full output of the routes. |
<!-- END_TF_DOCS -->
