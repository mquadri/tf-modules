
resource "appdynamics_health_rule" "slow_response_time" {
  name           = "slow-transactions"
  application_id = var.application_id

  #Affected entities
  affected_entity_type       = "BUSINESS_TRANSACTION_PERFORMANCE"
  business_transaction_scope = "BUSINESS_TRANSACTIONS_IN_SPECIFIC_TIERS"
  specific_tiers             = var.tiers

  #Criteria conditions
  eval_detail_type            = "SINGLE_METRIC"
  metric_aggregation_function = "VALUE"
  metric_eval_detail_type     = "SPECIFIC_TYPE"
  metric_path                 = "95th Percentile Response Time (ms)"
  compare_condition           = "GREATER_THAN_SPECIFIC_VALUE"
  critical_compare_value      = var.slow_transactions_critical
  warn_compare_value          = var.slow_transactions_warn
}

resource "appdynamics_action" "email" {
  count          = length(var.alert_email_to) > 0 ? 1 : 0
  application_id = var.application_id
  action_type    = "EMAIL"
  emails         = var.alert_email_to
}

resource "appdynamics_action" "bigpanda" {
  count                      = var.alert_bigpanda_template != "" ? 1 : 0
  name                       = "BigPanda Action"
  application_id             = var.application_id
  action_type                = "HTTP_REQUEST"
  http_request_template_name = var.alert_bigpanda_template
}

resource "appdynamics_policy" "all_health_rules_email_on_trigger" {
  count                   = length(var.alert_email_to) > 0 ? 1 : 0
  name                    = "All Health Rules & Errors to Email"
  application_id          = var.application_id
  action_name             = join(", ", appdynamics_action.email[count.index].emails)
  action_type             = appdynamics_action.email[count.index].action_type
  health_rule_event_types = ["HEALTH_RULE_OPEN_CRITICAL", "HEALTH_RULE_OPEN_WARNING"]
  health_rule_scope_type  = "ALL_HEALTH_RULES"
  other_events            = ["ERROR"]
}

resource "appdynamics_policy" "all_health_rules_bigpanda_on_trigger" {
  count                   = var.alert_bigpanda_template != "" ? 1 : 0
  name                    = "All Health Rules & Errors to BigPanda"
  application_id          = var.application_id
  action_name             = appdynamics_action.bigpanda[count.index].name
  action_type             = appdynamics_action.bigpanda[count.index].action_type
  health_rule_event_types = ["HEALTH_RULE_OPEN_CRITICAL", "HEALTH_RULE_OPEN_WARNING"]
  health_rule_scope_type  = "ALL_HEALTH_RULES"
  other_events            = ["ERROR"]
}