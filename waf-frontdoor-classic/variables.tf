variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "Resource location"
  type        = string
}

variable "policy_name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "waf_mode" {
  type        = string
  default     = null
  description = "Describes if it is in detection mode or prevention mode at the policy level. Valid values are Detection and Prevention"
}

variable "rules_custom" {
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p21" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p22" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p23" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p24" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p25" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p26" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p27" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p28" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p29" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p30" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p31" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p32" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p33" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p34" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p35" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}

variable "rules_custom_p36" {
  description = "Standard Geo-fencing rule"
  type = object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  })
  default = null
}


variable "additional_custom_rules" {
  description = "One or more custom_rules blocks"
  type = list(object({
    action               = string
    name                 = string
    priority             = number
    rule_type            = string
    rate_limit_duration  = optional(number)
    rate_limit_threshold = optional(number)
    match_conditions_configuration = optional(list(object({
      variable_name      = optional(string)
      selector           = optional(string, null)
      match_values       = optional(list(string))
      operator           = optional(string)
      negation_condition = optional(string, null)
      transforms         = optional(list(string), null)
    })))
  }))
  default = null
}

# Core Rule Set Inventory - Paranoia Level 1
# Rules Enabled with Block
# https://www.netnea.com/cms/core-rule-set-inventory/
# https://cloud.google.com/armor/docs/waf-rules

variable "enable_942100" {
  type    = bool
  default = true
}

variable "action_942100" {
  type    = string
  default = "Block"
}

variable "enable_942140" {
  type    = bool
  default = true
}

variable "action_942140" {
  type    = string
  default = "Block"
}

variable "enable_942160" {
  type    = bool
  default = true
}

variable "action_942160" {
  type    = string
  default = "Block"
}

variable "enable_942170" {
  type    = bool
  default = true
}

variable "action_942170" {
  type    = string
  default = "Block"
}

variable "enable_942190" {
  type    = bool
  default = true
}

variable "action_942190" {
  type    = string
  default = "Block"
}

variable "enable_942220" {
  type    = bool
  default = true
}

variable "action_942220" {
  type    = string
  default = "Block"
}

variable "enable_942230" {
  type    = bool
  default = true
}

variable "action_942230" {
  type    = string
  default = "Block"
}

variable "enable_942240" {
  type    = bool
  default = true
}

variable "action_942240" {
  type    = string
  default = "Block"
}

variable "enable_942250" {
  type    = bool
  default = true
}

variable "action_942250" {
  type    = string
  default = "Block"
}

variable "enable_942270" {
  type    = bool
  default = true
}

variable "action_942270" {
  type    = string
  default = "Block"
}

variable "enable_942280" {
  type    = bool
  default = true
}

variable "action_942280" {
  type    = string
  default = "Block"
}

variable "enable_942290" {
  type    = bool
  default = true
}

variable "action_942290" {
  type    = string
  default = "Block"
}

variable "enable_942320" {
  type    = bool
  default = true
}

variable "action_942320" {
  type    = string
  default = "Block"
}

variable "enable_942350" {
  type    = bool
  default = true
}

variable "action_942350" {
  type    = string
  default = "Block"
}

variable "enable_942360" {
  type    = bool
  default = true
}

variable "action_942360" {
  type    = string
  default = "Block"
}

variable "enable_941100" {
  type    = bool
  default = true
}

variable "action_941100" {
  type    = string
  default = "Block"
}

variable "enable_941110" {
  type    = bool
  default = true
}

variable "action_941110" {
  type    = string
  default = "Block"
}

variable "enable_941120" {
  type    = bool
  default = true
}

variable "action_941120" {
  type    = string
  default = "Block"
}

variable "enable_941130" {
  type    = bool
  default = true
}

variable "action_941130" {
  type    = string
  default = "Block"
}

variable "enable_941140" {
  type    = bool
  default = true
}

variable "action_941140" {
  type    = string
  default = "Block"
}

variable "enable_941160" {
  type    = bool
  default = true
}

variable "action_941160" {
  type    = string
  default = "Block"
}

variable "enable_941170" {
  type    = bool
  default = true
}

variable "action_941170" {
  type    = string
  default = "Block"
}

