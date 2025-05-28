# Example fixtures for Standard_Tags module
# This file can be used to provide input values for automated testing.

# Minimal set of required variables (if any were strictly required without defaults)
# mal_id = "MAL000XYZ" # Example, as mal_id is now effectively required

# Example of providing all variables for a comprehensive test case:
/*
location            = "eastus2"
resourcetype        = "vm"
appid               = "APP007"
appname             = "BillingService"
env                 = "prod"
costCostCenter      = "CCTR9876"
costVP              = "VP Finance"
costAppOwnerTech    = "techlead@example.com"
costAppOwnerManager = "finance_mgr@example.com"
costBudgetOwner     = "budget_head@example.com"
additionalcontext   = "batch"
costDivision        = "FinanceSystems"
costAllocation      = "chargeback"
appFunction         = "Monthly Billing Processing"
monthlyBudget       = "2500"
costbaseline        = "2024"
mal_id              = "MAL000789"
*/

# Example for a shared resource:
/*
location            = "westus"
resourcetype        = "storage"
appid               = "SHAREDINFRA"
appname             = "SharedStorage"
env                 = "prod"
costCostCenter      = "CCTR0000"
costVP              = "VP IT"
costAppOwnerTech    = "infra_admin@example.com"
costAppOwnerManager = "it_director@example.com"
costBudgetOwner     = "cio@example.com"
additionalcontext   = "blob"
costDivision        = "ITInfrastructure"
costAllocation      = "sharedcosts"
appFunction         = "General Purpose Storage"
monthlyBudget       = "500"
costbaseline        = "2022"
mal_id              = "MAL000001"
*/
