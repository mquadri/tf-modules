create_resource_group = true
enable_telemetry      = true
resource_group_name   = "avmModuleTesting2"
location              = "EastUS"
managed_identity = {
  "user_identity1" = {
    user_managed_identity_name           = "testuseridentity4927"
    managed_identity_resource_group_name = "avmModuleTesting2"
    managed_identity_location            = "EastUS"
  }
  "user_identity2" = {
    user_managed_identity_name           = "testuseridentity9735"
    managed_identity_resource_group_name = "avmModuleTesting2"
    managed_identity_location            = "EastUS"
  }
}

# Tag variable values
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