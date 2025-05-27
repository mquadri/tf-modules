locals {
  default_rules_custom_p21 = {
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
        match_values       = ["AF", "AL", "DZ", "AD", "AO", "AQ", "AR", "AM", "AZ", "BH"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p22 = {
    action               = "Block"
    name                 = "GeoBlocking22"
    priority             = 22
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["BD", "BY", "BE", "BJ", "BT", "BO", "BA", "BW", "BR", "IO"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p23 = {
    action               = "Block"
    name                 = "GeoBlocking23"
    priority             = 23
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["BN", "BG", "BF", "BI", "CV", "KH", "CM", "CF", "TD", "CL"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p24 = {
    action               = "Block"
    name                 = "GeoBlocking24"
    priority             = 24
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["CN", "KM", "CG", "CD", "HR", "CY", "CZ", "DJ", "EC", "EG"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p25 = {
    action               = "Block"
    name                 = "GeoBlocking25"
    priority             = 25
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["GQ", "ER", "EE", "ET", "FK", "FO", "FI", "GF", "GA", "GM"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p26 = {
    action               = "Block"
    name                 = "GeoBlocking26"
    priority             = 26
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["GE", "GH", "GI", "GR", "GG", "GN", "GW", "HK", "HU", "IS"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p27 = {
    action               = "Block"
    name                 = "GeoBlocking27"
    priority             = 27
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["ID", "IR", "IQ", "IM", "IL", "IT", "JE", "JO", "KZ", "KE"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p28 = {
    action               = "Block"
    name                 = "GeoBlocking28"
    priority             = 28
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["KW", "KG", "LA", "LV", "LB", "LS", "LR", "LY", "LI", "LT"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p29 = {
    action               = "Block"
    name                 = "GeoBlocking29"
    priority             = 29
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["LU", "MO", "MG", "MW", "MV", "ML", "MT", "MR", "MU", "YT"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p30 = {
    action               = "Block"
    name                 = "GeoBlocking30"
    priority             = 30
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["MD", "MC", "MN", "ME", "MA", "MZ", "MM", "NA", "NP", "NL"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p31 = {
    action               = "Block"
    name                 = "GeoBlocking31"
    priority             = 31
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["NE", "KP", "MK", "NO", "OM", "PK", "PS", "PY", "PE", "PL"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p32 = {
    action               = "Block"
    name                 = "GeoBlocking32"
    priority             = 32
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["PT", "QA", "RO", "RU", "RW", "RE", "SM", "SA", "SN", "RS"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p33 = {
    action               = "Block"
    name                 = "GeoBlocking33"
    priority             = 33
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["SC", "SL", "SG", "SK", "SI", "SO", "GS", "SS", "ES", "LK"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p34 = {
    action               = "Block"
    name                 = "GeoBlocking34"
    priority             = 34
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["SH", "SD", "SR", "SJ", "CH", "SY", "ST", "TW", "TJ", "TZ"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p35 = {
    action               = "Block"
    name                 = "GeoBlocking35"
    priority             = 35
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["TH", "TL", "TG", "TN", "TR", "TM", "UG", "AE", "UY", "UZ"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }

  default_rules_custom_p36 = {
    action               = "Block"
    name                 = "GeoBlocking36"
    priority             = 36
    rate_limit_duration  = null
    rate_limit_threshold = null
    rule_type            = "MatchRule"

    match_conditions_configuration = [
      {
        variable_name      = "RemoteAddr"
        selector           = null
        match_values       = ["VA", "VE", "VN", "ZW", "ZM", "YE", "AT"]
        operator           = "GeoMatch"
        negation_condition = false
        transforms         = null
      }
    ]
  }
}
