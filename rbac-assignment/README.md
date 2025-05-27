
> **Warning**: This module is deprecated. Please use the AVM [Azure/avm-res-authorization-roleassignment/azurerm](https://registry.terraform.io/modules/Azure/avm-res-authorization-roleassignment/azurerm/latest) module instead.

Example

```hcl
module "avm-rbac-assignments-management" {
  providers = {
    azurerm = azurerm.management
  }


  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "0.1.0"

  role_definitions = {
    lumen-subnet-joiner = {
      name  = "Lumen-Subnet-Joiner-AKS"
      scope = "/subscriptions/2cd8ed08-9bf3-5210-afc0-ce47634b2b43"
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
```


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.roleassignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_principal_id"></a> [principal\_id](#input\_principal\_id) | The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | The name of a built-in Role. Changing this forces a new resource to be created. Conflicts with role\_definition\_id. | `any` | n/a | yes |
| <a name="input_scope"></a> [scope](#input\_scope) | The scope at which the Role Assignment applies to, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM, or /providers/Microsoft.Management/managementGroups/myMG. Changing this forces a new resource to be created. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Role Assignment ID. |
| <a name="output_principal_type"></a> [principal\_type](#output\_principal\_type) | The type of the principal\_id, e.g. User, Group, Service Principal, Application, etc. |
<!-- END_TF_DOCS -->