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

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_link_service.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_link_service) | resource |
| [azurerm_lb.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/lb) | data source |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_link_services"></a> [private\_link\_services](#input\_private\_link\_services) | Map containing private link services | <pre>map(object({<br>    name                           = string # (Required) Specifies the name of this Private Link Service.<br>    location                       = string # (Required) Specifies the location of this Private Link Service.<br>    frontend_ip_config_name        = string # (Required) Frontend IP Configuration name from a Standard Load Balancer, where traffic from the Private Link Service should be routed    <br>    pls_resource_group             = string # (Required) Specifies the Resource Group name of this Private Link Service.<br>    subnet_name                    = string # (Required) Specifies the name of the Subnet which should be used for the Private Link Service.<br>    vnet_name                      = string # (Required) Specifies the name of the Virtual Network which should be used for the Private Link Service.<br>    networking_resource_group      = string # (Required) Specifies the Resource Group of the Subnet which should be used for the Private Link Service.<br>    loadbalancer_name              = string<br>    lb_resource_group              = string<br>    auto_approval_subscription_ids = optional(list(string)) # (Optional) A list of Subscription UUID/GUID's that will be automatically be able to use this Private Link Service.<br>    visibility_subscription_ids    = optional(list(string)) # (Optional) A list of Subscription UUID/GUID's that will be able to see this Private Link Service.<br>    enable_proxy_protocol          = optional(bool)         # (Optional) Should the Private Link Service support the Proxy Protocol? Defaults to false.<br>    private_ip_address             = optional(string)       # (Optional) Specifies a Private Static IP Address for this IP Configuration.<br>    private_ip_address_version     = optional(string)       # (Optional) The version of the IP Protocol which should be used<br>    fqdns                          = optional(list(string))<br><br>  }))</pre> | `{}` | no |
| <a name="input_private_link_services_tags"></a> [private\_link\_services\_tags](#input\_private\_link\_services\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the Resource Group where the Private Link Service should exist | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_private_link_service_this"></a> [azurerm\_private\_link\_service\_this](#output\_azurerm\_private\_link\_service\_this) | n/a |
| <a name="output_pls_dns_names"></a> [pls\_dns\_names](#output\_pls\_dns\_names) | A globally unique DNS Name for your Private Link Service. You can use this alias to request a connection to your Private Link Service. |
| <a name="output_pls_ids"></a> [pls\_ids](#output\_pls\_ids) | Private Link Service Id |
| <a name="output_private_link_service_map_ids"></a> [private\_link\_service\_map\_ids](#output\_private\_link\_service\_map\_ids) | n/a |
<!-- END_TF_DOCS -->
