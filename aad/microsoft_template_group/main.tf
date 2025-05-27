# tflint-ignore: terraform_required_providers
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

data "azuread_client_config" "current" {}

locals {
  owners = var.owners == null ? [data.azuread_client_config.current.object_id] : var.owners
}

resource "azuread_group" "group" {
  display_name     = var.group_name
  owners           = local.owners
  security_enabled = var.security_enabled
  #types            = [var.types]

  #TODO: Uncomment this block when dynamic_membership_rule is implemented
  /* dynamic "members" {
    for_each = var.members == null ? [] : [1]

    content {
      members = members.value
    }
  }

  dynamic "dynamic_membership" {
    for_each = var.dynamic_membership_rule == null ? [] : [var.dynamic_membership_rule]

    content {
      rule = dynamic_membership_rule.value["rule"]
    }
  } */
}
