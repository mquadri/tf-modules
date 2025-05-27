module "waf-policy" {
  source                  = "github.com/CenturyLink/tf-modules-azure//waf?ref=1.5.1"
  resource_group_name     = var.resource_group_name
  location                = var.location
  policy_name             = var.policy_name
  enable_200002           = var.enable_200002
  action_200200           = var.action_200002
  additional_custom_rules = var.additional_custom_rules
}
