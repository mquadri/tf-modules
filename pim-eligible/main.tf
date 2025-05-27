resource "validation_error" "error" {
  for_each  = local.role_assignments
  condition = each.value.elevated
  summary   = "Elevated Role Assignment are currently not supported"
  details   = <<EOF
Elevated Role Assignment are currently nut supported due API blocking limitations.
Please remove any of the following elevated role assignments:
${join("\n", [for role in local.elevated_roles : "- ${role}"])}
EOF
}

resource "azurerm_role_management_policy" "this" {
  depends_on         = [validation_error.error]
  for_each           = local.role_management_policies
  scope              = each.value.scope
  role_definition_id = each.value.role_definition_id


  activation_rules {
    maximum_duration                   = "PT8H"
    require_justification              = true
    require_multifactor_authentication = each.value.require_multifactor_authentication
    require_approval                   = each.value.require_approval
    require_ticket_info                = each.value.require_ticket_info
    dynamic "approval_stage" {
      for_each = each.value.require_approval ? each.value.approvers : {}
      content {
        primary_approver {
          object_id = approval_stage.value.primary_approver.object_id
          type      = approval_stage.value.primary_approver.type
        }
      }
    }
  }

  active_assignment_rules {
    expire_after                       = "P365D"
    require_justification              = true
    require_multifactor_authentication = each.value.require_multifactor_authentication

  }

  eligible_assignment_rules {
    expiration_required = true
    expire_after        = "P365D"
  }

  notification_rules {
    eligible_assignments {
      approver_notifications {
        notification_level    = "Critical"
        default_recipients    = true
        additional_recipients = each.value.additional_approver_recipients
      }
      assignee_notifications {
        notification_level    = "All"
        default_recipients    = true
        additional_recipients = each.value.additional_assignee_recipients
      }
      admin_notifications {
        notification_level    = "All"
        default_recipients    = true
        additional_recipients = each.value.additional_admin_recipients
      }
    }
    eligible_activations {
      assignee_notifications {
        notification_level    = "All"
        default_recipients    = true
        additional_recipients = each.value.additional_assignee_recipients
      }
      admin_notifications {
        notification_level    = "All"
        default_recipients    = true
        additional_recipients = each.value.additional_admin_recipients
      }
      approver_notifications {
        notification_level    = "Critical"
        default_recipients    = true
        additional_recipients = each.value.additional_approver_recipients
      }
    }
  }
}

resource "time_static" "this" {}

resource "azurerm_pim_eligible_role_assignment" "this" {
  depends_on         = [azurerm_role_management_policy.this, validation_error.error]
  for_each           = local.role_assignments
  scope              = each.value.scope
  role_definition_id = each.value.role_definition_id
  principal_id       = each.value.principal_id

  schedule {
    start_date_time = time_static.this.rfc3339
    expiration {
      duration_days = each.value.expiration_days
    }
  }

}

