
subscription_id = ""
public_ip = {
  "pip-1" = {
    location            = "eastus2"
    resource_group_name = "test-pip-rg-01"
    name                = "pip-shared-1"
    sku                 = "Standard"
    allocation_method   = "Static"
    tags = {
      resourcetype        = "user-identity"
      appid               = "ap01"
      appname             = "infra"
      env                 = "dev"
      costcostcenter      = "test"
      costvp              = "VP"
      costappownertech    = "owner"
      costappownermanager = "Manager"
      costbudgetowner     = "budget owner"
      costdivision        = "IT"
      appfunction         = "exmaple general Prod Subscription"
      costbaseline        = "2024"
      costallocation      = "sharedcost"
      monthlybudget       = "1000"
      managed_by          = "own"
      additionalcontext   = "01"
    }
    diagnostic_settings = {
      diag-1 = {
        name                        = "test-diag-pip-1"
        log_groups                  = ["allLogs"]
        metric_categories           = ["AllMetrics"]
        storage_account_resource_id = ""
      }
    }
  },
  "pip-2" = {
    location            = "centralus"
    resource_group_name = "test-pip-rg-01"
    name                = "pip-shared-2"
    sku                 = "Standard"
    allocation_method   = "Static"
    tags = {
      resourcetype        = "user-identity"
      appid               = "ap01"
      appname             = "infra"
      env                 = "dev"
      costcostcenter      = "test"
      costvp              = "VP"
      costappownertech    = "owner"
      costappownermanager = "Manager"
      costbudgetowner     = "budget owner"
      costdivision        = "IT"
      appfunction         = "exmaple general Prod Subscription"
      costbaseline        = "2024"
      costallocation      = "sharedcost"
      monthlybudget       = "1000"
      managed_by          = "own"
      additionalcontext   = "01"
    }
    diagnostic_settings = {
      diag-2 = {
        name                        = "test-diag-pip-2"
        log_groups                  = ["allLogs"]
        metric_categories           = ["AllMetrics"]
        storage_account_resource_id = ""
      }
    }
  }
}