variable "enable_941180" {
  type    = bool
  default = true
}

variable "action_941180" {
  type    = string
  default = "Block"
}

variable "enable_941190" {
  type    = bool
  default = true
}

variable "action_941190" {
  type    = string
  default = "Block"
}

variable "enable_941200" {
  type    = bool
  default = true
}

variable "action_941200" {
  type    = string
  default = "Block"
}

variable "enable_941210" {
  type    = bool
  default = true
}

variable "action_941210" {
  type    = string
  default = "Block"
}

variable "enable_941220" {
  type    = bool
  default = true
}

variable "action_941220" {
  type    = string
  default = "Block"
}

variable "enable_941230" {
  type    = bool
  default = true
}

variable "action_941230" {
  type    = string
  default = "Block"
}

variable "enable_941240" {
  type    = bool
  default = true
}

variable "action_941240" {
  type    = string
  default = "Block"
}

variable "enable_941250" {
  type    = bool
  default = true
}

variable "action_941250" {
  type    = string
  default = "Block"
}

variable "enable_941260" {
  type    = bool
  default = true
}

variable "action_941260" {
  type    = string
  default = "Block"
}

variable "enable_941270" {
  type    = bool
  default = true
}

variable "action_941270" {
  type    = string
  default = "Block"
}

variable "enable_941280" {
  type    = bool
  default = true
}

variable "action_941280" {
  type    = string
  default = "Block"
}

variable "enable_941290" {
  type    = bool
  default = true
}

variable "action_941290" {
  type    = string
  default = "Block"
}

variable "enable_941300" {
  type    = bool
  default = true
}

variable "action_941300" {
  type    = string
  default = "Block"
}

variable "enable_941310" {
  type    = bool
  default = true
}

variable "action_941310" {
  type    = string
  default = "Block"
}

variable "enable_941350" {
  type    = bool
  default = true
}

variable "action_941350" {
  type    = string
  default = "Block"
}

variable "enable_941360" {
  type    = bool
  default = true
}

variable "action_941360" {
  type    = string
  default = "Block"
}

variable "enable_941370" {
  type    = bool
  default = true
}

variable "action_941370" {
  type    = string
  default = "Block"
}

variable "enable_930100" {
  type    = bool
  default = true
}

variable "action_930100" {
  type    = string
  default = "Block"
}

variable "enable_930110" {
  type    = bool
  default = true
}

variable "action_930110" {
  type    = string
  default = "Block"
}

variable "enable_930120" {
  type    = bool
  default = true
}

variable "action_930120" {
  type    = string
  default = "Block"
}

variable "enable_930130" {
  type    = bool
  default = true
}

variable "action_930130" {
  type    = string
  default = "Block"
}

variable "enable_932100" {
  type    = bool
  default = true
}

variable "action_932100" {
  type    = string
  default = "Block"
}

variable "enable_932105" {
  type    = bool
  default = true
}

variable "action_932105" {
  type    = string
  default = "Block"
}

variable "enable_932110" {
  type    = bool
  default = true
}

variable "action_932110" {
  type    = string
  default = "Block"
}

variable "enable_932115" {
  type    = bool
  default = true
}

variable "action_932115" {
  type    = string
  default = "Block"
}

variable "enable_932120" {
  type    = bool
  default = true
}

variable "action_932120" {
  type    = string
  default = "Block"
}

variable "enable_932130" {
  type    = bool
  default = true
}

variable "action_932130" {
  type    = string
  default = "Block"
}

variable "enable_932140" {
  type    = bool
  default = true
}

variable "action_932140" {
  type    = string
  default = "Block"
}

variable "enable_932150" {
  type    = bool
  default = true
}

variable "action_932150" {
  type    = string
  default = "Block"
}

variable "enable_932160" {
  type    = bool
  default = true
}

variable "action_932160" {
  type    = string
  default = "Block"
}

variable "enable_932170" {
  type    = bool
  default = true
}

variable "action_932170" {
  type    = string
  default = "Block"
}

variable "enable_932171" {
  type    = bool
  default = true
}

variable "action_932171" {
  type    = string
  default = "Block"
}

variable "enable_932180" {
  type    = bool
  default = true
}

