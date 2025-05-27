<!-- BEGIN_TF_DOCS -->

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.71.0)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |


## Resources

| Name | Type |
|------|------|
| [azurerm_cdn_frontdoor_profile.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_profile#attributes-reference) | resource |
| [azurerm_cdn_frontdoor_custom_domain.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_custom_domain) | resource |
| [azurerm_cdn_frontdoor_origin_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin_group) | resource |
| [azurerm_cdn_frontdoor_origin.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin) | resource |
| [azurerm_cdn_frontdoor_rule_set.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_rule_set) | resource |
| [azurerm_cdn_frontdoor_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_rule) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [azurerm\_name](#input\_name) | The name of the cdn profile. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [azurerm\_resource\_group\_name](#input\__resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_sku_name"></a> [azurerm\_lock\_sku\_name](#input\_sku\_name) | The SKU of the CDN Front Door Profile | `string` | CanNotDelete | yes |
| <a name="input_response_timeout_seconds"></a> [azurerm\_response\_timeout\_seconds](#input\_response\_timeout\_seconds) | The response timeout in seconds | `number` | n/a | yes |
| <a name="input_tags"></a> [azurerm\_tags](#input\_tags) | The tag values | `map(string)` | `{}` | yes |
| <a name="input_identity_type"></a> [azurerm\_identity\_type](#input\_identity\_type) | The type of identity | `string` | n/a | yes |
| <a name="input_identity_ids"></a> [azurerm\_identity\_ids](#input\_identity\_ids) | The identity IDs | `list(string)` | `[]` | no |
| <a name="input_custom_domain_name"></a> [azurerm\_custom\_domain\_name](#input\_custom\_domain\_name) | The name of the custom domain | `string` | n/a | yes |
| <a name="input_dns_zone_id"></a> [azurerm\_dns\_zone\_id](#input\_dns\_zone\_id) | The ID of the DNS zone | `string` | `null` | yes |
| <a name="input_host_name"></a> [azurerm\_host\_name](#input\_host\_name) | The host name for the custom domain | `string` | `null` | yes |  
| <a name="input_certificate_type"></a> [azurerm\_certificate\_type](#input\_certificate\_type) | The type of certificate to use | `string` | `ManagedCertificate` | yes |  
| <a name="input_minimum_tls_version"></a> [azurerm\_minimum\_tls\_version](#input\_minimum\_tls\_version) | The minimum TLS version to support | `string` | `TLS12` | yes |
| <a name="input_cdn_frontdoor_secret_id"></a> [azurerm\_cdn\_frontdoor\_secret\_id](#input\_cdn\_frontdoor\_secret\_id) | Resource ID of the Front Door Secret | `string` | `null` | yes |  
| <a name="input_origin_group_name"></a> [azurerm\_origin\_group\_name](#input\_origin\_group\_name) | The name of the origin group | `string` | n/a | yes |  
| <a name="input_session_affinity_enabled"></a> [azurerm\_session\_affinity\_enabled](#input\_session\_affinity\_enabled) | Whether session affinity is enabled | `bool` | `true` | yes |  
| <a name="input_restore_traffic_time"></a> [azurerm\_restore\_traffic\_time](#input\_restore\_traffic\_time) | The time to restore traffic to a healed or new endpoint in minutes | `number` | `10` | yes |  
| <a name="input_health_probe_interval"></a> [azurerm\_health\_probe\_interval](#input\_health\_probe\_interval) | The interval for health probes in seconds | `number` | `240` | yes |  
| <a name="input_health_probe_path"></a> [azurerm\_health\_probe\_path](#input\_health\_probe\_path) | The path for health probes | `string` | `/` | yes |  
| <a name="input_health_probe_protocol"></a> [azurerm\_health\_probe\_protocol](#input\_health\_probe\_protocol) | The protocol for health probes | `string` | `Https` | yes |  
| <a name="input_health_probe_request_type"></a> [azurerm\_health\_probe\_request\_type](#input\_health\_probe\_request\_type) | The request type for health probes | `string` | `HEAD` | yes |  
| <a name="input_additional_latency"></a> [azurerm\_additional\_latency](#input\_additional\_latency) | The additional latency for load balancing in milliseconds | `number` | `50` | yes |
| <a name="input_sample_size"></a> [azurerm\_sample\_size](#input\_sample\_size) | The sample size for load balancing | `number` | `4` | yes |  
| <a name="input_successful_samples_required"></a> [azurerm\_successful\_samples\_required](#input\_successful\_samples\_required) | The number of successful samples required for load balancing | `number` | `3` | yes |  
| <a name="input_origin_name"></a> [azurerm\_origin\_name](#input\_origin\_name) | The name of the origin | `string` | n/a | yes |  
| <a name="input_origin_enabled"></a> [azurerm\_origin\_enabled](#input\_origin\_enabled) | Whether the origin is enabled | `bool` | `true` | yes |  
| <a name="input_certificate_name_check_enabled"></a> [azurerm\_certificate\_name\_check\_enabled](#input\_certificate\_name\_check\_enabled) | Whether the certificate name check is enabled | `bool` | `false` | yes |  
| <a name="input_http_port"></a> [azurerm\_http\_port](#input\_http\_port) | The HTTP port for the origin | `number` | `80` | yes |  
| <a name="input_https_port"></a> [azurerm\_https\_port](#input\_https\_port) | The HTTPS port for the origin | `number` | `443` | yes |  
| <a name="input_origin_host_header"></a> [azurerm\_origin\_host\_header](#input\_origin\_host\_header) | The origin host header | `string` | `null` | yes |  
| <a name="input_priority"></a> [azurerm\_priority](#input\_priority) | The priority of the origin | `number` | `1` | yes |  
| <a name="input_weight"></a> [azurerm\_weight](#input\_weight) | The weight of the origin | `number` | `500` | yes |
| <a name="input_private_link"></a> [azurerm\_private\_link](#input\_private\_link) | The private link configuration | `object({ request_message = optional(string), target_type = optional(string), location = optional(string), private_link_target_id = optional(string) })` | `null` | yes |  
| <a name="input_rule_set_name"></a> [azurerm\_rule\_set\_name](#input\_rule\_set\_name) | The name which should be used for this Front Door Rule Set. | `string` | n/a | yes |  
| <a name="input_rule_name"></a> [azurerm\_rule\_name](#input\_rule\_name) | The name of the CDN Front Door rule. | `string` | n/a | yes |  
| <a name="input_order"></a> [azurerm\_order](#input\_order) | The order in which the rule is applied. | `number` | n/a | yes |  
| <a name="input_behavior_on_match"></a> [azurerm\_behavior\_on\_match](#input\_behavior\_on\_match) | The behavior when the rule matches a request. | `string` | `"Continue"` | yes |  
| <a name="input_forwarding_protocol"></a> [azurerm\_forwarding\_protocol](#input\_forwarding\_protocol) | The protocol to use when forwarding the request (e.g., HTTP or HTTPS). | `string` | `null` | yes |  
| <a name="input_query_string_caching_behavior"></a> [azurerm\_query\_string\_caching\_behavior](#input\_query\_string\_caching\_behavior) | Defines how query strings are handled for caching purposes. | `string` | `null` | yes |  
| <a name="input_query_string_parameters"></a> [azurerm\_query\_string\_parameters](#input\_query\_string\_parameters) | Specifies the query string parameters to include or exclude. | `list(string)` | `[]` | yes |  
| <a name="input_compression_enabled"></a> [azurerm\_compression\_enabled](#input\_compression\_enabled) | Indicates whether compression is enabled for the response. | `bool` | `null` | yes |  
| <a name="input_cache_behavior"></a> [azurerm\_cache\_behavior](#input\_cache\_behavior) | Defines the caching behavior for the request. | `string` | `null` | yes |  
| <a name="input_cache_duration"></a> [azurerm\_cache\_duration](#input\_cache\_duration) | Specifies the duration for which the response should be cached. | `string` | `null` | yes |  
| <a name="input_request_header_action_header_action"></a> [azurerm\_request\_header\_action\_header\_action](#input\_request\_header\_action\_header\_action) | The header action for the request header action | `string` | n/a | yes |  
| <a name="input_request_header_action_header_name"></a> [azurerm\_request\_header\_action\_header\_name](#input\_request\_header\_action\_header\_name) | The header name for the request header action | `string` | n/a | yes |  
| <a name="input_request_header_action_value"></a> [azurerm\_request\_header\_action\_value](#input\_request\_header\_action\_value) | The value for the request header action | `string` | `null` | yes |  
| <a name="input_url_redirect_action"></a> [azurerm\_url\_redirect\_action](#input\_url\_redirect\_action) | The URL redirect action configuration | `object({ redirect_type = optional(string), redirect_protocol = optional(string), query_string = optional(string), destination_path = optional(string), destination_hostname = optional(string), destination_fragment = optional(string) })` | `null` | yes |  
| <a name="input_url_rewrite_action"></a> [azurerm\_url\_rewrite\_action](#input\_url\_rewrite\_action) | The URL rewrite action configuration | `object({ source_pattern = optional(string), destination = optional(string), preserve_unmatched_path = optional(bool) })` | `null` | yes |  
| <a name="input_conditions"></a> [azurerm\_conditions](#input\_conditions) | The conditions for the rule | `object({ host_name_condition = optional(list(object({ operator = string, negate_condition = bool, match_values = list(string), transforms = list(string) }))), is_device_condition = optional(list(object({ operator = string, negate_condition = bool, match_values = list(string) }))), request_method_condition = optional(list(object({ operator = string, negate_condition = bool, match_values = list(string) }))), url_filename_condition = optional(list(object({ operator = string, negate_condition = bool, match_values = list(string), transforms = list(string) }))), ssl_protocol_condition = optional(list(object({ operator = string, match_values = list(string), negate_condition = bool }))), server_port_condition = optional(list(object({ operator = string, match_values = list(string), negate_condition = bool }))), client_port_condition = optional(list(object({ operator = string, match_values = list(string), negate_condition = bool }))), socket_address_condition = optional(list(object({ operator = string, match_values = list(string), negate_condition = bool }))), remote_address_condition = optional(list(object({ operator = string, match_values = list(string), negate_condition = bool }))), query_string_condition = optional(list(object({ operator = string, match_values = list(string), negate_condition = bool, transforms = list(string) }))), post_args_condition = optional(list(object({ post_args_name = string, operator = string, match_values = list(string), transforms = list(string), negate_condition = bool }))), request_header_condition = optional(list(object({ header_name = string, operator = string, match_values = list(string), transforms = list(string), negate_condition = bool }))), request_uri_condition = optional(list(object({ operator = string, match_values = list(string), transforms = list(string), negate_condition = bool }))), request_scheme_condition = optional(list(object({ operator = string, match_values = list(string), negate_condition = bool }))), request_body_condition = optional(list(object({ operator = string, match_values = list(string), negate_condition = bool, transforms = list(string) }))), cookies_condition = optional(list(object({ cookie_name = string, operator = string, match_values = list(string), transforms = list(string), negate_condition = bool }))), http_version_condition = optional(list(object({ match_values = list(string), operator = string, negate_condition = bool }))), url_file_extension_condition = optional(list(object({ operator = string, match_values = list(string), transforms = list(string), negate_condition = bool }))), url_path_condition = optional(list(object({ operator = string, match_values = list(string), transforms = list(string), negate_condition = bool }))) })` | `null` | yes |  


## Outputs

| Name | Description |  
|------|-------------|  
| <a name="output_cdn_profile_id"></a> [cdn_profile_id](#output_cdn_profile_id) | The ID of the CDN Front Door Profile |  
| <a name="output_cdn_profile_resource_guid"></a> [cdn_profile_resource_guid](#output_cdn_profile_resource_guid) | The UUID of the CDN Front Door Profile |  
| <a name="output_cdn_custom_domain_id"></a> [cdn_custom_domain_id](#output_cdn_custom_domain_id) | The ID of the Front Door Custom Domain |  
| <a name="output_cdn_custom_domain_expiration_date"></a> [cdn_custom_domain_expiration_date](#output_cdn_custom_domain_expiration_date) | The date time that the token expires |  
| <a name="output_cdn_custom_domain_validation_token"></a> [cdn_custom_domain_validation_token](#output_cdn_custom_domain_validation_token) | Challenge used for DNS TXT record or file-based validation |  
| <a name="output_cdn_origin_group_id"></a> [cdn_origin_group_id](#output_cdn_origin_group_id) | The ID of the CDN origin group |  
| <a name="output_cdn_origin_id"></a> [cdn_origin_id](#output_cdn_origin_id) | The ID of the CDN origin |  
| <a name="output_cdn_rule_set_id"></a> [cdn_rule_set_id](#output_cdn_rule_set_id) | The ID of the CDN rule set |  
| <a name="output_cdn_rule_id"></a> [cdn_rule_id](#output_cdn_rule_id) | The ID of the Front Door Rule |  
| <a name="output_cdn_frontdoor_rule_set_name"></a> [cdn_frontdoor_rule_set_name](#output_cdn_frontdoor_rule_set_name) | The name of the Front Door Rule Set containing this Front Door Rule |  


<!-- END_TF_DOCS -->