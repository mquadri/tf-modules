locals {
  all_principals = merge(
    { for key, value in local.users : key => {
      principal_id = value
      type         = "user"
      }
    },
    { for key, value in local.groups : key => {
      principal_id = value
      type         = "group"
      }
    }
  )
  default_subscription_id = data.azurerm_client_config.current.subscription_id
  principal_type = {
    user  = "User"
    group = "Group"
  }
}