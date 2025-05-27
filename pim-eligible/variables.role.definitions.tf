variable "role_definitions" {
  type = map(object({
    id                                 = optional(string)
    name                               = optional(string)
    scope                              = optional(string)
    require_multifactor_authentication = optional(bool, false)
    require_approval                   = optional(bool, false)
    require_ticket_info                = optional(bool, false)
    approvers = optional(map(object({
      object_id = optional(string)
      type      = optional(string)
    })), {})
    additional_approver_recipients = optional(list(string), [])
    additional_assignee_recipients = optional(list(string), [])
    additional_admin_recipients    = optional(list(string), [])
  }))
  default     = {}
  nullable    = false
  description = <<DESCRIPTION
(Optional) A map of Azure Resource Manager role definitions to reference in role assignments.
The key is something unique to you. The value is a built in or custom role definition name.
Additionally we include the attributes for the optional PIM rules.

Example Input:

```hcl
role_definitions = {
  owner = {
    name = "Owner"
  }
  contributor = {
    name = "Contributor"
    require_approval = true
    approvers = {
      primary_approver = {
        object_id = "00000000-0000-0000-0000-000000000000"
        type      = "User"
      }
    }
  }
  reader = {
    name = "Reader"
    multi_factor_authentication = true
  }
  custom_role_by_name = {
    name  = "Custom Role"
    scope = "/subscriptions/00000000-0000-0000-0000-000000000000"
    requires_ticket_info = true
  }
  custom_role_by_id = {
    id = "00000000-0000-0000-0000-000000000000"
  }
}
```
DESCRIPTION
}