module "pim-team-elegible-example" {
  source = "../"

  groups_by_display_name = {
    itops_owners   = "azad.itops.owners"
    az_contributor = "azad.ccoe.azureteam.contributor"
  }

  role_definitions = {
    contributor = {
      name = "Contributor"
    }
    # owner = {
    #   name                               = "Owner"
    #   require_multifactor_authentication = true
    # }
  }

  role_assignments_for_subscriptions = {
    lcai = {
      subscription_id = "0eeb1f61-1ac0-4249-9dfc-b716ad2dfa7b"
      role_assignments = {
        contributor = {
          role_definition = "contributor"
          groups          = ["az_contributor"]
        }
        # owner = {
        #   role_definition = "owner"
        #   groups          = ["az_contributor"]
        # }
      }
    }
  }

}