variable "action_932180" {
  type    = string
  default = "Block"
}

variable "enable_931100" {
  type    = bool
  default = true
}

variable "action_931100" {
  type    = string
  default = "Block"
}

variable "enable_931110" {
  type    = bool
  default = true
}

variable "action_931110" {
  type    = string
  default = "Block"
}

variable "enable_931120" {
  type    = bool
  default = true
}

variable "action_931120" {
  type    = string
  default = "Block"
}

variable "enable_911100" {
  type    = bool
  default = true
}

variable "action_911100" {
  type    = string
  default = "Block"
}

variable "enable_913100" {
  type    = bool
  default = true
}

variable "action_913100" {
  type    = string
  default = "Block"
}

variable "enable_913110" {
  type    = bool
  default = true
}

variable "action_913110" {
  type    = string
  default = "Block"
}

variable "enable_913120" {
  type    = bool
  default = true
}

variable "action_913120" {
  type    = string
  default = "Block"
}

variable "enable_921110" {
  type    = bool
  default = true
}

variable "action_921110" {
  type    = string
  default = "Block"
}

variable "enable_921120" {
  type    = bool
  default = true
}

variable "action_921120" {
  type    = string
  default = "Block"
}

variable "enable_921130" {
  type    = bool
  default = true
}

variable "action_921130" {
  type    = string
  default = "Block"
}

variable "enable_921140" {
  type    = bool
  default = true
}

variable "action_921140" {
  type    = string
  default = "Block"
}

variable "enable_921150" {
  type    = bool
  default = true
}

variable "action_921150" {
  type    = string
  default = "Block"
}

variable "enable_921160" {
  type    = bool
  default = true
}

variable "action_921160" {
  type    = string
  default = "Block"
}

variable "enable_921190" {
  type    = bool
  default = true
}

variable "action_921190" {
  type    = string
  default = "Block"
}

variable "enable_921200" {
  type    = bool
  default = true
}

variable "action_921200" {
  type    = string
  default = "Block"
}

variable "enable_933100" {
  type    = bool
  default = true
}

variable "action_933100" {
  type    = string
  default = "Block"
}

variable "enable_933110" {
  type    = bool
  default = true
}

variable "action_933110" {
  type    = string
  default = "Block"
}

variable "enable_933120" {
  type    = bool
  default = true
}

variable "action_933120" {
  type    = string
  default = "Block"
}

variable "enable_933130" {
  type    = bool
  default = true
}

variable "action_933130" {
  type    = string
  default = "Block"
}

variable "enable_933140" {
  type    = bool
  default = true
}

variable "action_933140" {
  type    = string
  default = "Block"
}

variable "enable_933200" {
  type    = bool
  default = true
}

variable "action_933200" {
  type    = string
  default = "Block"
}

variable "enable_933150" {
  type    = bool
  default = true
}

variable "action_933150" {
  type    = string
  default = "Block"
}

variable "enable_933160" {
  type    = bool
  default = true
}

variable "action_933160" {
  type    = string
  default = "Block"
}

variable "enable_933170" {
  type    = bool
  default = true
}

variable "action_933170" {
  type    = string
  default = "Block"
}

variable "enable_933180" {
  type    = bool
  default = true
}

variable "action_933180" {
  type    = string
  default = "Block"
}

variable "enable_933210" {
  type    = bool
  default = true
}

variable "action_933210" {
  type    = string
  default = "Block"
}

variable "enable_943100" {
  type    = bool
  default = true
}

variable "action_943100" {
  type    = string
  default = "Block"
}

variable "enable_943110" {
  type    = bool
  default = true
}

variable "action_943110" {
  type    = string
  default = "Block"
}

variable "enable_943120" {
  type    = bool
  default = true
}

variable "action_943120" {
  type    = string
  default = "Block"
}

variable "enable_944100" {
  type    = bool
  default = true
}

variable "action_944100" {
  type    = string
  default = "Block"
}

variable "enable_944110" {
  type    = bool
  default = true
}

variable "action_944110" {
  type    = string
  default = "Block"
}

variable "enable_944120" {
  type    = bool
  default = true
}

variable "action_944120" {
  type    = string
  default = "Block"
}

variable "enable_944130" {
  type    = bool
  default = true
}

