policy_name         = "wafFDtest"
resource_group_name = "rg-CoreIT-HCA-PolicyTests-WAFTests"
location            = "westcentralus"

enable_942100 = true
action_942100 = "Log"

rules_custom_p21 = {
  action               = "Block"
  name                 = "GeoBlocking21"
  priority             = 21
  rate_limit_duration  = null
  rate_limit_threshold = null
  rule_type            = "MatchRule"

  match_conditions_configuration = [
    {
      variable_name      = "RemoteAddr"
      selector           = null
      match_values       = ["AF", "AL", "DZ", "AD", "AO", "AQ", "AR", "AM", "BH"]
      operator           = "GeoMatch"
      negation_condition = true
      transforms         = null
    }
  ]
}

additional_custom_rules = [
  {
    action    = "Allow"
    name      = "SampleWhitelist"
    priority  = 10
    rule_type = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["10.0.0.0/16"]
        operator           = "IPMatch"
        negation_condition = true
        transforms         = null
      }
    ]
  },
  {
    action               = "Block"
    name                 = "SampleRateLimit"
    priority             = 11
    rule_type            = "RateLimitRule"
    rate_limit_duration  = 1
    rate_limit_threshold = 100

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["10.0.0.0/16"]
        operator           = "IPMatch"
        negation_condition = true
        transforms         = null
      }
    ]
  }
]
