plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "azurerm" {
    enabled = true
    version = "0.27.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

rule "terraform_required_providers" {
  enabled = true
  version = false
}

rule "terraform_required_version" {
  enabled = false
}