variable "action_944130" {
  type    = string
  default = "Block"
}

variable "enable_934100" {
  type    = bool
  default = true
}

variable "action_934100" {
  type    = string
  default = "Block"
}

variable "enable_044228" {
  type    = bool
  default = true
}

variable "action_044228" {
  type    = string
  default = "Block"
}

variable "enable_144228" {
  type    = bool
  default = true
}

variable "action_144228" {
  type    = string
  default = "Block"
}

# Core Rule Set Inventory - Paranoia Level 2/3/4
# Rules Enabled with Log
# https://www.netnea.com/cms/core-rule-set-inventory/
# https://cloud.google.com/armor/docs/waf-rules


variable "enable_200002" {
  type    = bool
  default = true
}

variable "action_200002" {
  type    = string
  default = "Log"
}

variable "enable_200003" {
  type    = bool
  default = true
}

variable "action_200003" {
  type    = string
  default = "Log"
}

variable "enable_200004" {
  type    = bool
  default = true
}

variable "action_200004" {
  type    = string
  default = "Log"
}

variable "enable_913101" {
  type    = bool
  default = true
}

variable "action_913101" {
  type    = string
  default = "Log"
}

variable "enable_913102" {
  type    = bool
  default = true
}

variable "action_913102" {
  type    = string
  default = "Log"
}

variable "enable_920100" {
  type    = bool
  default = true
}

variable "action_920100" {
  type    = string
  default = "Log"
}

variable "enable_920120" {
  type    = bool
  default = true
}

variable "action_920120" {
  type    = string
  default = "Log"
}

variable "enable_920121" {
  type    = bool
  default = true
}

variable "action_920121" {
  type    = string
  default = "Log"
}

variable "enable_920160" {
  type    = bool
  default = true
}

variable "action_920160" {
  type    = string
  default = "Log"
}

variable "enable_920170" {
  type    = bool
  default = true
}

variable "action_920170" {
  type    = string
  default = "Log"
}

variable "enable_920171" {
  type    = bool
  default = true
}

variable "action_920171" {
  type    = string
  default = "Log"
}

variable "enable_920180" {
  type    = bool
  default = true
}

variable "action_920180" {
  type    = string
  default = "Log"
}

variable "enable_920190" {
  type    = bool
  default = true
}

variable "action_920190" {
  type    = string
  default = "Log"
}

variable "enable_920200" {
  type    = bool
  default = true
}

variable "action_920200" {
  type    = string
  default = "Log"
}

variable "enable_920201" {
  type    = bool
  default = true
}

variable "action_920201" {
  type    = string
  default = "Log"
}

variable "enable_920202" {
  type    = bool
  default = true
}

variable "action_920202" {
  type    = string
  default = "Log"
}

variable "enable_920210" {
  type    = bool
  default = true
}

variable "action_920210" {
  type    = string
  default = "Log"
}

variable "enable_920220" {
  type    = bool
  default = true
}

variable "action_920220" {
  type    = string
  default = "Log"
}

variable "enable_920230" {
  type    = bool
  default = true
}

variable "action_920230" {
  type    = string
  default = "Log"
}

variable "enable_920240" {
  type    = bool
  default = true
}

variable "action_920240" {
  type    = string
  default = "Log"
}

variable "enable_920250" {
  type    = bool
  default = true
}

variable "action_920250" {
  type    = string
  default = "Log"
}

variable "enable_920260" {
  type    = bool
  default = true
}

variable "action_920260" {
  type    = string
  default = "Log"
}

variable "enable_920270" {
  type    = bool
  default = true
}

variable "action_920270" {
  type    = string
  default = "Log"
}

variable "enable_920271" {
  type    = bool
  default = true
}

variable "action_920271" {
  type    = string
  default = "Log"
}

variable "enable_920272" {
  type    = bool
  default = true
}

variable "action_920272" {
  type    = string
  default = "Log"
}

variable "enable_920273" {
  type    = bool
  default = true
}

variable "action_920273" {
  type    = string
  default = "Log"
}

variable "enable_920274" {
  type    = bool
  default = true
}

variable "action_920274" {
  type    = string
  default = "Log"
}

