module "standard_tags" {
  source = "../../" # Assuming this example is run from within its own directory

  location            = "centralus"
  resourcetype        = "rg"
  appid               = "APP001"
  appname             = "MyApplication"
  env                 = "dev"
  costCostCenter      = "12345"
  costVP              = "VP Name"
  costAppOwnerTech    = "techowner@example.com"
  costAppOwnerManager = "manager@example.com"
  costBudgetOwner     = "budgetowner@example.com"
  additionalcontext   = "01"
  costDivision        = "Division Name"
  costAllocation      = "chargeback"
  appFunction         = "Core Function"
  monthlyBudget       = "1000"
  costbaseline        = "2023"
  mal_id              = "MAL000123"
}

# Example of applying tags to a resource group
resource "azurerm_resource_group" "example" {
  name     = "rg-example-${module.standard_tags.tags.env}-${module.standard_tags.tags.appid}"
  location = module.standard_tags.tags.costRegion # or var.location from the module input
  tags     = module.standard_tags.tags
}

output "example_resource_group_tags" {
  description = "Tags applied to the example resource group."
  value       = azurerm_resource_group.example.tags
}
