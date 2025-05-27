policy_name         = "waf-workload-test-001"
resource_group_name = "rg-waf-testing"
location            = "westcentralus"

enable_200002 = true
action_200002 = "Log"

additional_custom_rules = [
  {
    action             = "Allow"
    name               = "Whitelist"
    priority           = 10
    rule_type          = "MatchRule"
    match_values       = ["10.0.0.0/16"]
    negation_condition = false
    operator           = "IPMatch"
    transforms         = []
    variable_name      = "RemoteAddr"
  },
  {
    action               = "Block"
    name                 = "RateLimit"
    priority             = 30
    rule_type            = "RateLimitRule"
    group_rate_limit_by  = "ClientAddr"
    rate_limit_duration  = "OneMin"
    rate_limit_threshold = 100
    match_values         = ["10.0.0.0/16"]
    negation_condition   = true
    operator             = "IPMatch"
    transforms           = []
    variable_name        = "RemoteAddr"
  }
]
