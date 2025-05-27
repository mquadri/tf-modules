resource "azurerm_frontdoor_firewall_policy" "policy" {
  name                              = var.policy_name
  resource_group_name               = var.resource_group_name
  mode                              = local.waf_mode
  enabled                           = true
  custom_block_response_status_code = 403

  dynamic "custom_rule" {
    for_each = local.rules_custom
    content {
      action   = custom_rule.value.action
      name     = custom_rule.value.name
      priority = custom_rule.value.priority
      type     = custom_rule.value.rule_type

      rate_limit_duration_in_minutes = custom_rule.value.rate_limit_duration
      rate_limit_threshold           = custom_rule.value.rate_limit_threshold

      dynamic "match_condition" {
        for_each = custom_rule.value.match_conditions_configuration
        content {
          match_variable     = match_condition.value.variable_name
          selector           = match_condition.value.selector
          match_values       = match_condition.value.match_values
          operator           = match_condition.value.operator
          negation_condition = match_condition.value.negation_condition
          transforms         = match_condition.value.transforms
        }
      }
    }
  }

  managed_rule {
    type    = "Microsoft_DefaultRuleSet"
    version = "1.1"

    override {
      rule_group_name = "JAVA"

      rule {
        action  = var.action_944250
        enabled = var.enable_944250
        rule_id = "944250"
      }
      rule {
        action  = var.action_944240
        enabled = var.enable_944240
        rule_id = "944240"
      }
      rule {
        action  = var.action_944210
        enabled = var.enable_944210
        rule_id = "944210"
      }
      rule {
        action  = var.action_944200
        enabled = var.enable_944200
        rule_id = "944200"
      }
      rule {
        action  = var.action_944130
        enabled = var.enable_944130
        rule_id = "944130"
      }
      rule {
        action  = var.action_944120
        enabled = var.enable_944120
        rule_id = "944120"
      }
      rule {
        action  = var.action_944110
        enabled = var.enable_944110
        rule_id = "944110"
      }
      rule {
        action  = var.action_944100
        enabled = var.enable_944100
        rule_id = "944100"
      }
    }
    override {
      rule_group_name = "FIX"

      rule {
        action  = var.action_943120
        enabled = var.enable_943120
        rule_id = "943120"
      }
      rule {
        action  = var.action_943110
        enabled = var.enable_943110
        rule_id = "943110"
      }
      rule {
        action  = var.action_943100
        enabled = var.enable_943100
        rule_id = "943100"
      }
    }
    override {
      rule_group_name = "SQLI"

      rule {
        action  = var.action_942480
        enabled = var.enable_942480
        rule_id = "942480"
      }
      rule {
        action  = var.action_942470
        enabled = var.enable_942470
        rule_id = "942470"
      }
      rule {
        action  = var.action_942450
        enabled = var.enable_942450
        rule_id = "942450"
      }
      rule {
        action  = var.action_942440
        enabled = var.enable_942440
        rule_id = "942440"
      }
      rule {
        action  = var.action_942430
        enabled = var.enable_942430
        rule_id = "942430"
      }
      rule {
        action  = var.action_942410
        enabled = var.enable_942410
        rule_id = "942410"
      }
      rule {
        action  = var.action_942400
        enabled = var.enable_942400
        rule_id = "942400"
      }
      rule {
        action  = var.action_942390
        enabled = var.enable_942390
        rule_id = "942390"
      }
      rule {
        action  = var.action_942380
        enabled = var.enable_942380
        rule_id = "942380"
      }
      rule {
        action  = var.action_942370
        enabled = var.enable_942370
        rule_id = "942370"
      }
      rule {
        action  = var.action_942361
        enabled = var.enable_942361
        rule_id = "942361"
      }
      rule {
        action  = var.action_942360
        enabled = var.enable_942360
        rule_id = "942360"
      }
      rule {
        action  = var.action_942350
        enabled = var.enable_942350
        rule_id = "942350"
      }
      rule {
        action  = var.action_942340
        enabled = var.enable_942340
        rule_id = "942340"
      }
      rule {
        action  = var.action_942330
        enabled = var.enable_942330
        rule_id = "942330"
      }
      rule {
        action  = var.action_942320
        enabled = var.enable_942320
        rule_id = "942320"
      }
      rule {
        action  = var.action_942310
        enabled = var.enable_942310
        rule_id = "942310"
      }
      rule {
        action  = var.action_942300
        enabled = var.enable_942300
        rule_id = "942300"
      }
      rule {
        action  = var.action_942290
        enabled = var.enable_942290
        rule_id = "942290"
      }
      rule {
        action  = var.action_942280
        enabled = var.enable_942280
        rule_id = "942280"
      }
      rule {
        action  = var.action_942270
        enabled = var.enable_942270
        rule_id = "942270"
      }
      rule {
        action  = var.action_942260
        enabled = var.enable_942260
        rule_id = "942260"
      }
      rule {
        action  = var.action_942250
        enabled = var.enable_942250
        rule_id = "942250"
      }
      rule {
        action  = var.action_942240
        enabled = var.enable_942240
        rule_id = "942240"
      }
      rule {
        action  = var.action_942230
        enabled = var.enable_942230
        rule_id = "942230"
      }
      rule {
        action  = var.action_942220
        enabled = var.enable_942220
        rule_id = "942220"
      }
      rule {
        action  = var.action_942210
        enabled = var.enable_942210
        rule_id = "942210"
      }
      rule {
        action  = var.action_942200
        enabled = var.enable_942200
        rule_id = "942200"
      }
      rule {
        action  = var.action_942190
        enabled = var.enable_942190
        rule_id = "942190"
      }
      rule {
        action  = var.action_942180
        enabled = var.enable_942180
        rule_id = "942180"
      }
      rule {
        action  = var.action_942170
        enabled = var.enable_942170
        rule_id = "942170"
      }
      rule {
        action  = var.action_942160
        enabled = var.enable_942160
        rule_id = "942160"
      }
      rule {
        action  = var.action_942150
        enabled = var.enable_942150
        rule_id = "942150"
      }
      rule {
        action  = var.action_942140
        enabled = var.enable_942140
        rule_id = "942140"
      }
      rule {
        action  = var.action_942120
        enabled = var.enable_942120
        rule_id = "942120"
      }
      rule {
        action  = var.action_942110
        enabled = var.enable_942110
        rule_id = "942110"
      }
      rule {
        action  = var.action_942100
        enabled = var.enable_942100
        rule_id = "942100"
      }
    }
    override {
      rule_group_name = "XSS"

      rule {
        action  = var.action_941350
        enabled = var.enable_941350
        rule_id = "941350"
      }
      rule {
        action  = var.action_941340
        enabled = var.enable_941340
        rule_id = "941340"
      }
      rule {
        action  = var.action_941330
        enabled = var.enable_941330
        rule_id = "941330"
      }
      rule {
        action  = var.action_941320
        enabled = var.enable_941320
        rule_id = "941320"
      }
      rule {
        action  = var.action_941310
        enabled = var.enable_941310
        rule_id = "941310"
      }
      rule {
        action  = var.action_941300
        enabled = var.enable_941300
        rule_id = "941300"
      }
      rule {
        action  = var.action_941290
        enabled = var.enable_941290
        rule_id = "941290"
      }
      rule {
        action  = var.action_941280
        enabled = var.enable_941280
        rule_id = "941280"
      }
      rule {
        action  = var.action_941270
        enabled = var.enable_941270
        rule_id = "941270"
      }
      rule {
        action  = var.action_941260
        enabled = var.enable_941260
        rule_id = "941260"
      }
      rule {
        action  = var.action_941250
        enabled = var.enable_941250
        rule_id = "941250"
      }
      rule {
        action  = var.action_941240
        enabled = var.enable_941240
        rule_id = "941240"
      }
      rule {
        action  = var.action_941230
        enabled = var.enable_941230
        rule_id = "941230"
      }
      rule {
        action  = var.action_941220
        enabled = var.enable_941220
        rule_id = "941220"
      }
      rule {
        action  = var.action_941210
        enabled = var.enable_941210
        rule_id = "941210"
      }
      rule {
        action  = var.action_941200
        enabled = var.enable_941200
        rule_id = "941200"
      }
      rule {
        action  = var.action_941190
        enabled = var.enable_941190
        rule_id = "941190"
      }
      rule {
        action  = var.action_941180
        enabled = var.enable_941180
        rule_id = "941180"
      }
      rule {
        action  = var.action_941170
        enabled = var.enable_941170
        rule_id = "941170"
      }
      rule {
        action  = var.action_941160
        enabled = var.enable_941160
        rule_id = "941160"
      }
      rule {
        action  = var.action_941150
        enabled = var.enable_941150
        rule_id = "941150"
      }
      rule {
        action  = var.action_941140
        enabled = var.enable_941140
        rule_id = "941140"
      }
      rule {
        action  = var.action_941130
        enabled = var.enable_941130
        rule_id = "941130"
      }
      rule {
        action  = var.action_941120
        enabled = var.enable_941120
        rule_id = "941120"
      }
      rule {
        action  = var.action_941110
        enabled = var.enable_941110
        rule_id = "941110"
      }
      rule {
        action  = var.action_941101
        enabled = var.enable_941101
        rule_id = "941101"
      }
      rule {
        action  = var.action_941100
        enabled = var.enable_941100
        rule_id = "941100"
      }
    }
    override {
      rule_group_name = "PHP"

      rule {
        action  = var.action_933180
        enabled = var.enable_933180
        rule_id = "933180"
      }
      rule {
        action  = var.action_933170
        enabled = var.enable_933170
        rule_id = "933170"
      }
      rule {
        action  = var.action_933160
        enabled = var.enable_933160
        rule_id = "933160"
      }
      rule {
        action  = var.action_933151
        enabled = var.enable_933151
        rule_id = "933151"
      }
      rule {
        action  = var.action_933150
        enabled = var.enable_933150
        rule_id = "933150"
      }
      rule {
        action  = var.action_933140
        enabled = var.enable_933140
        rule_id = "933140"
      }
      rule {
        action  = var.action_933130
        enabled = var.enable_933130
        rule_id = "933130"
      }
      rule {
        action  = var.action_933120
        enabled = var.enable_933120
        rule_id = "933120"
      }
      rule {
        action  = var.action_933110
        enabled = var.enable_933110
        rule_id = "933110"
      }
      rule {
        action  = var.action_933100
        enabled = var.enable_933100
        rule_id = "933100"
      }
    }
    override {
      rule_group_name = "RCE"

      rule {
        action  = var.action_932180
        enabled = var.enable_932180
        rule_id = "932180"
      }
      rule {
        action  = var.action_932171
        enabled = var.enable_932171
        rule_id = "932171"
      }
      rule {
        action  = var.action_932170
        enabled = var.enable_932170
        rule_id = "932170"
      }
      rule {
        action  = var.action_932160
        enabled = var.enable_932160
        rule_id = "932160"
      }
      rule {
        action  = var.action_932150
        enabled = var.enable_932150
        rule_id = "932150"
      }
      rule {
        action  = var.action_932140
        enabled = var.enable_932140
        rule_id = "932140"
      }
      rule {
        action  = var.action_932130
        enabled = var.enable_932130
        rule_id = "932130"
      }
      rule {
        action  = var.action_932120
        enabled = var.enable_932120
        rule_id = "932120"
      }
      rule {
        action  = var.action_932115
        enabled = var.enable_932115
        rule_id = "932115"
      }
      rule {
        action  = var.action_932110
        enabled = var.enable_932110
        rule_id = "932110"
      }
      rule {
        action  = var.action_932105
        enabled = var.enable_932105
        rule_id = "932105"
      }
      rule {
        action  = var.action_932100
        enabled = var.enable_932100
        rule_id = "932100"
      }
    }
    override {
      rule_group_name = "RFI"

      rule {
        action  = var.action_931130
        enabled = var.enable_931130
        rule_id = "931130"
      }
      rule {
        action  = var.action_931120
        enabled = var.enable_931120
        rule_id = "931120"
      }
      rule {
        action  = var.action_931110
        enabled = var.enable_931110
        rule_id = "931110"
      }
      rule {
        action  = var.action_931100
        enabled = var.enable_931100
        rule_id = "931100"
      }
    }
    override {
      rule_group_name = "LFI"

      rule {
        action  = var.action_930130
        enabled = var.enable_930130
        rule_id = "930130"
      }
      rule {
        action  = var.action_930120
        enabled = var.enable_930120
        rule_id = "930120"
      }
      rule {
        action  = var.action_930110
        enabled = var.enable_930110
        rule_id = "930110"
      }
      rule {
        action  = var.action_930100
        enabled = var.enable_930100
        rule_id = "930100"
      }
    }
    override {
      rule_group_name = "PROTOCOL-ATTACK"

      rule {
        action  = var.action_921151
        enabled = var.enable_921151
        rule_id = "921151"
      }
      rule {
        action  = var.action_921160
        enabled = var.enable_921160
        rule_id = "921160"
      }
      rule {
        action  = var.action_921150
        enabled = var.enable_921150
        rule_id = "921150"
      }
      rule {
        action  = var.action_921140
        enabled = var.enable_921140
        rule_id = "921140"
      }
      rule {
        action  = var.action_921130
        enabled = var.enable_921130
        rule_id = "921130"
      }
      rule {
        action  = var.action_921120
        enabled = var.enable_921120
        rule_id = "921120"
      }
      rule {
        action  = var.action_921110
        enabled = var.enable_921110
        rule_id = "921110"
      }
    }
    override {
      rule_group_name = "MS-ThreatIntel-CVEs"

      rule {
        action  = var.action_99001017
        enabled = var.enable_99001017
        rule_id = "99001017"
      }
      rule {
        action  = var.action_99001016
        enabled = var.enable_99001016
        rule_id = "99001016"
      }
      rule {
        action  = var.action_99001015
        enabled = var.enable_99001015
        rule_id = "99001015"
      }
      rule {
        action  = var.action_99001014
        enabled = var.enable_99001014
        rule_id = "99001014"
      }
      rule {
        action  = var.action_99001001
        enabled = var.enable_99001001
        rule_id = "99001001"
      }
    }
    override {
      rule_group_name = "MS-ThreatIntel-SQLI"

      rule {
        action  = var.action_99031002
        enabled = var.enable_99031002
        rule_id = "99031002"
      }
      rule {
        action  = var.action_99031001
        enabled = var.enable_99031001
        rule_id = "99031001"
      }
    }
    override {
      rule_group_name = "MS-ThreatIntel-AppSec"

      rule {
        action  = var.action_99030002
        enabled = var.enable_99030002
        rule_id = "99030002"
      }
      rule {
        action  = var.action_99030001
        enabled = var.enable_99030001
        rule_id = "99030001"
      }
    }
    override {
      rule_group_name = "MS-ThreatIntel-WebShells"

      rule {
        action  = var.action_99005006
        enabled = var.enable_99005006
        rule_id = "99005006"
      }
      rule {
        action  = var.action_99005004
        enabled = var.enable_99005004
        rule_id = "99005004"
      }
      rule {
        action  = var.action_99005003
        enabled = var.enable_99005003
        rule_id = "99005003"
      }
      rule {
        action  = var.action_99005002
        enabled = var.enable_99005002
        rule_id = "99005002"
      }
    }
  }
  managed_rule {
    type    = "Microsoft_BotManagerRuleSet"
    version = "1.0"

    override {
      rule_group_name = "UnknownBots"

      rule {
        action  = var.action_300700
        enabled = var.enable_300700
        rule_id = "Bot300700"
      }
      rule {
        action  = var.action_300600
        enabled = var.enable_300600
        rule_id = "Bot300600"
      }
      rule {
        action  = var.action_300500
        enabled = var.enable_300500
        rule_id = "Bot300500"
      }
      rule {
        action  = var.action_300400
        enabled = var.enable_300400
        rule_id = "Bot300400"
      }
      rule {
        action  = var.action_300300
        enabled = var.enable_300300
        rule_id = "Bot300300"
      }
      rule {
        action  = var.action_300200
        enabled = var.enable_300200
        rule_id = "Bot300200"
      }
      rule {
        action  = var.action_300100
        enabled = var.enable_300100
        rule_id = "Bot300100"
      }
    }
    override {
      rule_group_name = "GoodBots"

      rule {
        action  = var.action_200200
        enabled = var.enable_200200
        rule_id = "Bot200200"
      }
      rule {
        action  = var.action_200100
        enabled = var.enable_200100
        rule_id = "Bot200100"
      }
    }
    override {
      rule_group_name = "BadBots"

      rule {
        action  = var.action_100200
        enabled = var.enable_100200
        rule_id = "Bot100200"
      }
      rule {
        action  = var.action_100100
        enabled = var.enable_100100
        rule_id = "Bot100100"
      }
    }
  }
}
