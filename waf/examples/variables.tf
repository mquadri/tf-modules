variable "waf_policies" {
  description = "List of WAF policy configurations."
  type = list(object({
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
}

# tags
variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string

  validation {
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX","NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}

