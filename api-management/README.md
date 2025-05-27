# tf-modules-azure-api-management
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
| [azurerm_api_management.apim0](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_locations"></a> [additional\_locations](#input\_additional\_locations) | The additional locations where the resource will be deployed. Example format: [{ location = "location", subnet\_id = "subnet\_id" }] | <pre>list(<br>    object(<br>      {<br>        location  = string<br>        subnet_id = string<br>      }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_azurerm_api_management_name"></a> [azurerm\_api\_management\_name](#input\_azurerm\_api\_management\_name) | The name of the API Management Service. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_enable_backend_ssl30"></a> [enable\_backend\_ssl30](#input\_enable\_backend\_ssl30) | Flag to enable/disable SSL3 on bakend | `bool` | `false` | no |
| <a name="input_enable_backend_tls10"></a> [enable\_backend\_tls10](#input\_enable\_backend\_tls10) | Flag to enable/disable TLS 1.0 on bakend | `bool` | `false` | no |
| <a name="input_enable_backend_tls11"></a> [enable\_backend\_tls11](#input\_enable\_backend\_tls11) | Flag to enable/disable 1.1 on bakend | `bool` | `false` | no |
| <a name="input_enable_frontend_ssl30"></a> [enable\_frontend\_ssl30](#input\_enable\_frontend\_ssl30) | Flag to enable/disable SSL3 on front end | `bool` | `false` | no |
| <a name="input_enable_frontend_tls10"></a> [enable\_frontend\_tls10](#input\_enable\_frontend\_tls10) | Flag to enable/disable TLS 1.0 on front end | `bool` | `false` | no |
| <a name="input_enable_frontend_tls11"></a> [enable\_frontend\_tls11](#input\_enable\_frontend\_tls11) | Flag to enable/disable 1.1 on front end | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The region were the resource will be deployed. | `any` | n/a | yes |
| <a name="input_publisher_email"></a> [publisher\_email](#input\_publisher\_email) | The email of publisher/company. | `any` | n/a | yes |
| <a name="input_publisher_name"></a> [publisher\_name](#input\_publisher\_name) | The name of publisher/company. | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group name. | `any` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | sku\_name is a string consisting of two parts separated by an underscore(\_). The fist part is the name, valid values include: Consumption, Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer\_1). | `string` | `"Developer_1"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The id of the subnet that will be used for the API Management. | `any` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |
| <a name="input_tls_ecdheRsa_with_aes128_cbc_sha_ciphers_enabled"></a> [tls\_ecdheRsa\_with\_aes128\_cbc\_sha\_ciphers\_enabled](#input\_tls\_ecdheRsa\_with\_aes128\_cbc\_sha\_ciphers\_enabled) | Should the TLS\_ECDHE\_RSA\_WITH\_AES\_128\_CBC\_SHA cipher be enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_tls_ecdheRsa_with_aes256_cbc_sha_ciphers_enabled"></a> [tls\_ecdheRsa\_with\_aes256\_cbc\_sha\_ciphers\_enabled](#input\_tls\_ecdheRsa\_with\_aes256\_cbc\_sha\_ciphers\_enabled) | Should the TLS\_ECDHE\_RSA\_WITH\_AES\_256\_CBC\_SHA cipher be enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled"></a> [tls\_ecdhe\_ecdsa\_with\_aes128\_cbc\_sha\_ciphers\_enabled](#input\_tls\_ecdhe\_ecdsa\_with\_aes128\_cbc\_sha\_ciphers\_enabled) | Flag to enable/disable TLS\_ECDHE\_ECDSA\_WITH\_AES\_128\_CBC\_SHA | `bool` | `false` | no |
| <a name="input_tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled"></a> [tls\_ecdhe\_ecdsa\_with\_aes256\_cbc\_sha\_ciphers\_enabled](#input\_tls\_ecdhe\_ecdsa\_with\_aes256\_cbc\_sha\_ciphers\_enabled) | Flag to enable/disable TLS\_ECDHE\_ECDSA\_WITH\_AES\_256\_CBC\_SHA | `bool` | `false` | no |
| <a name="input_tls_rsa_with_aes128_cbc_sha256_ciphers_enabled"></a> [tls\_rsa\_with\_aes128\_cbc\_sha256\_ciphers\_enabled](#input\_tls\_rsa\_with\_aes128\_cbc\_sha256\_ciphers\_enabled) | Should the cipher tls\_rsa\_with\_aes128\_cbc\_sha256 be enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_tls_rsa_with_aes128_cbc_sha_ciphers_enabled"></a> [tls\_rsa\_with\_aes128\_cbc\_sha\_ciphers\_enabled](#input\_tls\_rsa\_with\_aes128\_cbc\_sha\_ciphers\_enabled) | Should the tls\_rsa\_with\_aes128\_cbc\_sha cipher be enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_tls_rsa_with_aes128_gcm_sha256_ciphers_enabled"></a> [tls\_rsa\_with\_aes128\_gcm\_sha256\_ciphers\_enabled](#input\_tls\_rsa\_with\_aes128\_gcm\_sha256\_ciphers\_enabled) | Should the tls\_rsa\_with\_aes128\_gcm\_sha256 cipher be enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_tls_rsa_with_aes256_cbc_sha256_ciphers_enabled"></a> [tls\_rsa\_with\_aes256\_cbc\_sha256\_ciphers\_enabled](#input\_tls\_rsa\_with\_aes256\_cbc\_sha256\_ciphers\_enabled) | Should the tls\_rsa\_with\_aes256\_cbc\_sha256 cipher be enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_tls_rsa_with_aes256_cbc_sha_ciphers_enabled"></a> [tls\_rsa\_with\_aes256\_cbc\_sha\_ciphers\_enabled](#input\_tls\_rsa\_with\_aes256\_cbc\_sha\_ciphers\_enabled) | Should the tls\_rsa\_with\_aes256\_cbc\_sha cipher be enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_triple_des_ciphers_enabled"></a> [triple\_des\_ciphers\_enabled](#input\_triple\_des\_ciphers\_enabled) | Should the triple\_des cipher be enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_virtual_network_type"></a> [virtual\_network\_type](#input\_virtual\_network\_type) | The type of virtual network you want to use, valid values include: None, External, Internal. | `string` | `"None"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_additional_location"></a> [additional\_location](#output\_additional\_location) | Zero or more `additional_location` blocks. |
| <a name="output_additional_location_private_ip_addresses"></a> [additional\_location\_private\_ip\_addresses](#output\_additional\_location\_private\_ip\_addresses) | Private IP Addresses array from the first `additional_location` block. |
| <a name="output_id"></a> [id](#output\_id) | Specifies the id of the API Management |
| <a name="output_identity"></a> [identity](#output\_identity) | Specifies the identity of the API Management |
| <a name="output_name"></a> [name](#output\_name) | Specifies the name of the API Management |
| <a name="output_principal_id"></a> [principal\_id](#output\_principal\_id) | Specifies the identity of the API Management |
| <a name="output_private_ip_addresses"></a> [private\_ip\_addresses](#output\_private\_ip\_addresses) | n/a |
| <a name="output_public_ip_addresses"></a> [public\_ip\_addresses](#output\_public\_ip\_addresses) | n/a |
| <a name="output_url"></a> [url](#output\_url) | Specifies the url of the API Management |
<!-- END_TF_DOCS -->