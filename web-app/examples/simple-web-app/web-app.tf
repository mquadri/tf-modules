module "app-sample-dev-01" {
  source = "../.."

  appid               = var.appid
  appname             = var.appname
  resourcetype        = var.resourcetype
  costAppOwnerManager = var.costAppOwnerManager
  costAppOwnerTech    = var.costAppOwnerTech
  costBudgetOwner     = var.costBudgetOwner
  costCostCenter      = var.costCostCenter
  costDivision        = var.costDivision
  location            = var.location
  costVP              = var.costVP
  env                 = var.env
  costAllocation      = var.costAllocation
  appFunction         = var.appFunction
  monthlyBudget       = var.monthlyBudget
  costbaseline        = var.costbaseline
  additionalcontext   = var.additionalcontext

  name                     = "app-sample-dev-03"
  resource_group_name      = var.resource_group_name
  os_type                  = var.os_type
  service_plan_resource_id = var.service_plan_resource_id

  enable_application_insights   = false
  public_network_access_enabled = false
  https_only                    = true
  virtual_network_subnet_id     = data.azurerm_subnet.web_back.id

  site_config = {
    always_on        = false
    app_command_line = "gunicorn -w 2 -k uvicorn.workers.UvicornWorker -b 0.0.0.0 main:app"
    application_stack = {
      python = {
        python_version = "3.12"
      }
    }
    detailed_error_logging_enabled = false
    ftps_state                     = "FtpsOnly"
    http2_enabled                  = true
    use_32_bit_worker              = true
    vnet_route_all_enabled         = true
    worker_count                   = 1
  }

  app_settings = {
    SCM_DO_BUILD_DURING_DEPLOYMENT = true
    PORT                           = 8000
  }
}
