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
| <a name="module_avm-res-network-bastionhost"></a> [avm-res-network-bastionhost](#module\_avm-res-network-bastionhost) | Azure/avm-res-network-bastionhost/azurerm | 0.3.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/public_ip) | data source |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_copy_paste_enabled"></a> [copy\_paste\_enabled](#input\_copy\_paste\_enabled) | Specifies whether copy-paste functionality is enabled for the Azure Bastion Host. | `bool` | `true` | no |
| <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry) | SThis variable controls whether or not telemetry is enabled for the module | `bool` | `true` | no |
| <a name="input_file_copy_enabled"></a> [file\_copy\_enabled](#input\_file\_copy\_enabled) | Specifies whether file copy functionality is enabled for the Azure Bastion Host. | `bool` | `false` | no |
| <a name="input_ip_connect_enabled"></a> [ip\_connect\_enabled](#input\_ip\_connect\_enabled) | Specifies whether IP connect functionality is enabled for the Azure Bastion Host. | `bool` | `false` | no |
| <a name="input_kerberos_enabled"></a> [kerberos\_enabled](#input\_kerberos\_enabled) | Specifies whether Kerberos authentication is enabled for the Azure Bastion Host. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location of the Azure Bastion Host. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Azure Bastion Host. | `string` | n/a | yes |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | The IP configuration for the Azure Bastion Host.<br><br>- `name` - The name of the IP configuration.<br>- `public_ip_name` - The public ip name.<br>- `public_ip_resource_group_name` - The public ip resource group name. | <pre>map(object({<br>    name                          = string<br>    public_ip_name                = string<br>    public_ip_resource_group_name = string<br>  }))</pre> | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the Azure Bastion Host is located. | `string` | n/a | yes |
| <a name="input_scale_units"></a> [scale\_units](#input\_scale\_units) | The number of scale units for the Azure Bastion Host. | `number` | `2` | no |
| <a name="input_shareable_link_enabled"></a> [shareable\_link\_enabled](#input\_shareable\_link\_enabled) | Specifies whether shareable link functionality is enabled for the Azure Bastion Host. | `bool` | `false` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the Azure Bastion Host.<br>Valid values are 'Basic', 'Standard', and 'Developer'. | `string` | `"Basic"` | no |
| <a name="input_tunneling_enabled"></a> [tunneling\_enabled](#input\_tunneling\_enabled) | Specifies whether tunneling functionality is enabled for the Azure Bastion Host. | `bool` | `false` | no |
| <a name="input_virtual_network"></a> [virtual\_network](#input\_virtual\_network) | The vnet name and resource group name. | <pre>map(object({<br>    vnet_name                = string<br>    vnet_resource_group_name = string<br>  }))</pre> | `{}` | no |
| <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id) | The ID of the virtual network ID where the Azure Bastion Host is deployed. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_host"></a> [bastion\_host](#output\_bastion\_host) | n/a |
| <a name="output_bastion_host_id"></a> [bastion\_host\_id](#output\_bastion\_host\_id) | n/a |
<!-- END_TF_DOCS -->
