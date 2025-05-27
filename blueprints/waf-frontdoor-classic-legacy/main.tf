module "fd-waf-policy" {
  source              = "github.com/CenturyLink/tf-modules-azure//waf-frontdoor-classic?ref=1.5.2"
  resource_group_name = var.resource_group_name
  location            = var.location
  policy_name         = var.policy_name

  enable_942100 = var.enable_942100
  action_942100 = var.action_942100

  additional_custom_rules = var.additional_custom_rules
  rules_custom_p21        = var.rules_custom_p21
}
