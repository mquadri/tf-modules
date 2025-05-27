output "waf_details" {
  description = " Details of the waf policies ."
  value = {
    waf_policy_id       = { for w, waf in azurerm_web_application_firewall_policy.policy : w => waf.id }
    path_based_rule_ids = { for p, path in azurerm_web_application_firewall_policy.policy : p => path.path_based_rule_ids }
    http_listener_ids   = { for l, listner in azurerm_web_application_firewall_policy.policy : l => listner.http_listener_ids }
  }

}