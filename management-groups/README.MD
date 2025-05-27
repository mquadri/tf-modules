## Usage

- This terraform module will create Management groups hierarchy starting from Tenant root Managment group as Parent in the hierarchy. 
- As per Management group design and implementation from Microsoft there can be upto 6 level in the hierarchy tree excluding the tenant root Management group and last child subscriptions
  so place your hierarchy accorordingly in the input variable. Whichever level is not requied put empty map as input.
- [Azure Managment groups overview](https://docs.microsoft.com/en-us/azure/governance/management-groups/)

## Non Module Requirements

The following requirements are needed by this module:

-  Access and Permissions to provision Management groups : To provision the Managemt group hierarchy user or service principle should have owner/Management group contributor role assigned 
   or equivalent Permissions assigned. To move or put Management or subscriptions across management groups below three rules need to be evaluated as true. [More Details](https://docs.microsoft.com/en-us/azure/governance/management-groups/overview)
    - Management group write and Role Assignment write permissions on the child subscription or management group.Built-in role example Owner
    - Management group write access on the target parent management group. Built-in role example: Owner, Contributor, Management Group Contributor
    - Management group write access on the existing parent management group. Built-in role example: Owner, Contributor, Management Group Contributor

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
| [azurerm_management_group.l1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.l2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.l3](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.l4](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.l5](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.rootmg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/management_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_management_groups"></a> [management\_groups](#input\_management\_groups) | (Required) Gets the map of management groups and attached subscriptions | <pre>object({<br>    root_mg_id = string # Root management group ID<br>    level1_child_mg = map(object({<br>      display_name     = string                 # A friendly name for this Management Group<br>      name             = string                 # The name of the Management Group, which needs to be unique across your tenant<br>      subscription_ids = optional(list(string)) # A list of Subscription GUIDs which should be assigned to the Management Group<br><br>    }))<br>    level2_child_mg = optional(map(object({<br>      display_name     = string                 # A friendly name for this Management Group<br>      name             = string                 # The name of the Management Group, which needs to be unique across your tenant<br>      subscription_ids = optional(list(string)) # A list of Subscription GUIDs which should be assigned to the Management Group<br>      parent_key       = string                 # The Key of the Parent Management Group in Level 1<br>    })))<br>    level3_child_mg = optional(map(object({<br>      display_name     = string                 # A friendly name for this Management Group<br>      name             = string                 # The name of the Management Group, which needs to be unique across your tenant<br>      subscription_ids = optional(list(string)) # A list of Subscription GUIDs which should be assigned to the Management Group<br>      parent_key       = string                 # The Key of the Parent Management Group in Level 2<br>    })))<br>    level4_child_mg = optional(map(object({<br>      display_name     = string                 # A friendly name for this Management Group<br>      name             = string                 # The name of the Management Group, which needs to be unique across your tenant<br>      subscription_ids = optional(list(string)) # A list of Subscription GUIDs which should be assigned to the Management Group<br>      parent_key       = string                 # The Key of the Parent Management Group in Level 3<br>    })))<br>    level5_child_mg = optional(map(object({<br>      display_name     = string                 # A friendly name for this Management Group<br>      name             = string                 # The name of the Management Group, which needs to be unique across your tenant<br>      subscription_ids = optional(list(string)) # A list of Subscription GUIDs which should be assigned to the Management Group<br>      parent_key       = string                 # The Key of the Parent Management Group in Level 4<br>    })))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_level1_mgs_name_id_parent_id_list"></a> [level1\_mgs\_name\_id\_parent\_id\_list](#output\_level1\_mgs\_name\_id\_parent\_id\_list) | List containing level 1 child management groups name,id and parent id |
| <a name="output_level2_mgs_name_id_parent_id_list"></a> [level2\_mgs\_name\_id\_parent\_id\_list](#output\_level2\_mgs\_name\_id\_parent\_id\_list) | List containing level 2 child management groups name,id and parent id |
| <a name="output_level3_mgs_name_id_parent_id_list"></a> [level3\_mgs\_name\_id\_parent\_id\_list](#output\_level3\_mgs\_name\_id\_parent\_id\_list) | List containing level 3 child management groups name,id and parent id |
| <a name="output_level4_mgs_name_id_parent_id_list"></a> [level4\_mgs\_name\_id\_parent\_id\_list](#output\_level4\_mgs\_name\_id\_parent\_id\_list) | List containing level 4 child management groups name,id and parent id |
| <a name="output_level5_mgs_name_id_parent_id_list"></a> [level5\_mgs\_name\_id\_parent\_id\_list](#output\_level5\_mgs\_name\_id\_parent\_id\_list) | List containing level 5 child management groups name,id and parent id |
| <a name="output_rootmg_id"></a> [rootmg\_id](#output\_rootmg\_id) | Tenant root Management group id |
| <a name="output_rootmg_name"></a> [rootmg\_name](#output\_rootmg\_name) | Tenant root Management group Name |
<!-- END_TF_DOCS -->


## Module Usage

# Management Groups
```hcl

module "ManagementGroups" {
  source            = "../management-groups"
  management_groups = var.management_groups
}
```

# Example tfvars input

```hcl
management_groups = {

  # Level 0 Management Group
  root_mg_id = "level0"

  # Level 1 Management Groups and Subscriptions
  level1_child_mg = {
    level1a = {
      name         = "mg-level-1a"
      display_name = "mg-level-dn-1a"
    },
    level1b = {
      name         = "mg-level-1b"
      display_name = "mg-level-dn-1b"
    }
  }

  # Level 2 Management Groups and Subscriptions
  level2_child_mg = {
    level2a = {
      name         = "mg-level-2a"
      display_name = "mg-level-dn-2a"
      parent_key   = "level1a"
    },
    level2b = {
      name             = "mg-level-2b"
      display_name     = "mg-level-dn-2b"
      parent_key       = "level1b"
      subscription_ids = ["subID1" , "subID2" , "subID3"]
    }
  }

  # Level 3 Management Groups and Subscriptions
  level3_child_mg = {
    level3a = {
      name         = "mg-level-3a"
      display_name = "mg-level-dn-3a"
      parent_key   = "level2b"
      subscription_ids = ["subID4" , "subID5" , "subID6"]
    },
    level3b = {
      name         = "mg-level-3b"
      display_name = "mg-level-dn-3b"
      parent_key   = "level2a"
    }
  }

  # Level 3 Management Groups and Subscriptions
  level4_child_mg = {
    level4a = {
      name         = "mg-level-4a"
      display_name = "mg-level-dn-4a"
      parent_key   = "level3b"
    },
    level4b = {
      name         = "mg-level-4b"
      display_name = "mg-level-dn-4b"
      parent_key   = "level3b"
    }
  }

  # Level 4 Management Groups and Subscriptions
  level5_child_mg = {
    level5a = {
      name         = "mg-level-5a"
      display_name = "mg-level-dn-5a"
      parent_key   = "level4a"
    },
    level5b = {
      name         = "mg-level-5b"
      display_name = "mg-level-dn-5b"
      parent_key   = "level4a"
    }
  }
}
```