variable "enable_920280" {
  type    = bool
  default = true
}

variable "action_920280" {
  type    = string
  default = "Log"
}

variable "enable_920290" {
  type    = bool
  default = true
}

variable "action_920290" {
  type    = string
  default = "Log"
}

variable "enable_920300" {
  type    = bool
  default = true
}

variable "action_920300" {
  type    = string
  default = "Log"
}

variable "enable_920310" {
  type    = bool
  default = true
}

variable "action_920310" {
  type    = string
  default = "Log"
}

variable "enable_920311" {
  type    = bool
  default = true
}

variable "action_920311" {
  type    = string
  default = "Log"
}

variable "enable_920320" {
  type    = bool
  default = true
}

variable "action_920320" {
  type    = string
  default = "Log"
}

variable "enable_920330" {
  type    = bool
  default = true
}

variable "action_920330" {
  type    = string
  default = "Log"
}

variable "enable_920340" {
  type    = bool
  default = true
}

variable "action_920340" {
  type    = string
  default = "Log"
}

variable "enable_920341" {
  type    = bool
  default = true
}

variable "action_920341" {
  type    = string
  default = "Log"
}

variable "enable_920350" {
  type    = bool
  default = true
}

variable "action_920350" {
  type    = string
  default = "Log"
}

variable "enable_920420" {
  type    = bool
  default = true
}

variable "action_920420" {
  type    = string
  default = "Log"
}

variable "enable_920430" {
  type    = bool
  default = true
}

variable "action_920430" {
  type    = string
  default = "Log"
}

variable "enable_920440" {
  type    = bool
  default = true
}

variable "action_920440" {
  type    = string
  default = "Log"
}

variable "enable_920450" {
  type    = bool
  default = true
}

variable "action_920450" {
  type    = string
  default = "Log"
}

variable "enable_920460" {
  type    = bool
  default = true
}

variable "action_920460" {
  type    = string
  default = "Log"
}

variable "enable_920470" {
  type    = bool
  default = true
}

variable "action_920470" {
  type    = string
  default = "Log"
}

variable "enable_920480" {
  type    = bool
  default = true
}

variable "action_920480" {
  type    = string
  default = "Log"
}

variable "enable_921151" {
  type    = bool
  default = true
}

variable "action_921151" {
  type    = string
  default = "Log"
}

variable "enable_921170" {
  type    = bool
  default = true
}

variable "action_921170" {
  type    = string
  default = "Log"
}

variable "enable_921180" {
  type    = bool
  default = true
}

variable "action_921180" {
  type    = string
  default = "Log"
}

variable "enable_931130" {
  type    = bool
  default = true
}

variable "action_931130" {
  type    = string
  default = "Log"
}

variable "enable_932106" {
  type    = bool
  default = true
}

variable "action_932106" {
  type    = string
  default = "Log"
}

variable "enable_932190" {
  type    = bool
  default = true
}

variable "action_932190" {
  type    = string
  default = "Log"
}

variable "enable_933111" {
  type    = bool
  default = true
}

variable "action_933111" {
  type    = string
  default = "Log"
}

variable "enable_933131" {
  type    = bool
  default = true
}

variable "action_933131" {
  type    = string
  default = "Log"
}

variable "enable_933151" {
  type    = bool
  default = true
}

variable "action_933151" {
  type    = string
  default = "Log"
}

variable "enable_933161" {
  type    = bool
  default = true
}

variable "action_933161" {
  type    = string
  default = "Log"
}

variable "enable_933190" {
  type    = bool
  default = true
}

variable "action_933190" {
  type    = string
  default = "Log"
}

variable "enable_941101" {
  type    = bool
  default = true
}

variable "action_941101" {
  type    = string
  default = "Log"
}

variable "enable_941150" {
  type    = bool
  default = true
}

variable "action_941150" {
  type    = string
  default = "Log"
}

variable "enable_941320" {
  type    = bool
  default = true
}

variable "action_941320" {
  type    = string
  default = "Log"
}

variable "enable_941330" {
  type    = bool
  default = true
}

variable "action_941330" {
  type    = string
  default = "Log"
}

variable "enable_941340" {
  type    = bool
  default = true
}

variable "action_941340" {
  type    = string
  default = "Log"
}

