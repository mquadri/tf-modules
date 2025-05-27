waf_policies = [
  {
    location            = "eastus"
    policy_name         = "waf-policy"
    resource_group_name = "test-rg"

    waf_mode = "Detection"

    managed_rule_set_configuration = [
      {
        type    = "OWASP"
        version = "3.2"

        rule_group_override_configuration = [
          {
            rule_group_name = "General"
            rule = [{
              action  = "Log"
              enabled = true
              id      = "200002"
            }]
            rule = [{
              action  = "Log"
              enabled = true
              id      = "200003"
            }]

          },

          {
            rule_group_name = "REQUEST-913-SCANNER-DETECTION"
            rule = [{
              action  = "Block"
              enabled = true
              id      = "913100"
            }]
            rule = [{
              action  = "Log"
              enabled = true
              id      = "913101"
            }]

          }

        ]

      }

    ]

    exclusion_configuration = [

    ]

    custom_rules_configuration = [
      {
        name      = "DenyAll"
        priority  = 1
        rule_type = "MatchRule"
        action    = "Block"

        match_conditions_configuration = [
          {
            match_variable_configuration = [
              {
                variable_name = "RemoteAddr"
                selector      = null
              }
            ]

            match_values = [
              "a.b.c.d"
            ]

            operator           = "IPMatch"
            negation_condition = true
            transforms         = null
          },
          {
            match_variable_configuration = [
              {
                variable_name = "RequestUri"
                selector      = null
              }
            ]

            match_values = [
              "Azure",
              "Cloud"
            ]

            operator           = "Contains"
            negation_condition = true
            transforms         = null
          }
        ]
      }
    ]

  },
  {
    location            = "eastus"
    policy_name         = "waf-policy2"
    resource_group_name = "test-rg"

    waf_mode = "Detection"

    managed_rule_set_configuration = [
      {
        type    = "OWASP"
        version = "3.2"

        rule_group_override_configuration = [
          {
            rule_group_name = "General"
            rule = [{
              action  = "Log"
              enabled = true
              id      = "200002"
            }]
            rule = [{
              action  = "Log"
              enabled = true
              id      = "200003"
            }]

          },

          {
            rule_group_name = "REQUEST-913-SCANNER-DETECTION"
            rule = [{
              action  = "Block"
              enabled = true
              id      = "913100"
            }]
            rule = [{
              action  = "Log"
              enabled = true
              id      = "913101"
            }]

          }

        ]

      }

    ]

    exclusion_configuration = [

    ]

    custom_rules_configuration = [
      {
        name      = "DenyAll"
        priority  = 1
        rule_type = "MatchRule"
        action    = "Block"

        match_conditions_configuration = [
          {
            match_variable_configuration = [
              {
                variable_name = "RemoteAddr"
                selector      = null
              }
            ]

            match_values = [
              "a.b.c.d"
            ]

            operator           = "IPMatch"
            negation_condition = true
            transforms         = null
          },
          {
            match_variable_configuration = [
              {
                variable_name = "RequestUri"
                selector      = null
              }
            ]

            match_values = [
              "Azure",
              "Cloud"
            ]

            operator           = "Contains"
            negation_condition = true
            transforms         = null
          }
        ]
      }
    ]
  }
]