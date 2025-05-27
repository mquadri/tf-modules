<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.90)

- <a name="requirement_validation"></a> [validation](#requirement\_validation) (~> 1.1.1)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>= 3.90)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_web_application_firewall_policy.policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/web_application_firewall_policy) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_waf_policies"></a> [waf\_policies](#input\_waf\_policies)

Description: List of WAF policy configurations.

Type:

```hcl
list(object({
    resource_group_name                              = string
    location                                         = string
    policy_name                                      = string
    waf_mode                                         = optional(string)
    tags                                             = optional(map(string), {})
    policy_enabled                                   = optional(bool, true)
    policy_file_limit                                = optional(number, 100)
    policy_request_body_check_enabled                = optional(bool, true)
    policy_max_body_size                             = optional(number, 128)
    policy_request_body_enforcement                  = optional(bool, true)
    policy_request_body_inspect_limit_in_kb          = optional(number, 128)
    policy_js_challenge_cookie_expiration_in_minutes = optional(number, 30)
    custom_rules_configuration = list(object({
      name                 = optional(string)
      priority             = optional(number)
      rule_type            = optional(string)
      action               = optional(string)
      enabled              = optional(string)
      rate_limit_duration  = optional(string)
      rate_limit_threshold = optional(string)
      group_rate_limit_by  = optional(string)
      match_conditions_configuration = optional(list(object({
        match_variable_configuration = optional(list(object({
          variable_name = optional(string)
          selector      = optional(string, null)
        })))
        match_values       = optional(list(string))
        operator           = optional(string)
        negation_condition = optional(string, null)
        transforms         = optional(list(string), null)
      })))
    }))
    managed_rule_set_configuration = list(object({
      type    = optional(string, "OWASP")
      version = optional(string, "3.2")
      rule_group_override_configuration = optional(list(object({
        rule_group_name = optional(string, null)
        rule = optional(list(object({
          id      = string
          enabled = optional(bool)
          action  = optional(string)
        })), [])
      })))
    }))
    exclusion_configuration = list(object({
      match_variable          = optional(string)
      selector                = optional(string)
      selector_match_operator = optional(string)
      excluded_rule_set = optional(list(object({
        type    = optional(string, "OWASP")
        version = optional(string, "3.2")
        rule_group = optional(list(object({
          rule_group_name = string
          excluded_rules  = optional(list(string), [])
        })), [])
      })), [])
    }))
  }))
```

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_waf_details"></a> [waf\_details](#output\_waf\_details)

Description:  Details of the waf policies .
<!-- END_TF_DOCS -->