variable "enable_942110" {
  type    = bool
  default = true
}

variable "action_942110" {
  type    = string
  default = "Log"
}

variable "enable_942120" {
  type    = bool
  default = true
}

variable "action_942120" {
  type    = string
  default = "Log"
}

variable "enable_942130" {
  type    = bool
  default = true
}

variable "action_942130" {
  type    = string
  default = "Log"
}

variable "enable_942150" {
  type    = bool
  default = true
}

variable "action_942150" {
  type    = string
  default = "Log"
}

variable "enable_942180" {
  type    = bool
  default = true
}

variable "action_942180" {
  type    = string
  default = "Log"
}

variable "enable_942200" {
  type    = bool
  default = true
}

variable "action_942200" {
  type    = string
  default = "Log"
}

variable "enable_942210" {
  type    = bool
  default = true
}

variable "action_942210" {
  type    = string
  default = "Log"
}

variable "enable_942251" {
  type    = bool
  default = true
}

variable "action_942251" {
  type    = string
  default = "Log"
}

variable "enable_942260" {
  type    = bool
  default = true
}

variable "action_942260" {
  type    = string
  default = "Log"
}

variable "enable_942300" {
  type    = bool
  default = true
}

variable "action_942300" {
  type    = string
  default = "Log"
}

variable "enable_942310" {
  type    = bool
  default = true
}

variable "action_942310" {
  type    = string
  default = "Log"
}

variable "enable_942330" {
  type    = bool
  default = true
}

variable "action_942330" {
  type    = string
  default = "Log"
}

variable "enable_942340" {
  type    = bool
  default = true
}

variable "action_942340" {
  type    = string
  default = "Log"
}

variable "enable_942361" {
  type    = bool
  default = true
}

variable "action_942361" {
  type    = string
  default = "Log"
}

variable "enable_942370" {
  type    = bool
  default = true
}

variable "action_942370" {
  type    = string
  default = "Log"
}

variable "enable_942380" {
  type    = bool
  default = true
}

variable "action_942380" {
  type    = string
  default = "Log"
}

variable "enable_942390" {
  type    = bool
  default = true
}

variable "action_942390" {
  type    = string
  default = "Log"
}

variable "enable_942400" {
  type    = bool
  default = true
}

variable "action_942400" {
  type    = string
  default = "Log"
}

variable "enable_942410" {
  type    = bool
  default = true
}

variable "action_942410" {
  type    = string
  default = "Log"
}

variable "enable_942420" {
  type    = bool
  default = true
}

variable "action_942420" {
  type    = string
  default = "Log"
}

variable "enable_942421" {
  type    = bool
  default = true
}

variable "action_942421" {
  type    = string
  default = "Log"
}

variable "enable_942430" {
  type    = bool
  default = true
}

variable "action_942430" {
  type    = string
  default = "Log"
}

variable "enable_942431" {
  type    = bool
  default = true
}

variable "action_942431" {
  type    = string
  default = "Log"
}

variable "enable_942432" {
  type    = bool
  default = true
}

variable "action_942432" {
  type    = string
  default = "Log"
}

variable "enable_942440" {
  type    = bool
  default = true
}

variable "action_942440" {
  type    = string
  default = "Log"
}

variable "enable_942450" {
  type    = bool
  default = true
}

variable "action_942450" {
  type    = string
  default = "Log"
}

variable "enable_942460" {
  type    = bool
  default = true
}

variable "action_942460" {
  type    = string
  default = "Log"
}

variable "enable_942470" {
  type    = bool
  default = true
}

variable "action_942470" {
  type    = string
  default = "Log"
}

variable "enable_942480" {
  type    = bool
  default = true
}

variable "action_942480" {
  type    = string
  default = "Log"
}

variable "enable_942490" {
  type    = bool
  default = true
}

variable "action_942490" {
  type    = string
  default = "Log"
}

variable "enable_942500" {
  type    = bool
  default = true
}

variable "action_942500" {
  type    = string
  default = "Log"
}

variable "enable_944200" {
  type    = bool
  default = true
}

variable "action_944200" {
  type    = string
  default = "Log"
}

variable "enable_944210" {
  type    = bool
  default = true
}

