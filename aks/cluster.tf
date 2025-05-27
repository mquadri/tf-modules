# tflint-ignore: terraform_required_providers
resource "azurerm_user_assigned_identity" "aks-spn" {
  name                = "${local.naming}-${var.additionalcontext}"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.tags
}

# tflint-ignore: terraform_required_providers
resource "time_sleep" "wait_90_seconds" {
  depends_on = [azurerm_user_assigned_identity.aks-spn]

  create_duration = "90s"
}


module "avm-rbac-assignments-management" {

  depends_on = [time_sleep.wait_90_seconds]
  providers = {
    azurerm = azurerm.management
  }


  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "0.1.0"

  role_definitions = {
    lumen-subnet-joiner = {
      name  = "Lumen-Subnet-Joiner-AKS"
      scope = "/subscriptions/000bdcc8-114c-418a-ad9d-a1ac486ac658"
    }
    private_aks_dns = {
      name = "Private DNS Zone Contributor"
    }

    network_contributor = {
      name = "Network Contributor"
    }
  }

  user_assigned_managed_identities_by_principal_id = {
    aks_spn = azurerm_user_assigned_identity.aks-spn.principal_id
  }

  role_assignments_for_scopes = {
    role_assignment = {
      scope = var.private_dns_zone_id
      role_assignments = {
        lumen_subnet_joiner = {
          role_definition                  = "lumen-subnet-joiner"
          user_assigned_managed_identities = ["aks_spn"]
        }
        private_dns_zone_contributor = {
          role_definition                  = "private_aks_dns"
          user_assigned_managed_identities = ["aks_spn"]
        }
      }
    }
    role_assignment_vnet = {
      scope = data.azurerm_virtual_network.aks-vnet.id
      role_assignments = {
        network_contributor = {
          role_definition                  = "network_contributor"
          user_assigned_managed_identities = ["aks_spn"]
        }
      }
    }
  }
}