variable "action_944210" {
  type    = string
  default = "Log"
}

variable "enable_944240" {
  type    = bool
  default = true
}

variable "action_944240" {
  type    = string
  default = "Log"
}

variable "enable_944250" {
  type    = bool
  default = true
}

variable "action_944250" {
  type    = string
  default = "Log"
}

variable "enable_800100" {
  type    = bool
  default = true
}

variable "action_800100" {
  type    = string
  default = "Log"
}

variable "enable_800110" {
  type    = bool
  default = true
}

variable "action_800110" {
  type    = string
  default = "Log"
}

variable "enable_800111" {
  type    = bool
  default = true
}

variable "action_800111" {
  type    = string
  default = "Log"
}

variable "enable_800112" {
  type    = bool
  default = true
}

variable "action_800112" {
  type    = string
  default = "Log"
}

variable "enable_800113" {
  type    = bool
  default = true
}

variable "action_800113" {
  type    = string
  default = "Log"
}

# Azure WAF Bot related rules

variable "enable_100100" {
  type    = bool
  default = true
}

variable "action_100100" {
  type    = string
  default = "Block"
}

variable "enable_100200" {
  type    = bool
  default = true
}

variable "action_100200" {
  type    = string
  default = "Block"
}

variable "enable_200100" {
  type    = bool
  default = true
}

variable "action_200100" {
  type    = string
  default = "Allow"
}

variable "enable_200200" {
  type    = bool
  default = true
}

variable "action_200200" {
  type    = string
  default = "Log"
}

variable "enable_300100" {
  type    = bool
  default = true
}

variable "action_300100" {
  type    = string
  default = "Log"
}

variable "enable_300200" {
  type    = bool
  default = true
}

variable "action_300200" {
  type    = string
  default = "Log"
}

variable "enable_300300" {
  type    = bool
  default = true
}

variable "action_300300" {
  type    = string
  default = "Log"
}

variable "enable_300400" {
  type    = bool
  default = true
}

variable "action_300400" {
  type    = string
  default = "Log"
}

variable "enable_300500" {
  type    = bool
  default = true
}

variable "action_300500" {
  type    = string
  default = "Log"
}

variable "enable_300600" {
  type    = bool
  default = true
}

variable "action_300600" {
  type    = string
  default = "Log"
}

variable "enable_300700" {
  type    = bool
  default = false
}

variable "action_300700" {
  type    = string
  default = "Log"
}

# Additional Microsoft TI rules

variable "enable_99001017" {
  type    = bool
  default = true
}

variable "action_99001017" {
  type    = string
  default = "Block"
}

variable "enable_99001016" {
  type    = bool
  default = true
}

variable "action_99001016" {
  type    = string
  default = "Block"
}

variable "enable_99001015" {
  type    = bool
  default = true
}

variable "action_99001015" {
  type    = string
  default = "Block"
}

variable "enable_99001014" {
  type    = bool
  default = true
}

variable "action_99001014" {
  type    = string
  default = "Block"
}

variable "enable_99001001" {
  type    = bool
  default = true
}

variable "action_99001001" {
  type    = string
  default = "Block"
}

variable "enable_99031002" {
  type    = bool
  default = true
}

variable "action_99031002" {
  type    = string
  default = "Block"
}

variable "enable_99031001" {
  type    = bool
  default = true
}

variable "action_99031001" {
  type    = string
  default = "Block"
}

variable "enable_99030002" {
  type    = bool
  default = true
}

variable "action_99030002" {
  type    = string
  default = "Block"
}

variable "enable_99030001" {
  type    = bool
  default = true
}

variable "action_99030001" {
  type    = string
  default = "Block"
}

variable "enable_99005006" {
  type    = bool
  default = true
}

variable "action_99005006" {
  type    = string
  default = "Block"
}

variable "enable_99005004" {
  type    = bool
  default = true
}

variable "action_99005004" {
  type    = string
  default = "Block"
}

variable "enable_99005003" {
  type    = bool
  default = true
}

variable "action_99005003" {
  type    = string
  default = "Block"
}

variable "enable_99005002" {
  type    = bool
  default = true
}

variable "action_99005002" {
  type    = string
  default = "Block"
}



